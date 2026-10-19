#!/bin/bash
# Test script syntax
bash -n /home/hermes/coast-n-coffee-site/netlify-setup.sh

if [ $? -eq 0 ]; then
    echo "✅ Script syntax is valid"
else
    echo "❌ Script syntax error"
    bash -n /home/hermes/coast-n-coffee-site/netlify-setup.sh
fi

# Check script permissions
ls -la /home/hermes/coast-n-coffee-site/netlify-setup.sh