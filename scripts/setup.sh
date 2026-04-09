#!/bin/bash

# QA Workflow Setup Script
# Initializes a new qa-workflow project

set -e

echo "======================================"
echo "QA Workflow Project Setup"
echo "======================================"
echo ""

# Check if node/npm is available
if ! command -v node &> /dev/null; then
    echo "⚠️  Node.js not found. Some features may not work."
    echo "   Please install Node.js from https://nodejs.org"
fi

# Create directories
echo "📁 Creating project directories..."
mkdir -p qa-workflow/{commands,agents,skills,templates,docs/examples,lib,scripts,bin}
# Note: Individual project directories will be created per ticket under projects/{ticketId}/
# Structure: projects/{ticketId}/{requirements,test-cases,test-data,test-results,reports}

# Create basic files
echo "📄 Creating project files..."

# .gitignore
cat > qa-workflow/.gitignore << 'EOF'
node_modules/
package-lock.json
test-results/
coverage/
*.log
.env
.DS_Store
*.swp
*.tmp
EOF

# package.json
cat > qa-workflow/package.json << 'EOF'
{
  "name": "qa-workflow",
  "version": "0.1.0",
  "description": "End-to-end QA testing workflow plugin",
  "license": "MIT"
}
EOF

# Initialize git
if [ ! -d "qa-workflow/.git" ]; then
    echo "🔧 Initializing git repository..."
    cd qa-workflow
    git init
    git add .
    git commit -m "initial: Project setup"
    cd ..
fi

# Note: Do NOT auto-commit when creating individual project artifacts
# Let users manage git commits for projects/{ticketId}/ separately

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. cd qa-workflow"
echo "2. qa-workflow init"
echo "3. qa-workflow analyze"
echo ""
