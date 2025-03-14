# API Usage Guide for "Wyn is Buff" Website

This document provides information about the JavaScript API and functions available for extending the "Wyn is Buff" website.

## Table of Contents
- [Overview](#overview)
- [Core Functions](#core-functions)
- [Animation API](#animation-api)
- [Interactive Elements API](#interactive-elements-api)
- [Secret Area API](#secret-area-api)
- [Future API Integration](#future-api-integration)

## Overview

The website includes a JavaScript API that can be used to add new features, animations, and interactive elements. This document outlines the available functions and how to use them.

## Core Functions

### Website Initialization

The website is initialized with the following function:

```javascript
function initWebsite() {
    // Add scroll animation for stats bars
    initStatsAnimation();
    
    // Add hover effects for game features
    initFeatureEffects();
    
    // Add pixel animation effects
    addPixelEffects();
    
    // Initialize the secret area functionality
    initSecretArea();
    
    // Add console welcome message (for developers)
    console.log('%c Welcome to Wyn\'s Website! 🎮', 'color: #43beac; font-size: 20px; font-weight: bold;');
    console.log('%c Made by Wyn who is BUFF! 💪', 'color: #f5e356; font-size: 16px;');
}
```

To add new initialization steps, you can extend this function or call your custom initialization function from here.

### DOM Ready Event

The website uses the following pattern to ensure the DOM is fully loaded before initializing:

```javascript
document.addEventListener('DOMContentLoaded', function() {
    // Initialize the website with animations and interactive elements
    initWebsite();
});
```

If you're adding new JavaScript files, make sure to follow this pattern or include your scripts with the `defer` attribute.

## Animation API

### Stats Animation

The stats bars are animated when they come into view using the Intersection Observer API:

```javascript
function initStatsAnimation() {
    const stats = document.querySelectorAll('.stat-fill');
    
    // Create an intersection observer
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            // If the stat bar is visible
            if (entry.isIntersecting) {
                // Get the width from the style attribute
                const width = entry.target.style.width;
                
                // Animate from 0 to the target width
                entry.target.style.width = '0';
                setTimeout(() => {
                    entry.target.style.width = width;
                }, 200);
                
                // Stop observing after animation
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.5 });
    
    // Observe each stat bar
    stats.forEach(stat => {
        observer.observe(stat);
    });
}
```

You can use this pattern to create similar animations for other elements.

### Pixel Particles

The website creates floating pixel particles with the following function:

```javascript
function createPixelParticles() {
    const container = document.querySelector('.game-container');
    const particleCount = 20;
    
    for (let i = 0; i < particleCount; i++) {
        const particle = document.createElement('div');
        particle.className = 'pixel-particle';
        
        // Random size between 4px and 8px
        const size = Math.floor(Math.random() * 5) + 4;
        particle.style.width = `${size}px`;
        particle.style.height = `${size}px`;
        
        // Random color (primary or secondary)
        const colors = ['#43beac', '#f5e356'];
        const colorIndex = Math.floor(Math.random() * colors.length);
        particle.style.backgroundColor = colors[colorIndex];
        
        // Random position
        const posX = Math.floor(Math.random() * 100);
        const posY = Math.floor(Math.random() * 100);
        particle.style.left = `${posX}%`;
        particle.style.top = `${posY}%`;
        
        // Random animation duration between 10s and 30s
        const duration = Math.floor(Math.random() * 20) + 10;
        particle.style.animation = `floatParticle ${duration}s linear infinite`;
        
        // Random delay
        const delay = Math.floor(Math.random() * 10);
        particle.style.animationDelay = `${delay}s`;
        
        // Add to container
        container.appendChild(particle);
    }
    
    // Add the animation keyframes to the stylesheet
    const style = document.createElement('style');
    style.textContent = `
        @keyframes floatParticle {
            0% { transform: translate(0, 0); }
            25% { transform: translate(20px, 20px); }
            50% { transform: translate(0, 40px); }
            75% { transform: translate(-20px, 20px); }
            100% { transform: translate(0, 0); }
        }
        
        .pixel-particle {
            position: absolute;
            pointer-events: none;
            opacity: 0.5;
            z-index: -1;
        }
    `;
    document.head.appendChild(style);
}
```

You can modify this function to create different types of particles or visual effects.

## Interactive Elements API

### Feature Hover Effects

The website adds hover effects to game features with the following function:

```javascript
function initFeatureEffects() {
    const features = document.querySelectorAll('.feature');
    
    features.forEach(feature => {
        feature.addEventListener('mouseenter', () => {
            feature.style.transform = 'scale(1.1)';
            feature.style.transition = 'transform 0.3s ease';
        });
        
        feature.addEventListener('mouseleave', () => {
            feature.style.transform = 'scale(1)';
        });
    });
}
```

You can use this pattern to add hover effects to other elements.

### Smooth Scrolling

The website implements smooth scrolling for navigation links:

```javascript
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});
```

## Secret Area API

The website includes a secret area that can be accessed with a password:

```javascript
function initSecretArea() {
    const secretButton = document.querySelector('.secret-icon').parentElement.querySelector('.pixel-button');
    
    if (secretButton) {
        secretButton.addEventListener('click', (e) => {
            e.preventDefault();
            
            // Create a simple "password" prompt
            const password = prompt('Enter the secret code:');
            
            if (password && password.toLowerCase() === 'buff') {
                alert('🎮 SECRET UNLOCKED! 🎮\n\nYou found the secret area! More cool stuff coming soon!');
                
                // Add a special effect to the page
                document.body.classList.add('secret-unlocked');
                
                // Add a temporary rainbow effect
                const style = document.createElement('style');
                style.textContent = `
                    .secret-unlocked {
                        animation: rainbow-bg 5s linear;
                    }
                    
                    @keyframes rainbow-bg {
                        0% { background-color: #ff0000; }
                        20% { background-color: #ff9900; }
                        40% { background-color: #ffff00; }
                        60% { background-color: #00ff00; }
                        80% { background-color: #0099ff; }
                        100% { background-color: #2c3e50; }
                    }
                `;
                document.head.appendChild(style);
                
                // Remove the effect after animation completes
                setTimeout(() => {
                    document.body.classList.remove('secret-unlocked');
                }, 5000);
            } else if (password) {
                alert('Wrong code! Try again!');
            }
        });
    }
}
```

You can extend this function to add more secret areas or unlock different features.

## Future API Integration

### Phaser Game Integration

To integrate a Phaser game into the website, you can use the following pattern:

```javascript
function initPhaserGame() {
    // Check if Phaser is loaded
    if (typeof Phaser === 'undefined') {
        console.error('Phaser is not loaded. Make sure to include the Phaser library.');
        return;
    }
    
    // Game configuration
    const config = {
        type: Phaser.AUTO,
        width: 800,
        height: 600,
        parent: 'game-frame', // The ID of the container element
        scene: {
            preload: preload,
            create: create,
            update: update
        }
    };
    
    // Create a new Phaser game instance
    const game = new Phaser.Game(config);
    
    // Preload game assets
    function preload() {
        // this.load.image('character', 'images/character.png');
    }
    
    // Create game objects
    function create() {
        // this.add.image(400, 300, 'character');
    }
    
    // Game loop
    function update() {
        // Update game logic
    }
}
```

### External API Integration

To integrate external APIs (e.g., for a blog or gallery), you can use the Fetch API:

```javascript
async function fetchBlogPosts() {
    try {
        const response = await fetch('https://api.example.com/blog-posts');
        const data = await response.json();
        
        // Process the data
        displayBlogPosts(data);
    } catch (error) {
        console.error('Error fetching blog posts:', error);
    }
}

function displayBlogPosts(posts) {
    const container = document.querySelector('.blog-container');
    
    posts.forEach(post => {
        const postElement = document.createElement('article');
        postElement.className = 'blog-post';
        
        postElement.innerHTML = `
            <h3>${post.title}</h3>
            <p class="post-date">${new Date(post.date).toLocaleDateString()}</p>
            <div class="post-content">${post.content}</div>
        `;
        
        container.appendChild(postElement);
    });
}
```

## Version Information

- Current API Version: 1.0.0
- Last Updated: March 2025