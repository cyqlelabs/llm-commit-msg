# AI-Powered Conventional Commit Message Generator

A Git hook that automatically generates commit messages following the [Conventional Commit specification](https://www.conventionalcommits.org/) using AI providers (OpenAI or Groq).

## Features

- 🤖 AI-powered commit message generation
- 🔌 Supports both OpenAI and Groq APIs
- 📝 Conventional Commit specification compliance
- ⚡ Automatic diff analysis

## Installation

### Quick Install (curl)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/cyqlelabs/llm-commit-msg/main/install-hook.sh)
```

## Configuration

After installation, you will be prompted to enter your API keys and models for OpenAI and Groq:

- *OpenAI API Key*: Required for using OpenAI's API.
- *OpenAI Model*: Optional; defaults to o3-mini.
- *Groq API Key*: Required for using Groq's API.
- *Groq Model*: Optional; defaults to qwen-2.5-coder-32b.

## Usage

The hook will automatically generate a commit message when you attempt to commit changes. It will skip generating a message if one is already provided or if the commit is not a regular commit.

## Requirements

- Git
- Python 3
- requests library for Python (install via pip install requests)

# License

This project is licensed under the MIT License.
