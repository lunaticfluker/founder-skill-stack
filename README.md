# Claude Founder Kit

One-command installer that gives you **60+ Claude Code skills** for running a startup — branding, marketing, product strategy, UI/UX, coding, and remote access.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/lunaticfluker/claude-founder-kit/main/install.sh | bash
```

Or clone and run:
```bash
git clone https://github.com/lunaticfluker/claude-founder-kit.git
bash claude-founder-kit/install.sh
```

## What you get

### 1. Foundation
| Skill | Source | What it does |
|-------|--------|-------------|
| superpowers-tdd | [obra/superpowers](https://github.com/obra/superpowers) | Test-driven development workflow |
| superpowers-debug | [obra/superpowers](https://github.com/obra/superpowers) | Systematic debugging before proposing fixes |
| superpowers-plan | [obra/superpowers](https://github.com/obra/superpowers) | Subagent-driven implementation planning |
| stop-slop | [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop) | Remove AI writing patterns from prose |
| stop-slop-scored | [drm-collab/stop-slop](https://github.com/drm-collab/stop-slop) | Score + rewrite to sound human |

### 2. Design & Branding
| Skill | Source | What it does |
|-------|--------|-------------|
| ui-ux-pro-max | [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | 50+ styles, 161 palettes, 57 font pairings, 10 stacks |
| brand-guidelines | [anthropics/skills](https://github.com/anthropics/skills) | Official Anthropic brand system |

### 3. Marketing & Growth (~40 skills)
| Suite | Source | What it does |
|-------|--------|-------------|
| marketingskills | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) | SEO, CRO, email, ads, copywriting, pricing, analytics, social, content strategy, and more |
| ai-marketing-claude | [zubair-trabzada/ai-marketing-claude](https://github.com/zubair-trabzada/ai-marketing-claude) | AI marketing orchestrator — ads, brand, competitors, copy, emails, funnel, landing pages, launch, reports, SEO, social |

### 4. Coding & AI
| Skill | Source | What it does |
|-------|--------|-------------|
| mcp-builder | [anthropics/skills](https://github.com/anthropics/skills) | Build MCP servers for external API integration |
| webapp-testing | [anthropics/skills](https://github.com/anthropics/skills) | Playwright-based web app testing |
| wshobson/agents | [wshobson/agents](https://github.com/wshobson/agents) | Agent orchestration skills + agent definitions |

### 5. Platform Skills
| Skill | Source | What it does |
|-------|--------|-------------|
| shopify-liquid | [lunaticfluker/shopify-liquid-skill](https://github.com/lunaticfluker/shopify-liquid-skill) | Shopify Online Store 2.0 theme development — Liquid, sections, schemas, CLI workflows |
| fal-ai | [lunaticfluker/fal-ai-skill](https://github.com/lunaticfluker/fal-ai-skill) | Image, video & audio generation with Flux Pro, Kling, 600+ models — Python & JS SDKs |

### 6. Remote Access
| Skill | Source | What it does |
|-------|--------|-------------|
| remote | [lunaticfluker/claude-web-remote](https://github.com/lunaticfluker/claude-web-remote) | Browser access to Claude Code from iPad/phone via ttyd + Cloudflare tunnels + QR codes |

## How skills work

Skills auto-trigger based on context. You don't invoke them manually — just describe what you need:

- "write copy for my landing page" → triggers copywriting + page-cro
- "set up remote access" → triggers remote
- "audit my SEO" → triggers seo-audit
- "write a cold email sequence" → triggers cold-email + email-sequence
- "design a pricing page" → triggers ui-ux-pro-max + pricing-strategy
- "build a Shopify section" → triggers shopify-liquid
- "generate an image with fal.ai" → triggers fal-ai

## Prerequisites

- **Required:** git, curl
- **Optional:** npm (for ui-ux-pro-max CLI installer)
- **For remote access:** `brew install ttyd cloudflared qrencode`

## Uninstall

Remove individual skills:
```bash
rm -rf ~/.claude/skills/skill-name
```

Remove everything this script installed:
```bash
rm -rf ~/.claude/skills ~/.claude/agents
```

## Credits

This kit curates skills from these open source projects:

- [obra/superpowers](https://github.com/obra/superpowers) — Jesse Vincent
- [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop) — Hardik Pandya
- [drm-collab/stop-slop](https://github.com/drm-collab/stop-slop) — DRM Collab
- [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) — Next Level Builder
- [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) — Corey Haines
- [zubair-trabzada/ai-marketing-claude](https://github.com/zubair-trabzada/ai-marketing-claude) — Zubair Trabzada
- [wshobson/agents](https://github.com/wshobson/agents) — WS Hobson
- [anthropics/skills](https://github.com/anthropics/skills) — Anthropic
- [lunaticfluker/claude-web-remote](https://github.com/lunaticfluker/claude-web-remote) — freeformsystems.ai
- [lunaticfluker/shopify-liquid-skill](https://github.com/lunaticfluker/shopify-liquid-skill) — freeformsystems.ai
- [lunaticfluker/fal-ai-skill](https://github.com/lunaticfluker/fal-ai-skill) — freeformsystems.ai

## License

MIT — lunaticfluker / freeformsystems.ai
