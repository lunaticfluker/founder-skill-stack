#!/usr/bin/env bash
# ============================================================
# Claude Founder Kit — One-command skill stack for founders
# by lunaticfluker / freeformsystems.ai
#
# Installs 60+ Claude Code skills for branding, marketing,
# product strategy, UI/UX, coding, and remote access.
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/lunaticfluker/claude-founder-kit/main/install.sh | bash
# ============================================================

set -e

SKILLS_DIR="$HOME/.claude/skills"
AGENTS_DIR="$HOME/.claude/agents"
INSTALLED=0
FAILED=0

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

ok()   { echo -e "  ${GREEN}+${NC} $1"; INSTALLED=$((INSTALLED + 1)); }
info() { echo -e "  ${CYAN}>${NC} $1"; }
warn() { echo -e "  ${YELLOW}!${NC} $1"; }
fail() { echo -e "  ${RED}x${NC} $1"; FAILED=$((FAILED + 1)); }

echo ""
echo -e "${BOLD}"
echo "  ___                 _            _  ___ _   "
echo " | __|__ _  _ _ _  __| |___ _ _   | |/ (_) |_ "
echo " | _/ _ \ || | ' \/ _\` / -_) '_|  | ' <| |  _|"
echo " |_|\___/\_,_|_||_\__,_\___|_|    |_|\_\_|\__|"
echo -e "${NC}"
echo -e "  ${CYAN}Claude Code skill stack for founders${NC}"
echo -e "  ${CYAN}by freeformsystems.ai${NC}"
echo ""

# ── Prerequisites ────────────────────────────────────────────
info "Checking prerequisites..."

MISSING=""
command -v git  &>/dev/null || MISSING="$MISSING git"
command -v curl &>/dev/null || MISSING="$MISSING curl"

if [ -n "$MISSING" ]; then
  fail "Missing required tools:$MISSING"
  echo "  Install them and re-run."
  exit 1
fi

if ! command -v npm &>/dev/null; then
  warn "npm not found — some skills will use git fallback"
fi

ok "Prerequisites met"
echo ""

# ── Create dirs ───────────────────────────────────────────────
mkdir -p "$SKILLS_DIR" "$AGENTS_DIR"

# ── Helpers ───────────────────────────────────────────────────
install_skill() {
  local name="$1"
  local repo="$2"
  local subpath="${3:-SKILL.md}"
  local dir="$SKILLS_DIR/$name"

  mkdir -p "$dir"
  local url="https://raw.githubusercontent.com/$repo/main/$subpath"

  if curl -fsSL "$url" -o "$dir/SKILL.md" 2>/dev/null && [ -s "$dir/SKILL.md" ]; then
    ok "$name"
  else
    rm -rf "$dir"
    fail "$name"
  fi
}

install_repo() {
  local name="$1"
  local repo="$2"

  if git clone --depth 1 "https://github.com/$repo.git" "/tmp/_kit_$name" -q 2>/dev/null; then
    echo "true"
  else
    echo "false"
  fi
}

# ════════════════════════════════════════════════════════════
# 1. FOUNDATION — Code quality & writing quality
# ════════════════════════════════════════════════════════════
echo -e "${BOLD}1/6 Foundation${NC}"

# Superpowers — TDD, debugging, planning
install_skill "superpowers-tdd"   "obra/superpowers" "skills/test-driven-development/SKILL.md"
install_skill "superpowers-debug" "obra/superpowers" "skills/systematic-debugging/SKILL.md"
install_skill "superpowers-plan"  "obra/superpowers" "skills/subagent-driven-development/SKILL.md"

# Stop Slop — remove AI writing patterns
install_skill "stop-slop"        "hardikpandya/stop-slop" "SKILL.md"
install_skill "stop-slop-scored" "drm-collab/stop-slop"   "SKILL.md"

echo ""

# ════════════════════════════════════════════════════════════
# 2. DESIGN & BRANDING
# ════════════════════════════════════════════════════════════
echo -e "${BOLD}2/6 Design & Branding${NC}"

# UI/UX Pro Max — 50+ styles, 161 palettes, 10 stacks
info "Installing ui-ux-pro-max..."
if [ "$(install_repo ui-ux-pro-max nextlevelbuilder/ui-ux-pro-max-skill)" = "true" ]; then
  cp -r /tmp/_kit_ui-ux-pro-max/.claude/skills/ui-ux-pro-max "$SKILLS_DIR/" 2>/dev/null && \
    ok "ui-ux-pro-max" || fail "ui-ux-pro-max"
  rm -rf /tmp/_kit_ui-ux-pro-max
else
  fail "ui-ux-pro-max"
fi

# Brand guidelines (official Anthropic)
install_skill "brand-guidelines" "anthropics/skills" "skills/brand-guidelines/SKILL.md"

echo ""

# ════════════════════════════════════════════════════════════
# 3. MARKETING & GROWTH (two full suites)
# ════════════════════════════════════════════════════════════
echo -e "${BOLD}3/6 Marketing & Growth${NC}"

# coreyhaines31/marketingskills — 30+ marketing skills
info "Installing marketingskills suite..."
if [ "$(install_repo marketingskills coreyhaines31/marketingskills)" = "true" ]; then
  for skilldir in /tmp/_kit_marketingskills/skills/*/; do
    skillname=$(basename "$skilldir")
    mkdir -p "$SKILLS_DIR/$skillname"
    [ -f "$skilldir/SKILL.md" ] && cp "$skilldir/SKILL.md" "$SKILLS_DIR/$skillname/"
  done
  rm -rf /tmp/_kit_marketingskills
  ok "marketingskills (all modules)"
else
  fail "marketingskills"
fi

# zubair-trabzada/ai-marketing-claude — AI marketing orchestrator
info "Installing ai-marketing-claude..."
if [ "$(install_repo ai-marketing zubair-trabzada/ai-marketing-claude)" = "true" ]; then
  mkdir -p "$SKILLS_DIR/market-orchestrator"
  [ -f "/tmp/_kit_ai-marketing/market/SKILL.md" ] && \
    cp "/tmp/_kit_ai-marketing/market/SKILL.md" "$SKILLS_DIR/market-orchestrator/"
  for skilldir in /tmp/_kit_ai-marketing/skills/*/; do
    skillname=$(basename "$skilldir")
    mkdir -p "$SKILLS_DIR/$skillname"
    [ -f "$skilldir/SKILL.md" ] && cp "$skilldir/SKILL.md" "$SKILLS_DIR/$skillname/"
  done
  rm -rf /tmp/_kit_ai-marketing
  ok "ai-marketing-claude (all sub-skills)"
else
  fail "ai-marketing-claude"
fi

echo ""

# ════════════════════════════════════════════════════════════
# 4. CODING & AI ORCHESTRATION
# ════════════════════════════════════════════════════════════
echo -e "${BOLD}4/6 Coding & AI${NC}"

# MCP builder (official Anthropic)
install_skill "mcp-builder" "anthropics/skills" "skills/mcp-builder/SKILL.md"

# Webapp testing — Playwright (official Anthropic)
install_skill "webapp-testing" "anthropics/skills" "skills/webapp-testing/SKILL.md"

# wshobson/agents — orchestration skills + agents
info "Installing wshobson/agents..."
if [ "$(install_repo agents wshobson/agents)" = "true" ]; then
  for skilldir in /tmp/_kit_agents/skills/*/; do
    skillname=$(basename "$skilldir")
    mkdir -p "$SKILLS_DIR/$skillname"
    [ -f "$skilldir/SKILL.md" ] && cp "$skilldir/SKILL.md" "$SKILLS_DIR/$skillname/"
  done
  for agentfile in /tmp/_kit_agents/agents/*.md; do
    [ -f "$agentfile" ] && cp "$agentfile" "$AGENTS_DIR/"
  done
  rm -rf /tmp/_kit_agents
  ok "wshobson/agents (skills + agents)"
else
  fail "wshobson/agents"
fi

echo ""

# ════════════════════════════════════════════════════════════
# 5. PLATFORM SKILLS (Shopify + fal.ai)
# ════════════════════════════════════════════════════════════
echo -e "${BOLD}5/6 Platform Skills${NC}"

# Shopify Liquid — theme development
install_skill "shopify-liquid" "lunaticfluker/shopify-liquid-skill" "SKILL.md"

# fal.ai — image, video & audio generation
install_skill "fal-ai" "lunaticfluker/fal-ai-skill" "SKILL.md"

echo ""

# ════════════════════════════════════════════════════════════
# 6. REMOTE ACCESS
# ════════════════════════════════════════════════════════════
echo -e "${BOLD}6/6 Remote Access${NC}"

# Claude Web Remote — browser access from any device
install_skill "remote" "lunaticfluker/claude-web-remote" "SKILL.md"

echo ""

# ════════════════════════════════════════════════════════════
# DONE
# ════════════════════════════════════════════════════════════
TOTAL=$(ls -d "$SKILLS_DIR"/*/ 2>/dev/null | wc -l | tr -d ' ')

echo "================================================"
echo ""
echo -e "  ${GREEN}${BOLD}Install complete!${NC}"
echo ""
echo -e "  ${GREEN}$INSTALLED${NC} installed  ${RED}$FAILED${NC} failed  ${BOLD}$TOTAL${NC} total skills"
echo ""
echo "  Skills: $SKILLS_DIR"
echo "  Agents: $AGENTS_DIR"
echo ""
echo "================================================"
echo ""
echo "  Next steps:"
echo ""
echo "  1. Restart Claude Code (quit and reopen)"
echo ""
echo "  2. (Optional) Install Superpowers plugin:"
echo "     /plugin marketplace add obra/superpowers-marketplace"
echo "     /plugin install superpowers@superpowers-marketplace"
echo ""
echo "  3. (Optional) Remote access from iPad/phone:"
echo "     Tell Claude: /remote"
echo "     Requires: brew install ttyd cloudflared qrencode"
echo ""
echo "  Skills auto-trigger based on context."
echo "  You don't need to invoke them manually."
echo ""
