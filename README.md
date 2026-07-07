# 🎮 Game-Dev Agent Pack for Claude Code

A reusable team of **9 senior game-development subagents** for [Claude Code](https://claude.com/claude-code),
oriented toward **Unity / C# / URP** and a quality bar of **shipping a polished game on Steam**.
Game-agnostic — bring it to any project.

## 🧑‍🤝‍🧑 The team

| Agent | Call them for |
|---|---|
| 🎲 `game-designer` | Core loop, mechanics, systems, balancing |
| 🗺️ `level-designer` | Level layout, pacing, encounters, difficulty curve |
| 📖 `narrative-designer` | Story, world-building, environmental storytelling |
| 🎨 `art-director` | Visual direction, palettes, art budgets, UI style |
| 🎧 `audio-designer` | Sound design, music direction, spatial/adaptive audio |
| 🔧 `unity-tech-lead` | Unity architecture, shaders, systems, tooling |
| 📋 `producer` | Scope, milestones, cut decisions, risk |
| 📣 `marketing-steam-strategist` | Steam page, wishlists, trailer, launch |
| ⚖️ `legal-ip-advisor` | Asset licenses, trademark checks, release paperwork |

Every agent is written as a senior veteran, asks clarifying questions when a task is
underspecified, ends with a "🌟 Tasks / Questions" section, and knows when to hand off
to another role.

## 🧠 How the team "learns"

Agents read and append to their own log in `.claude/notes/<role>.md` — decisions and
lessons accumulate there over the life of a project. Since the notes live in this repo,
the accumulated knowledge travels with `git clone`. See `.claude/notes/README.md`.

## ⚡ Relay commands (one-click pipelines)

Slash commands in `.claude/commands/` run the standard relays — one agent at a time,
subscription-friendly:

| Command | Pipeline |
|---|---|
| `/kickoff <feature>` | producer → game-designer → unity-tech-lead → level-designer |
| `/asset-check <asset>` | owning discipline → legal-ip-advisor → license manifest |
| `/release-prep [window]` | marketing → producer → legal |
| `/story <beat>` | narrative → level-designer → art-director |
| `/standup` | reads the team notes and reports status — **spawns no agents** |

## 🤝 How the team collaborates

`CLAUDE.md` is the **team charter** — loaded by every session and every subagent. It
contains the roster, the standard relay pipelines (one agent at a time, handing off via
output and notes), and token-discipline rules that keep the team affordable on a
subscription plan. Agents also read each other's notes when a task crosses roles.

## 📦 Install

**Option A — per project (recommended, keeps memory notes + team charter):**
copy the whole `.claude/` folder **and `CLAUDE.md`** into your project root. Or simply
start your game project inside a clone of this repo.

**Option B — global (available in every project):**

```bash
./install.sh            # copy the 9 agents to ~/.claude/agents/
./install.sh --link     # symlink instead (repo updates propagate)
./install.sh --dry-run  # preview without changing anything
./install.sh --uninstall
```

Note: globally-installed agents read/write `.claude/notes/` relative to whatever
project you're in (each project accumulates its own notes), and the team charter
only loads in projects that have this `CLAUDE.md`.

## 🕹️ Use

In Claude Code, either name the agent directly —

> ask the game-designer to sketch a core loop for a co-op roguelite
> ask the producer to plan milestones for a 9-month schedule

— or just describe the task and let Claude route it to the right role.

## 💾 Move to another machine

```
git clone <this repo>
```

then install per above. Agents and their accumulated notes come along.

## 📝 Notes

- These `.md` files are Claude Code subagent definitions — they only do something
  inside Claude Code, not as plain documents.
- No Unity version is hardcoded; agents check what your project uses and adapt.
- The `legal-ip-advisor` is a due-diligence assistant, **not** a lawyer.

## 📜 License

Released under the [MIT License](LICENSE) — take it, tweak it, ship it in
your own projects, commercial or not. A credit back is always welcome, never
expected.

## 🙏 Acknowledgments

These agents were written with AI assistance, drawing on the openly shared
agent designs of the Claude Code community — in particular the game-development
division of the MIT-licensed [**agency-agents**](https://github.com/msitarzewski/agency-agents) project ("The Agency"), whose
craft heuristics several agents here absorbed. Every idea in this pack stands
on the shoulders of people who cared enough to write their craft down and
share it. Thank you.

---

*Made with ❤️ by the community, for the community.*
