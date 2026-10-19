#!/bin/bash
COAST & COFFEE NETLIFY SETUP SCRIPT (FIXED)
Complete deployment script for GitHub + Netlify

=== COLOR OUTPUT ===
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

=== CONFIGURATION ===
GITHUB_USERNAME="strb334"
GITHUB_REPO="coast-n-coffee"
GITHUB_TOKEN="$YOUR_GITHUB_TOKEN"
NETLIFY_TOKEN="$YOUR_NETLIFY_TOKEN"
GITHUB_EMAIL="cafe@coastandcoffee.se"
GITHUB_NAME="Coast & Coffee"

=== PRINT FUNCTIONS ===
print_step() {
    echo -e "${BLUE}📋 Step $1: $2${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

=== SAFETY CHECK ===
safe_check() {
    print_step "0. Safety check"
    
    # Check if running from correct directory
    if [[ ! -f "/home/hermes/coast-n-coffee-site/index.html" ]]; then
        print_error "Cannot find index.html in /home/hermes/coast-n-coffee-site"
        echo "Please run this script from the correct directory"
        exit 1
    fi
    
    print_success "Safety check passed"
}

=== REQUIRE TOOLS ===
require_tool() {
    local tool=$1
    
    if ! command -v $tool &> /dev/null; then
        echo "Installing $tool..."
        case $tool in
        git|gh)
            if command -v apt-get &> /dev/null; then
                sudo apt-get update && sudo apt-get install -y git
            elif command -v yum &> /dev/null; then
                sudo yum install -y git
            elif command -v brew &> /dev/null; then
                brew install git
            else
                echo "Please install Git manually"
                echo "Visit: https://git-scm.com/downloads"
                exit 1
            fi
            ;;
        npm)
            if command -v apt-get &> /dev/null; then
                sudo apt-get install -y npm
            elif command -v yum &> /dev/null; then
                sudo yum install -y npm
            elif command -v brew &> /dev/null; then
                brew install npm
            else
                echo "Please install Node.js and npm manually"
                echo " Visit: https://nodejs.org/"
                exit 1
            fi
            ;;
        gh)
            if command -v curl &> /dev/null; then
                echo "Downloading GitHub CLI..."
                curl -fsSL https://cli.github.com/agent/install.sh | sh
                source $HOME/.profile
            else
                echo "Please install GitHub CLI manually"
                echo "Visit: https:/cli.github.com/"
                exit 1
            fi
            ;;
        netlify)
            if command -v npm &> /dev/null; then
                npm install -g netlify-cli
            else
                echo "Please install Node.js first"
                echo " Visit: https://nodejs.org/"
                exit 1
            fi
            ;;
        esac
    fi
}

=== CHECK DEPENDENCIES ===
check_dependencies() {
    print_step "1. Checking dependencies"
    
    if ! command -v git &> /devcommand -v php &> /dev/null; then
        print_error "Git is not installed"
        echo "Installing Git..."
        require_tool git
    fi
    
    if ! command -v curl &> /dev/null && ! command -v wget &> /dev/null; then
        print_error "Neither curl nor wget is installed"
        echo "Please install one of them"
        exit 1
    fi
    
    if ! command -v node &> /dev/null; then
        print_error "Node.js is not installed"
        echo "Installing Node.js..."
        require_tool npm
    fi
    
    if ! command -v gh &> /dev/null; then
        print_error "GitHub CLI (gh) is not installed"
        echo "Installing GitHub CLI..."
        require_tool gh
    fi
    
    if ! command -v netlify &> /dev/null; then
        print_error "Netlify CLI is not installed"
        echo "Installing Netlify CLI..."
        require_tool netlify
    fi
    
    print_success "All dependencies installed"
}

=== GITHUB SETUP ===
setup_github() {
    print_step "2. Setting up GitHub"
    
    git config --global user.email "$GITHUB_EMAIL"
    git config --global user.name "$GITHUB_NAME"
    
    echo "$GITHUB_TOKEN" | gh auth login --with-token
    
    if ! gh auth status &> /dev/null; then
        print_error "GitHub authentication failed"
        echo "Please check your GitHub token"
        echo "Generate token at: https://github.com/settings/tokens"
        echo "Scope: repo"
        exit 1
    fi
    
    if gh repo view "$GITHUB_USERNAME/$GITHUB_REPO" &> /dev/null; then
        print_warning "Repository already exists, will sync files"
    else
        gh repo create "$GITHUB_USERNAME/$GITHUB_REPO" \
            --public \
            --description "Coast & Coffee café website" \
            __homepage "https://coast-n-coffee.netlify.app"
        print_success "GitHub repository created"
    fi
    
    cd /home/hermes/coast-n-coffee-site
    
    rm -rf .git
    git init
    git add .
    git commit -m "Initial commit: Coast & Coffee website"
    
    git remote add origin "https://github.com/$GITHUB_USERNAME/$GITHUB_REPO.git"
    git push -u origin main
    
    print_success "Files pushed to GitHub"
}

=== NETLIFY SETUP ===
setup_netlify() {
    print_step "3. Setting up Netlify"
    
    netlify login --token "$NETLIFY_TOKEN"
    
    NETLIFY_SITE_ID=$(netlify sites:create \
        --name "$GITHUB_REPO" \
        --deploy-privately \
        --json | jq -r '.id')
    
    if [[ -z "$NETLIFY_SITE_ID" ]]; then
        print_error "Failed to create Netlify site"
        exit 1
    fi
    
    print_success "Netlify site created: $NETLIFY_SITE_ID"
    
    netlify sites:link \
        --site "$NETLIFY_SITE_ID" \
        --repo "$GITHUB_USERNAME/$GITHUB_REPO" \
        --branch "main"
    
    print_success "Netlify site linked to GitHub"
    
    cat > redirects.txt << EOF
[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
EOF
    
    netlify addons:create redirects --site "$NETLIFY_SITE_ID" --config redirects.txt
    rm redirects.txt
    
    print_success "Netlify configuration applied"
}

=== DEPLOY ===
deploy_site() {
    print_step "4. Deploying to Netlify"
    
    if ! netlify status --site "$NETLIFY_SITE_ID" &> /dev/null; then
        print_error "Netlify site not accessible"
        exit 1
    fi
    
    netlify deploy \
        --site "$NETLIFY_SITE_ID" \
        --prod \
        --message "Initial deploy: Coast & Coffee"
    
    DEPLOYMENT_URL=$(netlify status --site "$NETLIFY_SITE_ID" | grep "URL:" | cut -d' ' -f2)
    
    print_success "Site deployed successfully!"
    echo -e "${GREEN}🌐 Your website is live at: $DEPLOYMENT_URL${NC}"
    echo -e "${YELLOW}📧 Share this URL with your customers!${NC}"
}

=== VERIFICATION ===
verify_setup() {
    print_step "5. Verifying setup"
    
    if ! gh repo view "$GITHUB_USERNAME/$GITHUB_REPO" &> /dev/null; then
        print_error "GitHub repository not accessible"
        exit 1
    fi
    
    if ! netlify status --site "$NETLIFY_SITE_ID" &> /dev/null; then
        print_error "Netlify site not accessible"
        exit 1
    fi
    
    if [[ ! -f "/home/hermes/coast-n-coffee-site/index.html" ]]; then
        print_error "Website files missing"
        exit 1
    fi
    
    print_success "All verifications passed!"
}

=== MAIN EXECUTION ===
main() {
    echo -e "${BLUE}🚀 COAST & COFFEE NETLIFY SETUP${NC}"
    echo -e "${YELLOW}Setting up your café website on Netlify...${NC}\\n"
    
    safe_check
    check_dependencies
    setup_github
    setup_netlify
    deploy_site
    verify_setup
    
    echo -e "${GREEN}🎉 Setup complete! Your café website is ready to go!${NC}"
    echo -e "${YELLOW}📋 Next steps for auto-updates:${NC}"
    echo "   1. Make changes to files in: /home/hermes/coast-n-coffee-site/"
    echo "   2. Run: git add .; git commit -m 'Update...'; git push"
    echo "   3. Wait for automatic Netlify deployment"
    echo "\\n💬 Chat with me for changes: '🔄 Update coffee prices' etc."
}

=== ERROR HANDLING ===
error_handler() {
    echo -e "${RED}❌ Setup failed!${NC}"
    echo "Please check the error messages above and try again."
    echo "If issues persist, check your API tokens and permissions."
}

trap error_handler ERR
main

