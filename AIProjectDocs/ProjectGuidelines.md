# Project Guidelines for "Wyn is Buff" Website

This document outlines the structure, design principles, and guidelines for the "Wyn is Buff" website project.

## Table of Contents
- [Project Overview](#project-overview)
- [Design Principles](#design-principles)
- [Code Standards](#code-standards)
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
- Prefixed animations for browser compatibility

### JavaScript
- Clean, well-commented code
- Event-driven architecture
- Function-based organization
- Progressive enhancement (site works without JavaScript)
- No external dependencies (vanilla JavaScript)

## Phaser Integration

The website is designed with a Phaser game engine theme, but doesn't currently include the actual Phaser library. For future integration with Phaser games:

### Adding Phaser to the Project
1. Include the Phaser library:
   ```html
   <script src="https://cdn.jsdelivr.net/npm/phaser@3.55.2/dist/phaser.min.js"></script>
   ```

2. Create a game container in the HTML:
   ```html
   <div id="game-container"></div>
   ```

3. Initialize a Phaser game in script.js:
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

### Design Resources
- [Google Fonts](https://fonts.google.com/)
- [Pixel Art Tools](https://www.piskelapp.com/)
- [Color Palette Generator](https://coolors.co/)

### Learning Resources
- [MDN Web Docs](https://developer.mozilla.org/)
- [Phaser Tutorials](https://phaser.io/learn)
- [CSS-Tricks](https://css-tricks.com/)