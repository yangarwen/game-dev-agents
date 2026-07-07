# Memory notes — how this folder works

Each agent in `.claude/agents/` reads its own file here **before working** and appends
significant decisions and lessons **as it works**. This is how the team "gets more senior"
over the life of a project: static agent files never change, but the knowledge in this
folder accumulates.

Because these notes live inside the repo, they travel with it — `git clone` on another
machine and the team remembers everything.

## Conventions

- One file per role, named after the agent: `game-designer.md`, `producer.md`, etc.
- One entry per decision or lesson: **what was decided + why**. Newest on top.
- Update stale entries instead of duplicating them; delete entries proven wrong.
- Keep entries concise — these are working notes, not documentation.

## Example entry

```markdown
## 2026-07-10 — Save system: JSON over binary
Chose versioned JSON serialization for saves; rejected binary because
debuggability matters more than file size at our scale. Revisit only if
save files exceed a few MB.
```
