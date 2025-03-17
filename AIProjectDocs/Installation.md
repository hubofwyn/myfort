# Installation Guide for "Wyn is Buff" Website

This document provides instructions for setting up, building, and running the "Wyn is Buff" website.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation Steps](#installation-steps)
- [Development Workflow](#development-workflow)
- [Build Process](#build-process)
- [Deployment](#deployment)
- [File Structure](#file-structure)
- [Customization](#customization)

## Prerequisites

To run this website, you need:
- Node.js (v14.0.0 or higher)
- npm (v6.0.0 or higher)
- A modern web browser (Chrome, Firefox, Safari, Edge)
- A text editor for making changes (optional)
- Basic knowledge of HTML, CSS, and JavaScript for customization (optional)

## Installation Steps

1. **Download or Clone the Repository**
   - Download the ZIP file and extract it, or
   - Clone the repository using Git:
     ```
     git clone https://github.com/hubofwyn/myfort.git
     ```

2. **Install Dependencies**
   - Navigate to the project directory and run:
     ```
     npm install
     ```
   - This will install all the necessary dependencies for development and building.

## Development Workflow

1. **Start the Development Server**
   - Run the following command to start the development server with hot reloading:
     ```
     npm run dev
     ```
   - This will start Parcel's development server and automatically open the website in your default browser
   - Any changes you make to the source files will automatically refresh the browser

2. **Linting JavaScript**
   - To check your JavaScript code for errors and style issues:
     ```
     npm run lint
     ```
   - To automatically fix linting issues:
     ```
     npm run lint:fix
     ```

3. **Optimizing Images**
   - To optimize images for production:
     ```
     npm run optimize-images
     ```

## Build Process

1. **Creating a Production Build**
   - To create an optimized production build:
     ```
     npm run build
     ```
   - This will:
     - Bundle and minify all JavaScript
     - Process and optimize CSS
     - Optimize HTML
     - Copy and process assets
     - Output everything to the `dist` directory

2. **Previewing the Production Build**
   - To preview the production build locally:
     ```
     npm run preview
     ```
   - This will serve the contents of the `dist` directory and open it in your browser

3. **Cleaning Build Files**
   - To remove previous build files and caches:
     ```
     npm run clean
     ```

## Deployment

1. **Preparing for Deployment**
   - Run `npm run build` to create an optimized production build
   - The contents of the `dist` directory are ready for deployment

2. **Using the Deployment Script**
   - The project includes a Phaser-themed deployment script that automates the entire deployment process
   - Make the script executable (if needed):
     ```
     chmod +x deploy.sh
     ```
   - Run the script:
     ```
     ./deploy.sh
     ```
   - The script will:
     - Automatically generate a fun Phaser-themed commit message with date and time
     - Commit and push your changes to the main branch
     - Build the project using Parcel
     - Create/update a `deploy` branch with the built files
     - Push the `deploy` branch to GitHub

3. **Manual Deployment Options**
   - **Web Hosting**: Upload the contents of the `dist` directory to your web hosting service
   - **GitHub Pages**: Deploy the `dist` directory to GitHub Pages
   - **Netlify/Vercel**: Connect your repository for automatic deployment, or manually upload the `dist` directory

## File Structure

```
myfort/
├── index.html          # Main HTML file
├── css/
│   └── styles.css      # CSS styles for the website
├── js/
│   └── script.js       # JavaScript functionality
├── images/             # Image assets
├── AIProjectDocs/      # Documentation folder
├── deploy.sh           # Deployment script with Phaser theme
├── .eslintrc.json      # ESLint configuration
├── .parcelrc           # Parcel configuration
├── postcss.config.js   # PostCSS configuration
├── package.json        # Project configuration and dependencies
└── .gitignore          # Git ignore rules
```

## Customization

The website is designed to be easily customizable:

1. **Content Customization**
   - Edit the `index.html` file to change text, sections, and links

2. **Style Customization**
   - Modify `css/styles.css` to change colors, fonts, and layouts
   - The main color scheme is defined at the top of the CSS file using CSS variables

3. **Functionality Customization**
   - Edit `js/script.js` to modify animations and interactive elements

4. **Adding New Pages**
   - Create new HTML files in the root directory
   - Link to them from the main page
   - They will be automatically processed during the build

## Version Information

- Current Version: 1.0.0
- Last Updated: March 2025