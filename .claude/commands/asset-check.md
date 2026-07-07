---
description: Vet a third-party asset (art/font/music/SFX/pack) through the owning discipline → legal-ip-advisor → license manifest
argument-hint: <asset name or URL + intended use>
---

Run the "asset adoption" relay pipeline from the team charter (CLAUDE.md) for: **$ARGUMENTS**

Rules: ONE agent at a time. Pass each stage's conclusions forward. Stop and ask the user if the asset's source or intended use is unclear.

1. **Owning discipline** — Route by asset type: `art-director` for visual assets/fonts, `audio-designer` for music/SFX, `unity-tech-lead` for code/packages/plugins. They evaluate fit, quality, and whether the project actually needs it (vs making it in-house).
2. **legal-ip-advisor** — Verify the license: commercial use in a shipped Steam game, attribution requirements, redistribution limits, seat/project restrictions. Risk-rank the finding: fine / needs a fix / needs a real attorney.
3. **Manifest** — legal-ip-advisor records the asset (source, license type, terms link/proof) in the project's license manifest and notes.

Final report: adopt / adopt-with-conditions / reject, the license summary, and any required follow-ups in a "🌟 Tasks / Questions" list.
