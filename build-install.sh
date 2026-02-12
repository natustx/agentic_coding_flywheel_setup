#!/usr/bin/env bash
# build-install.sh — ACFS (Agentic Coding Flywheel Setup)
# VPS bootstrapping tool — shell scripts + Next.js web wizard
# Primary use: reference/development. The install.sh runs on Ubuntu VPS.
set -euo pipefail

TOOL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$HOME/prj/util/bin"

echo "=== ACFS Build & Install ==="
echo "Tool dir: $TOOL_DIR"
echo ""

# Install bun dependencies (for web wizard development)
if command -v bun &>/dev/null; then
    echo "Installing bun dependencies..."
    cd "$TOOL_DIR"
    bun install --frozen-lockfile 2>&1 || bun install 2>&1
    echo "Dependencies installed."
else
    echo "NOTICE: bun not found — skipping web app dependencies."
    echo "  Install bun to develop the web wizard: curl -fsSL https://bun.sh/install | bash"
fi

echo ""
echo "=== SETUP STEPS ==="
echo ""
echo "This is a VPS bootstrapping tool. Key files:"
echo "  install.sh      — Main installer (run on Ubuntu VPS via curl|bash)"
echo "  scripts/         — Library scripts sourced by install.sh"
echo "  acfs/            — Config templates deployed to VPS"
echo "  apps/web/        — Next.js web wizard (Vercel-deployed)"
echo ""
echo "No binary to install to bin/ — this is a shell script collection."
echo "To run on a VPS: curl -fsSL https://raw.githubusercontent.com/Dicklesworthstone/agentic_coding_flywheel_setup/main/install.sh | bash -s -- --yes --mode vibe"
echo ""
echo "=== Installation complete ==="
