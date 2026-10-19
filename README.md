# 🌴 Coast & Coffee - Café Website

A professional, cozy café website built with HTML, CSS, and JavaScript.

## Features
- Responsive design
- Swedish/English language toggle
- Beautiful café imagery
- Smooth animations
- Professional typography

## Deployment

This site is deployed on Netlify as a static site.

### Quick Deployment (Script)
1. **Copy the setup script:**
   ```bash
   cd /home/hermes/coast-n-coffee-site
   cat netlify-setup.sh > setup.sh
   chmod +x setup.sh
   ```

2. **Set your environment variables:**
   ```bash
   export GITHUB_TOKEN="your-github-pat"
   export NETLIFY_TOKEN="your-netlify-token"
   ```

3. **Run the setup:**
   ```bash
   ./setup.sh
   ```

### Manual Deployment
**Netlify Dashboard:** https://app.netlify.com/dashboard

1. **Create new site:** "Deploy from GitHub repo"
2. **Select repository:** `strb334/coast-n-coffee`
3. **Configure:** Build command (leave empty), Publish directory (".")
4. **Deploy:** Wait for automatic deployment

### Alternative: GitHub Actions (Recommended)
**Auto-deploys on every push!**

1. **Create .github/workflows/netlify-deploy.yml**
2. **Add Netlify secrets to GitHub:**
   - NETLIFY_TOKEN
   - NETLIFY_SITE_ID

## Preview
Run the local server to preview:
```bash
python3 -m http.server 8000
```

Then visit: http://localhost:8000

## Netlify Configuration
- **URL:** https://coast-n-coffee.netlify.app
- **Auto-deployment:** GitHub Actions
- **Cost:** $75/month free credit available
- **Performance:** Excellent global CDN

## Chat-Based Updates
Need changes? Just chat with me!

**Your commands to me:**
- `🔄 "Change coffee prices to kr 50-60"`
- `🌍 "Switch to English language"`
- `🖼️ "Update hero background image"`
- `🍽️ "Add new menu item: Herbal Tea"`

**I'll make the changes and your site auto-deploys!**
