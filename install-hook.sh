#!/bin/bash

# Get Git hooks directory for the current repository
HOOKS_DIR=$(git rev-parse --git-path hooks)

# Ensure the hooks directory exists
mkdir -p "$HOOKS_DIR"

# Create the prepare-commit-msg hook
HOOK_PATH="$HOOKS_DIR/prepare-commit-msg"

# Download the hook script from remote URL
curl -fsSL https://gist.githubusercontent.com/webpolis/c3bc7a457eae0111b5f608ad94faab4b/raw/d57151b13eb46a3ff8857953b823d6aafd6c5b11/prepare-commit-msg -o "$HOOK_PATH"

# Make the hook executable
chmod +x "$HOOK_PATH"

read -p "Enter OpenAI API key: " openai_apikey
git config openai.apikey "$openai_apikey"

read -p "Enter OpenAI model [o3-mini]: " openai_model
openai_model=${openai_model:-o3-mini}
git config openai.model "$openai_model"

read -p "Enter Groq API key: " groq_apikey
git config groq.apikey "$groq_apikey"

read -p "Enter Groq model [qwen-2.5-coder-32b]: " groq_model
groq_model=${groq_model:-qwen-2.5-coder-32b}
git config groq.model "$groq_model"

echo "Hook installed successfully at $HOOK_PATH"
