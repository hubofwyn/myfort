// Wait for the DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    // Initialize the website with animations and interactive elements
    initWebsite();
});

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

// Animate the stats bars when they come into view
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

// Add hover effects for game features
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

// Add pixel-style effects to the page
function addPixelEffects() {
    // Create pixel particles that float around the page
    createPixelParticles();
    
    // Add glitch effect to the game logo on hover
    const logo = document.querySelector('.game-logo');
    if (logo) {
        logo.addEventListener('mouseenter', () => {
            logo.classList.add('glitch-effect');
        });
        
        logo.addEventListener('mouseleave', () => {
            logo.classList.remove('glitch-effect');
        });
    }
}

// Create floating pixel particles
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

// Initialize the secret area functionality
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

// Add smooth scrolling for navigation links
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