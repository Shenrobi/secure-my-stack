# === CLAUDE.md ===
# Using AI Agents to Assist DevSecOps Workflow

## 🤖 Claude/GPT Suggestions
You can integrate AI agents like Claude or ChatGPT in your DevSecOps workflow to:

### 🔍 tfsec + checkov Findings
- Copy/paste error output into Claude or GPT
- Prompt: “Explain this tfsec warning and suggest a compliant Terraform fix.”
- AI can auto-generate HCL patches and reasoning

### 🐍 Bandit Findings
- Prompt: “Refactor this Python script to remove Bandit warning [B602]”
- AI helps rewrite insecure code using subprocess, input, or hardcoded credentials

### 🛡️ Policy Documentation
- Prompt: “Write a README section that explains how this repo enforces secure IaC deployment”
- Prompt: “Help me document compliance alignment for STIG or NIST in Terraform code”

### 📄 Auto PR Descriptions
- Prompt: “Generate a professional PR summary based on this diff”
- Paste Git diff or code block

## ⚠️ Claude/GPT Ground Rules
- Never auto-merge based on AI suggestions alone
- Always validate changes in your local env or CI build
- Use AI for assistive documentation, troubleshooting, and optimization—not blind trust