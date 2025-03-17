# Deployment Guide for "Wyn is Buff" Website

This document provides detailed information about the deployment process for the "Wyn is Buff" website, including the automated deployment script and various deployment options.

## Table of Contents
- [Deployment Script](#deployment-script)
  - [Overview](#overview)
  - [Features](#features)
  - [Usage](#usage)
  - [How It Works](#how-it-works)
- [Deployment Branches](#deployment-branches)
- [GitHub Pages Deployment](#github-pages-deployment)
- [CI/CD Integration](#cicd-integration)
- [Manual Deployment Options](#manual-deployment-options)
- [Troubleshooting](#troubleshooting)

## Deployment Script

### Overview

The project includes a Phaser-themed deployment script (`deploy.sh`) that automates the entire deployment process. This script handles committing changes, building the project, and deploying it to a dedicated branch.

### Features

- **Automated Git Operations**: Commits and pushes changes to the main branch
- **Build Process**: Automatically runs the build process using Parcel
- **Deploy Branch Management**: Creates or updates the `deploy` branch with the built files
- **Phaser-Themed Output**: Provides game-like feedback with achievements and level progression
- **Robust Error Handling**:
  - Handles remote repository conflicts by automatically pulling changes
  - Stashes and reapplies local changes when needed
  - Includes comprehensive error checking and user-friendly error messages
  - Implements retry mechanisms for network-related issues
- **State Preservation**: Returns to the original branch after deployment

### Usage

1. **Make the script executable** (if needed):
   ```bash
   chmod +x deploy.sh
   ```

2. **Run the script**:
   ```bash
   ./deploy.sh
   ```
   
   The script automatically generates a fun Phaser-themed commit message that includes the current date and time.

3. **Follow the on-screen instructions** as the script progresses through the deployment "levels"

### How It Works

The deployment script operates in several stages, presented as "levels" in the Phaser theme:

1. **LEVEL 1: Saving game progress to main branch**
   - Automatically generates a fun Phaser-themed commit message with date and time
   - Adds all changes to git staging
   - Commits changes with the generated message
   - Attempts to push changes to the main branch
   - If the push fails due to remote changes, the script:
     - Stashes any uncommitted changes
     - Pulls and rebases with remote changes
     - Reapplies stashed changes
     - Attempts to push again

2. **LEVEL 2: Building game assets**
   - Cleans previous build files by directly removing the `dist` and `.parcel-cache` directories
   - Builds the project using one of these methods (in order of preference):
     - `npx parcel build` if npx is available
     - Local parcel binary if found in node_modules
     - `npm run build` as a fallback
   - This creates optimized files in the `dist` directory

3. **LEVEL 3: Preparing deployment portal**
   - Saves the current branch name
   - Checks if the deploy branch exists
   - If it exists, switches to it and cleans all files except .git
   - If it doesn't exist, creates a new orphan branch

4. **LEVEL 4: Transferring game assets to deployment portal**
   - Copies all files from the `dist` directory to the root of the deploy branch
   - Adds a `.nojekyll` file to bypass Jekyll processing on GitHub Pages
   - Creates a README.md file with deployment information

5. **LEVEL 5: Publishing game to the world**
   - Commits the changes to the deploy branch
   - Force pushes the deploy branch to GitHub
   - Includes retry mechanism for network-related issues
   - Returns to the original branch

## Deployment Branches

The project uses two main branches for deployment:

1. **main**: Contains the source code and development files
2. **deploy**: Contains only the built files ready for deployment

The `deploy` branch has a standard static website structure that most web servers can serve without special configuration:

```
/
├── index.html           # Main entry point
├── assets/              # Directory containing bundled assets
│   ├── index-[hash].css # CSS files with cache busting
│   ├── index-[hash].js  # JavaScript files with cache busting
│   └── (other assets)   # Images and other resources
├── .nojekyll            # File to bypass Jekyll processing on GitHub Pages
└── README.md            # Information about the deployed version
```

## GitHub Pages Deployment

The `deploy` branch is specifically structured for GitHub Pages hosting:

1. The built files are placed at the root of the branch
2. A `.nojekyll` file is included to bypass Jekyll processing
3. The structure follows GitHub Pages requirements

To view the deployed site on GitHub Pages, visit:
https://hubofwyn.github.io/myfort/

## CI/CD Integration

The project includes a GitHub Actions workflow for automated deployments:

- The workflow is defined in `.github/workflows/deploy.yml`
- It automatically deploys changes pushed to the main branch
- The workflow uses a reusable workflow from the kids-deploy-actions repository
- It deploys to the specified target directory on the server

## Manual Deployment Options

In addition to the automated script and CI/CD, you can deploy the site manually:

1. **Web Hosting**:
   - Run `npm run build` to create the production build
   - Upload the contents of the `dist` directory to your web hosting service

2. **Netlify/Vercel**:
   - Connect your repository for automatic deployment
   - Configure the build command as `npm run build`
   - Set the publish directory to `dist`

## Troubleshooting

If you encounter issues with the deployment script:

1. **Permission Denied**:
   - Make sure the script is executable: `chmod +x deploy.sh`

2. **Git Authentication Issues**:
   - Ensure you have the proper SSH keys or credentials set up
   - Check that you have write access to the repository

3. **Remote Repository Conflicts**:
   - The script now automatically handles remote conflicts by pulling changes
   - If you still encounter issues, manually run:
     ```bash
     git pull --rebase origin main
     ```
   - Resolve any conflicts, then run the script again

4. **Build Failures**:
   - The script now tries multiple methods to run Parcel:
     - Using npx
     - Using the local Parcel binary
     - Using npm run build
   - If builds still fail:
     - Ensure Parcel is installed: `npm install`
     - Run `npx parcel build index.html --public-url ./` separately to see detailed error messages
     - Fix any code issues and try again

5. **Deploy Branch Issues**:
   - If the script fails during deploy branch operations, you can manually:
     ```bash
     git checkout main
     git branch -D deploy
     git checkout --orphan deploy
     git rm -rf .
     ```
     Then run the script again

6. **Network-Related Push Failures**:
   - The script now includes retry mechanisms for network issues
   - If pushes consistently fail, check your internet connection
   - Verify that GitHub is accessible from your network

7. **GitHub Pages Not Updating**:
   - GitHub Pages may take a few minutes to reflect changes
   - Check the GitHub repository settings to ensure GitHub Pages is enabled and using the correct branch