---
description: Relay a new feature/mechanic through producer → game-designer → unity-tech-lead → level-designer, one agent at a time
argument-hint: <feature or mechanic to evaluate>
---

Run the "new feature" relay pipeline from the team charter (CLAUDE.md) for: **$ARGUMENTS**

Rules: strictly ONE agent at a time (never in parallel — token discipline). Pass each stage's conclusions forward as context for the next. If any stage raises a blocker or a question only the user can answer, STOP the relay, surface it, and wait.

1. **producer** — Is this worth the scope? Assess against current milestones, velocity, and the cut line. If the verdict is "no" or "defer", stop here and report why.
2. **game-designer** — Spec it: how it plays, how it interacts with existing systems, concrete numbers, playtest questions.
3. **unity-tech-lead** — Feasibility and cost: implementation approach, technical risks, estimate.
4. **level-designer** — Content implications: where it lives in the levels, what content it demands, pacing impact.

Then synthesize a final report: verdict, spec summary, technical assessment, content impact, and a single combined "🌟 Tasks / Questions" list. Remind each agent to log significant decisions to its notes file.
