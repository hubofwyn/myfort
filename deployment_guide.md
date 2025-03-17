# Deployment Guide for Wyn's MyFort Website

This guide provides instructions for hosting the Wyn's MyFort website on a web server.

## Standard Static Website Structure

This is a standard static website with the following structure:

```
/
├── index.html           # Main entry point
├── assets/              # Directory containing bundled assets
│   ├── index-[hash].css # CSS files with cache busting
│   ├── index-[hash].js  # JavaScript files with cache busting
│   └── (other assets)   # Images and other resources
├── .nojekyll            # File to bypass Jekyll processing on GitHub Pages
├── README.md            # Information about the deployed version
└── deployment_guide.md  # This file
```

## Hosting Requirements

This website can be hosted on any standard web server without special configuration:

1. **Web Server**: Apache, Nginx, or any standard static file server
2. **No Server-Side Processing**: The site is entirely client-side and doesn't require PHP, Node.js, or any other server-side processing
3. **No Database**: The site doesn't require a database

## Hosting Instructions

### General Web Server

1. Upload all files and directories to your web server's root directory or a subdirectory
2. Ensure the web server is configured to serve `index.html` as the default file
3. No special server configuration is needed beyond serving static files

### Apache Configuration

For Apache servers, the following configuration is recommended:

```apache
<Directory /path/to/website>
    Options -Indexes +FollowSymLinks
    AllowOverride All
    Require all granted
</Directory>
```

### Nginx Configuration

For Nginx servers, the following configuration is recommended:

```nginx
server {
    listen 80;
    server_name your-domain.com;
    root /path/to/website;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }
}
```

### GitHub Pages

This website is already structured for GitHub Pages hosting:

1. The built files are placed at the root of the branch
2. A `.nojekyll` file is included to bypass Jekyll processing
3. The structure follows GitHub Pages requirements

## Cache Control

For optimal performance, consider adding cache control headers for static assets:

```apache
# Apache (.htaccess)
<IfModule mod_expires.c>
  ExpiresActive On
  ExpiresByType text/css "access plus 1 year"
  ExpiresByType application/javascript "access plus 1 year"
  ExpiresByType image/jpeg "access plus 1 year"
  ExpiresByType image/png "access plus 1 year"
  ExpiresByType image/svg+xml "access plus 1 year"
</IfModule>
```

```nginx
# Nginx
location ~* \.(css|js|jpg|jpeg|png|svg)$ {
    expires 1y;
    add_header Cache-Control "public, max-age=31536000";
}
```

## Troubleshooting

If you encounter issues with the website:

1. **404 Errors**: Ensure all files were uploaded correctly and the web server is configured to serve `index.html` as the default file
2. **Missing Assets**: Check that the `assets` directory and all its contents were uploaded
3. **Routing Issues**: If using a subdirectory, ensure all asset paths are correct

## Contact

For any questions or issues, please contact Wyn through GitHub: https://github.com/hubofwyn