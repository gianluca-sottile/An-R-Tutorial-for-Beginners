# Translating lessons into Italian — rules

The Italian site lives in `it/` and mirrors the English one with identical file names. Each file in `it/` is currently an **English copy whose links and paths have already been fixed** for its new location. Your job is to translate it **in place** into Italian.

Read first: `_dev/GLOSSARIO_EN_IT.md` (mandatory terminology) and the English original in `lessons/...` if you need context.

## Translate
- All prose: headings, paragraphs, lists, tables, callout titles and bodies, figure captions (`#| fig-cap:`, `fig-subcap`), image alt text, exercise statements, hints, solution explanations, "Check your understanding" Q&A, summary tables, YAML `title`, `subtitle`, `description`.
- The lesson-meta strip: `[Level 3 · Inference]{.level-3}` → `[Livello 3 · Inferenza]{.level-3}`; `Prerequisites:` → `Prerequisiti:`; link texts to Italian lesson titles.
- **Comments inside R code** (`# ...`) → Italian.
- **Text strings that the reader sees in outputs or plots**: `labs(title=, x=, y=, colour=, fill=, caption=)`, `main=`, `xlab=`, `ylab=` in base plots, `cat()`/`paste()`/`sprintf()` messages, and string literals inside inline R that produce prose (e.g. `if (...) "outside" else "inside"` → `"esterno"`/`"interno"`).
- "Further reading": keep the references, translate the surrounding words; you may add a well-known Italian resource only if you are certain it exists (otherwise don't).

## Do NOT change
- R code logic, function names, argument names, object/variable names, column names, factor levels in the data (e.g. `"Adelie"`, `"female"`), dataset names, package names.
- Chunk options and labels (`#| label:`, `#| exercise:` ids, `#| setup:`, `#| eval:` …), fenced-div classes and attributes (`{.callout-tip .read-output}`, `{.exercise}`, `.hint exercise="..."`), inline R expressions except the visible string literals mentioned above.
- YAML keys, `format:` / `webr:` blocks, the `{{< include ... >}}` line, link targets/paths (already correct), image paths, URLs.
- LaTeX formulas (translate only words inside `\text{...}`).
- Blanks `______` in exercises.

## Style
- Clear, warm, university-level Italian; address the reader with "tu" (singular, informal), consistently: "Al termine di questa lezione sarai in grado di…", "Prova a…".
- Natural Italian, not word-for-word. Keep sentences short. Use Italian typographic conventions (« » not required; normal quotes are fine), decimal numbers inside prose as in the original (R outputs keep the dot).
- Keep English technical terms where the glossary says so, introducing the Italian equivalent the first time when helpful: "dimensione dell'effetto (*effect size*)".
- Add at the very top of the body (right after the include line / before the lesson-meta strip) nothing — the language switch is automatic.

## Check before finishing
- `grep` your file for leftover English sentences (e.g. " the ", " and ", "you ") outside code.
- Fenced divs `:::` balanced exactly as in the original; code fences unchanged; number of chunks identical to the English file (compare with `grep -c '^\`\`\`{' `).
- Do not touch files outside your assignment.
