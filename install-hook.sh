#!/bin/bash

# Get Git hooks directory for the current repository
HOOKS_DIR=$(git rev-parse --git-path hooks)

# Ensure the hooks directory exists
mkdir -p "$HOOKS_DIR"

# Create the prepare-commit-msg hook
HOOK_PATH="$HOOKS_DIR/prepare-commit-msg"

# Download the hook script from remote URL
curl -fsSL https://raw.githubusercontent.com/cyqlelabs/llm-commit-msg/refs/heads/main/prepare-commit-msg -o "$HOOK_PATH"

# Make the hook executable
chmod +x "$HOOK_PATH"

read -p "Enter OpenAI API key: " openai_apikey
git config openai.apikey "$openai_apikey"

read -p "Enter OpenAI model [o3-mini]: " openai_model
openai_model=${openai_model:-o3-mini}
git config openai.model "$openai_model"

read -p "Enter Groq API key: " groq_apikey
git config groq.apikey "$groq_apikey"

read -p "Enter Groq model [qwen-qwq-32b]: " groq_model
groq_model=${groq_model:-qwen-qwq-32b}
git config groq.model "$groq_model"

echo "Hook installed successfully at $HOOK_PATH"
