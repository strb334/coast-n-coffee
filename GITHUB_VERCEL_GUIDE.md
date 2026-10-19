# 🚀 GitHub + Vercel Deployment Guide - Option 3

## 📋 BEFORE YOU BEGIN

**GitHub Account Required?** → Go to: https://github.com/signup (free forever)

---

## 🎯 COMPLETE STEP-BY-STEP INSTRUCTIONS

### STEP 1: Create GitHub Repository
1. **Open** → https://github.com/new
2. **Repository name**: `coast-n-coffee` (must be unique)
3. **Description**: "Coast & Coffee Café Website"
4. **Public** ✅ (Vercel requires public repo)
5. 👇 Click 🔴 **"Create repository"**

---

### STEP 2: Setup Git in Your Project
```bash
# Navigate to your project folder
cd /home/hermes/coast-n-coffee-site

# View all files that will be uploaded
ls -la

# Should see:
# index.html
# vercel.json
# package.json
# README.md
# DEPLOYMENT_GUIDE.md
```

**Confirm these files are all there before uploading!**

---

### STEP 3: Upload Files to GitHub

**Method A: Drag & Drop (Easiest)**
1. On your GitHub repo page, click **"Add file"** → **"Upload files"**
2. Drag and drop ALL files from `/home/hermes/coast-n-coffee-site/`
3. Scroll to bottom, click **"Commit changes"**

**Method B: Upload File by File**
1. Click **"Add file"** → **"Upload files"**
2. Click **"Choose your files"**
3. Select each file from `/home/hermes/coast-n-coffee-site/`
4. Commit after each file or all at once

---

### STEP 4: Verify GitHub Repository
After uploading, you should see:

```
coast-n-coffee/
├── index.html        ← Main website
├── vercel.json       ← Vercel config
├── package.json      ← Dependencies
├── README.md         ← Documentation
└── DEPLOYMENT_GUIDE.md  ← Deployment guide
```

✅ **Verify** you can view your website on GitHub Pages (if enabled)

---

### STEP 5: Deploy to Vercel

**Open** → https://vercel.com/new

**Click** → **"Import Project"**

**Import options:**

#### Option A: Import From GitHub (Recommended)
1. ✅ Select **"Continue with GitHub"** (or Login)
2. ✅ Select the repository: **coast-n-coffee**
3. ✅ Framework Preset: **None (Static HTML)**
4. ✅ Build & Development Settings:
   - Root Directory: `/` (default)
   - Output Directory: `\`
   - Build Command: (leave empty)
   - Output Command: (leave empty)
5. ✅ Environment Variables: (leave empty)
6. 👇 Click 🔴 **"Deploy"**

#### Option B: Manual Upload (Last resort)
1. ✅ Click **"Continue with Carbonite"** (or drag and drop)
2. ✅ Upload `index.html`
3. ✅ Click **"Deploy"**

---

### STEP 6: Watch the Magic 🎉

**Deployment Progress:**
```
🚀 Building Coast & Coffee Website...
🌅 Detecting settings...
✅ Static HTML ✓
🔥 Deploying to production...
✓ Deployment successful!
```

**Your live URL:** `https://coast-n-coffee.vercel.app`

---

## 📊 WHAT HAPPENS NEXT

### ✅ **Automagic Features:**
- **Auto-deploys** on every new commit ✓
- **SSL certificate** automatically added ✓
- **Global CDN** for fast loading worldwide ✓
- **Analytics** available (optional) ✓
- **Preview deployments** for test changes ✓
- **Custom domain** support (when ready) ✓

### 🔄 **Future Updates:**
```bash
# Make changes to your website
cd /home/hermes/coast-n-coffee-site
# Edit files...

# Push to GitHub triggers automatic deployment!
git add .
git commit -m "Update: ...changes..."
git push origin main
```

---

## 🎯 AFTER DEPLOYMENT CHECKLIST

- [ ] GitHub repository created successfully
- [ ] All files uploaded to GitHub
- [ ] Repository visible in Vercel dashboard
- [ ] Import project from GitHub
- [ ] Deployment started automatically
- [ ] Received your live URL
- [ ] Visited your live café website
- [ ] Confirmed working (all images load)
- [ ] **🎉 COAST & COFFEE ONLINE! 🎉**

---

## 🆘 PROBLEM SOLVING

### ✅ GitHub not found error?
- Make sure you're logged into GitHub
- Select the correct repository

### ✅ Build failed?
- Check framework preset: **None (Static HTML)**
- Don't add build commands
- Vercel handles HTML/JS/CSS automatically

### ✅ Images not loading?
- Unsplash URLs might need to be verified
- Test at: https://vercel.com/status

### ✅ Timeout?
- Wait 2-3 minutes for first deployment
- Check deployment logs: https://vercel.com/dashboard

---

## 🎴 IMPORTANT URLs

| Step | URL |
|------|-----|
| GitHub New Repo | https://github.com/new |
| Register GitHub | https://github.com/signup |
| Vercel New Project | https://vercel.com/new |
| Vercel Dashboard | https://vercel.com/dashboard |
| Import GitHub | https://vercel.com/new?git=github |

---

## 📞 NEED HELP?

- **GitHub Docs:** https://docs.github.com
- **Vercel Docs:** https://vercel.com/docs
- **Deploying to Vercel:** https://vercel.com/docs/deployments/new

---

**Ready? Let's get that café online! ☕🏡**

*Last Updated: 2025-10-19*