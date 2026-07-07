---
description: Project status from the team's notes — reads .claude/notes/, spawns NO agents (near-zero token cost)
---

Give a project standup WITHOUT spawning any agents — this must stay cheap.

1. Read every file in `.claude/notes/*.md` (skip the README).
2. Summarize, per role that has entries: key decisions to date, open questions, and anything stale or contradictory between roles.
3. If the notes are empty or thin, say so plainly — don't invent status.

Output:
- **Decisions so far** — grouped by role, newest first, one line each.
- **Open questions** — anything a role left unresolved.
- **Cross-role flags** — contradictions or handoffs waiting on someone.
- **Suggested next steps** — max 3, each naming which agent (or relay command) to use.
- End with "🌟 Tasks / Questions" for anything the user must decide.
