# Project Guidelines for "Wyn is Buff" Website

This document outlines the structure, design principles, and guidelines for the "Wyn is Buff" website project.

## Table of Contents
- [Project Overview](#project-overview)
- [Design Principles](#design-principles)
- [Code Standards](#code-standards)
- [Build and Development Process](#build-and-development-process)
- [Phaser Integration](#phaser-integration)
- [Future Development](#future-development)
- [Resources](#resources)

## Project Overview

The "Wyn is Buff" website is a personal website for an 8-year-old named Wyn to showcase his game "Wyn is Buff" and other cool things about him. The website features a Phaser-inspired game engine theme and is designed to be extendable for future additions.

### Key Features
- Responsive design that works on different devices
- Game-inspired UI elements and animations
- Sections for personal information, game showcase, and other cool stuff
- Interactive elements with JavaScript
- Secret area with a password (hint: the password is "buff")
- Modern build system for optimized production deployment

## Design Principles

### Visual Style
- **Game Engine Aesthetic**: The design is inspired by the Phaser game engine with pixel art elements, game-like UI components, and interactive features.
- **Color Scheme**: Uses a primary teal color (#43beac) and secondary yellow color (#f5e356) inspired by Phaser's branding, with dark blue backgrounds (#2c3e50) and light text (#ecf0f1).
- **Typography**: Uses "Press Start 2P" for headings to give a retro game feel, and "Roboto" for body text for readability.
- **Pixel Art Elements**: Incorporates pixel art styling for dividers, buttons, and decorative elements.

### User Experience
- **Playful Interaction**: The website should feel like a game, with interactive elements that respond to user actions.
- **Clear Navigation**: Despite the playful design, navigation should be intuitive and straightforward.
- **Performance**: Animations and effects should be lightweight and not impact page performance.
- **Fast Loading**: Production builds should be optimized for fast loading and rendering.

## Code Standards

### HTML
- Semantic HTML5 elements (`<header>`, `<section>`, `<footer>`, etc.)
- Proper indentation and commenting
- Descriptive class and ID names
- Accessibility considerations (alt text for images, ARIA attributes where needed)

### CSS
- CSS variables for consistent theming
- Mobile-first responsive design
- Organized by component
- Clear comments for complex styling
- Autoprefixer for browser compatibility

### JavaScript
- Clean, well-commented code
- Event-driven architecture
- Function-based organization
- Progressive enhancement (site works without JavaScript)
- ESLint for code quality and consistency

## Build and Development Process

### Development Workflow
- Use `npm run dev` for local development with hot reloading
- Follow ESLint rules for consistent code style
- Test across multiple browsers and devices

### Build Process
- The project uses Parcel for bundling and optimization
- Production builds are created with `npm run build`
- Build process includes:
  - JavaScript bundling and minification
  - CSS processing with PostCSS and autoprefixer
  - HTML optimization
  - Image optimization
  - Asset management

### Deployment Strategy
- **Automated Deployment Script**: Use the `deploy.sh` script for a streamlined deployment process:
  - Automatically commits and pushes changes to the main branch
  - Builds the project with Parcel
  - Creates/updates a `deploy` branch with the built files
  - Pushes the `deploy` branch to GitHub
  - Features Phaser-themed output messages for a game-like experience
- **GitHub Pages Deployment**: The `deploy` branch is structured for GitHub Pages hosting
- **CI/CD Integration**: The project includes GitHub Actions workflow for automated deployments
- **Testing**: Always test the deployed site for performance and functionality

### Performance Considerations
- Keep JavaScript bundles small
- Optimize images before adding them to the project
- Use lazy loading for non-critical resources
- Minimize HTTP requests
- Leverage browser caching

## Phaser Integration

The website is designed with a Phaser game engine theme, but doesn't currently include the actual Phaser library. For future integration with Phaser games:

### Adding Phaser to the Project
1. Install Phaser as a dependency:
   ```bash
   npm install phaser
   ```

2. Import Phaser in your JavaScript:
   ```javascript
   import Phaser from 'phaser';
   ```

3. Create a game container in the HTML:
   ```html
   <div id="game-container"></div>
   ```

4. Initialize a Phaser game in script.js:
   ```javascript
   const config = {
     type: Phaser.AUTO,
     width: 800,
     height: 600,
     parent: 'game-container',
     scene: {
       preload: preload,
       create: create,
       update: update
     }
   };

   const game = new Phaser.Game(config);

   function preload() {
     // Load game assets
   }

   function create() {
     // Create game objects
   }

   function update() {
     // Game loop
   }
   ```

### Phaser Resources
- [Phaser Official Documentation](https://phaser.io/docs)
- [Phaser Examples](https://phaser.io/examples)
- [Phaser GitHub Repository](https://github.com/photonstorm/phaser)

## Future Development

The website is designed to be extendable. Here are some ideas for future development:

### Content Expansion
- **Blog Section**: Add a blog for Wyn to share updates about his games and activities
- **Gallery**: Expand the cool stuff section with a proper image gallery
- **Game Downloads**: Add actual downloadable games when available

### Technical Enhancements
- **Content Management System**: Integrate a simple CMS for easier content updates
- **User Accounts**: Add user accounts for friends to leave comments
- **Game Integration**: Embed playable Phaser games directly in the website
- **Achievements System**: Add unlockable achievements for website interaction
- **Progressive Web App**: Convert to a PWA for offline capabilities

### Design Evolution
- **Theme Switcher**: Allow users to switch between different color themes
- **Animated Character**: Replace the emoji character with an animated sprite
- **Custom Pixel Art**: Replace CSS patterns with custom pixel art backgrounds

## Resources

### Official Documentation
- [HTML5 Specification](https://html.spec.whatwg.org/)
- [CSS Documentation](https://developer.mozilla.org/en-US/docs/Web/CSS)
- [JavaScript Documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
- [Phaser Documentation](https://phaser.io/docs)
- [Parcel Documentation](https://parceljs.org/docs/)
- [ESLint Documentation](https://eslint.org/docs/user-guide/)

### Design Resources
- [Google Fonts](https://fonts.google.com/)
- [Pixel Art Tools](https://www.piskelapp.com/)
- [Color Palette Generator](https://coolors.co/)

### Learning Resources
- [MDN Web Docs](https://developer.mozilla.org/)
- [Phaser Tutorials](https://phaser.io/learn)
- [CSS-Tricks](https://css-tricks.com/)
- [JavaScript.info](https://javascript.info/)