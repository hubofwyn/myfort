#!/bin/bash

# ======================================================
# MYFORT DEPLOYMENT SCRIPT
# ======================================================
# This script handles the deployment process for Wyn's website:
# 1. Commits and pushes changes to the main branch
# 2. Builds the project using Parcel
# 3. Creates/updates the deploy branch with the built files
# 4. Pushes the deploy branch to GitHub
# ======================================================

# Text styling
BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Phaser-themed messages
function phaser_log() {
  echo -e "${CYAN}${BOLD}[PHASER ENGINE]${NC} $1"
}

function phaser_success() {
  echo -e "${GREEN}${BOLD}[PHASER SUCCESS]${NC} $1"
}

function phaser_warning() {
  echo -e "${YELLOW}${BOLD}[PHASER WARNING]${NC} $1"
}

function phaser_error() {
  echo -e "${RED}${BOLD}[PHASER ERROR]${NC} $1"
  exit 1
}

# Check if we're in a git repository
if [ ! -d .git ]; then
  phaser_error "Game initialization failed! This directory is not a Git repository."
fi

# Display welcome message
echo -e "${BLUE}${BOLD}"
echo "==============================================="
echo "  MYFORT DEPLOYMENT - POWERED BY PHASER ENGINE"
echo "==============================================="
echo -e "${NC}"

# Generate a fun Phaser-themed commit message with date and time
generate_phaser_message() {
  local phrases=(
    "Level Up! Game assets optimized"
    "New high score! Code quality improved"
    "Boss battle won! Features completed"
    "Power-up acquired! Performance enhanced"
    "Secret area unlocked! Easter eggs added"
    "Achievement unlocked! Bugs defeated"
    "Checkpoint reached! Progress saved"
    "Combo move! Multiple fixes applied"
    "Extra life! Stability improved"
    "Bonus round! UI polished"
    "Cheat code activated! Development shortcuts added"
    "Final boss approaching! Major update"
    "Game saved! Backup created"
  )
  
  # Get a random phrase
  local random_index=$((RANDOM % ${#phrases[@]}))
  local random_phrase="${phrases[$random_index]}"
  
  # Format date and time
  local datetime=$(date "+%Y-%m-%d %H:%M:%S")
  
  echo "[$datetime] $random_phrase"
}

# Generate commit message
commit_message=$(generate_phaser_message)
phaser_log "Generated commit message: \"$commit_message\""

# Step 1: Commit and push changes to main branch
phaser_log "LEVEL 1: Saving game progress to main branch..."

git add .
if [ $? -ne 0 ]; then
  phaser_error "Failed to add files to git staging area!"
fi

git commit -m "$commit_message"
if [ $? -ne 0 ]; then
  phaser_warning "No changes to commit or commit failed. Continuing anyway..."
fi

# Try to push, if it fails, pull and then push
if ! git push origin main; then
  phaser_warning "Remote has changes. Pulling changes first..."
  
  # Stash any uncommitted changes (just in case)
  git stash
  
  # Pull changes from remote
  if ! git pull --rebase origin main; then
    phaser_error "Failed to pull changes from remote. Please resolve conflicts manually."
  fi
  
  # Apply stashed changes (if any)
  git stash pop 2>/dev/null || true
  
  # Try pushing again
  if ! git push origin main; then
    phaser_error "Failed to push to main branch! Check your connection and permissions."
  fi
  
  phaser_success "Changes merged and pushed successfully!"
fi

phaser_success "Main branch updated successfully! Achievement unlocked: Code Pusher"

# Step 2: Build the project
phaser_log "LEVEL 2: Building game assets..."

# Clean previous build files
phaser_log "Cleaning previous build files..."
if [ -d "dist" ]; then
  rm -rf dist
fi
if [ -d ".parcel-cache" ]; then
  rm -rf .parcel-cache
fi
phaser_success "Clean completed!"

# Ensure dependencies are installed
phaser_log "Installing dependencies..."
npm install
if [ $? -ne 0 ]; then
  phaser_warning "Dependency installation had issues, but continuing with build..."
fi

# Build the project
phaser_log "Building the project with Parcel..."
# Use npm run build which is configured in package.json
npm run build

if [ $? -ne 0 ]; then
  phaser_error "Build failed! Check your code for errors."
fi

# Verify the dist directory exists and has content
if [ ! -d "dist" ] || [ -z "$(ls -A dist)" ]; then
  phaser_error "Build directory 'dist' does not exist or is empty. Build process may have failed."
fi

phaser_success "Build completed successfully! Achievement unlocked: Master Builder"

# Step 3: Create a temporary directory for the build files
phaser_log "LEVEL 3: Creating temporary storage for game assets..."

# Create a temporary directory
temp_dir=$(mktemp -d)
if [ $? -ne 0 ]; then
  phaser_error "Failed to create temporary directory!"
fi

# Copy build files to the temporary directory
cp -r dist/* "$temp_dir/"
if [ $? -ne 0 ]; then
  phaser_error "Failed to copy build files to temporary directory!"
fi

# Copy deployment guide to the temporary directory
if [ -f "deployment_guide.md" ]; then
  cp deployment_guide.md "$temp_dir/"
  phaser_log "Deployment guide added to temporary storage!"
fi

phaser_success "Game assets safely stored! Achievement unlocked: Data Keeper"

# Step 4: Switch to deploy branch
phaser_log "LEVEL 4: Preparing deployment portal..."

# Save the current branch name
current_branch=$(git symbolic-ref --short HEAD)

# Check if deploy branch exists
if git show-ref --verify --quiet refs/heads/deploy; then
  # Deploy branch exists, switch to it
  git checkout deploy
  if [ $? -ne 0 ]; then
    rm -rf "$temp_dir"  # Clean up temporary directory
    phaser_error "Failed to switch to deploy branch!"
  fi
  
  # Clean the deploy branch, keeping only .git
  find . -mindepth 1 -not -path "./.git*" -delete
else
  # Create and switch to a new deploy branch
  git checkout --orphan deploy
  if [ $? -ne 0 ]; then
    rm -rf "$temp_dir"  # Clean up temporary directory
    phaser_error "Failed to create deploy branch!"
  fi
  
  # Remove all files from the working directory
  git rm -rf . > /dev/null 2>&1
fi

phaser_success "Deploy branch prepared! Achievement unlocked: Branch Master"

# Step 5: Copy build files from temporary directory to deploy branch
phaser_log "LEVEL 5: Transferring game assets to deployment portal..."

# Copy all files from temporary directory to the deploy branch
cp -r "$temp_dir"/* .
if [ $? -ne 0 ]; then
  rm -rf "$temp_dir"  # Clean up temporary directory
  phaser_error "Failed to copy build files to deploy branch!"
fi

# Clean up temporary directory
rm -rf "$temp_dir"

# Add a .nojekyll file to bypass Jekyll processing on GitHub Pages
touch .nojekyll

# Create a simple README for the deploy branch
cat > README.md << EOL
# Wyn's MyFort - Deployed Version

This branch contains the built version of Wyn's personal website.
The source code is available in the main branch.

Last deployed: $(date)
EOL

# Create deployment guide if it doesn't exist
if [ ! -f "deployment_guide.md" ]; then
  phaser_warning "deployment_guide.md not found. Creating a basic one..."
  cat > deployment_guide.md << EOL
# Deployment Guide for Wyn's MyFort Website

This is a standard static website that can be hosted on any web server without special configuration.

## Structure
- index.html - Main entry point
- assets/ - Directory containing bundled assets (CSS, JS, images)
- .nojekyll - File to bypass Jekyll processing on GitHub Pages

Last updated: $(date)
EOL
fi

phaser_success "Game assets transferred! Achievement unlocked: Asset Manager"

# Step 6: Commit and push the deploy branch
phaser_log "LEVEL 6: Publishing game to the world..."

git add .
git commit -m "Deploy: $commit_message"
if [ $? -ne 0 ]; then
  phaser_error "Failed to commit to deploy branch!"
fi

# Force push to deploy branch with error handling
if ! git push -f origin deploy; then
  phaser_warning "Failed to push deploy branch on first attempt. Retrying..."
  
  # Wait a moment and try again
  sleep 2
  
  if ! git push -f origin deploy; then
    phaser_error "Failed to push deploy branch! Check your connection and permissions."
  fi
fi

phaser_success "Deploy branch pushed successfully! Achievement unlocked: Deployment Hero"

# Step 7: Switch back to the original branch
phaser_log "Returning to development world..."
git checkout "$current_branch"
if [ $? -ne 0 ]; then
  phaser_warning "Failed to switch back to $current_branch branch. Please do this manually."
fi

# Final success message
echo -e "${GREEN}${BOLD}"
echo "=================================================="
echo "  DEPLOYMENT COMPLETE - ALL ACHIEVEMENTS UNLOCKED!"
echo "=================================================="
echo -e "${NC}"
phaser_log "Your game is now live on the deploy branch!"
phaser_log "Visit: https://hubofwyn.github.io/myfort/"
echo ""
phaser_log "GAME STATS:"
echo -e "${CYAN}Commit:${NC} $commit_message"
echo -e "${CYAN}Branch:${NC} deploy"
echo -e "${CYAN}Date:${NC} $(date)"
echo ""
phaser_log "Press any key to continue your development adventure..."
read -n 1 -s