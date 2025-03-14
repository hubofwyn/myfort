# Installation Guide for "Wyn is Buff" Website

This document provides instructions for setting up and running the "Wyn is Buff" website.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation Steps](#installation-steps)
- [Running the Website](#running-the-website)
- [File Structure](#file-structure)
- [Customization](#customization)

## Prerequisites

To run this website, you need:
- A modern web browser (Chrome, Firefox, Safari, Edge)
- A text editor for making changes (optional)
- Basic knowledge of HTML, CSS, and JavaScript for customization (optional)

## Installation Steps

1. **Download or Clone the Repository**
   - Download the ZIP file and extract it, or
   - Clone the repository using Git:
     ```
     git clone https://github.com/wyn/wynisbuff-website.git
     ```

2. **No Build Process Required**
   - This is a static website that doesn't require any build process or dependencies.

## Running the Website

1. **Using the Included npm Script (Recommended)**
   - The project includes http-server for local development
   - Run the following command in the project directory:
     ```
     npm start
     ```
   - This will start the server and automatically open the website in your default browser

2. **Alternative Methods**

   a. **Open the Website Locally**
      - Navigate to the project folder
      - Double-click on `index.html` or open it with your web browser
      - Note: Some features may not work correctly when opened directly from the file system

   b. **Using Python's Built-in Server**
      - For a quick server without npm:
        ```
        # Python 3
        python -m http.server
        
        # Python 2
        python -m SimpleHTTPServer
        ```
      - Then open your browser and navigate to `http://localhost:8000`

## File Structure

```
wynisbuff-website/
├── index.html          # Main HTML file
├── css/
│   └── styles.css      # CSS styles for the website
├── js/
│   └── script.js       # JavaScript functionality
└── AIProjectDocs/      # Documentation folder
    ├── Installation.md # This installation guide
    └── ProjectGuidelines.md # Project guidelines and structure
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

## Version Information

- Current Version: 1.0.0
- Last Updated: March 2025