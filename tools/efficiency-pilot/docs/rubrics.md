# Rubrics for consistent agent output

Status: proposal, pending owner approval.

## Why yes/no checks beat scores

- **Cheaper:** a yes/no check is one quick decision. A 1 to 10 score invites long justification and extra rounds.
- **Consistent:** two agents (or the same agent on two days) agree far more often on "is the source linked? yes/no" than on "quality: 7/10".
- **Actionable:** every "no" points to one concrete fix. A score of 6 does not say what to change.

## Pattern: one self-check pass before delivering

1. Finish the draft.
2. Check it once against the matching rubric below (base rubric plus the type rubric).
3. Fix every "no".
4. Send.

No multi-round critique loops. One pass is enough; more rounds cost credits and rarely change the result.
Skip the pass for short chat replies (a few lines, no facts that need a source).

## Pattern: verify before claiming done

Only report something as done when a tool result proves it: a passing test run, a command exit code, a PR URL, a file listing, an API response.
Without proof, say what was attempted and what is still unverified.

## Base rubric (applies to every output)

- [ ] Correct and sourced: every fact comes from a real source or tool result opened this session, and nothing is invented.
- [ ] In scope: it answers what was asked, nothing more, nothing missing.
- [ ] Owner's format rules followed (see below).
- [ ] Approvals routed correctly: any irreversible or outbound action (send, post, merge, pay, delete) waits for the owner's own approval on the approval card, routed through the chief-of-staff agent after the auditor check.
- [ ] Length fits the channel (chat is short, docs can be longer).

### Owner's format rules

- German text uses Swiss German spelling: "ss" instead of the sharp s, hyphenated compounds such as "ERP-Prozesse".
- No em dash or en dash used as punctuation. Use a colon, comma, parentheses or a new sentence.
- Public repos use generic role labels (for example "chief-of-staff agent", "auditor agent"), never agent or bot names.
- The owner's private email address never appears in public content.

## Chat reply

- [ ] The answer or result comes in the first sentence.
- [ ] Any claim of "done" is backed by a tool result.
- [ ] No filler acknowledgement ("got it", "on it") as the whole message.
- [ ] Open questions or blockers are stated clearly, once.

## Learning material

- [ ] Learning goal and time estimate are stated at the top.
- [ ] APIs, versions and links are checked against current official docs.
- [ ] Code samples compile or run as written.
- [ ] Has a clear "done when" list the learner can verify.
- [ ] Fits the learner's level and builds on the previous session.

## PR or commit

- [ ] Title and description say what changed and why.
- [ ] Build, type check and tests pass, with the output quoted or linked.
- [ ] The sanitize check passes (no blocked names, no private email, no dashes in Markdown).
- [ ] Change is limited to the agreed scope; no unrelated edits.
- [ ] Opened on a feature branch; nothing merged without the owner's OK.

## Finance entry

- [ ] Amount, currency, date and counterparty match the source document (bank statement, receipt).
- [ ] Category or account is assigned per the agreed chart of accounts.
- [ ] Source document is referenced (file name or statement line).
- [ ] No duplicate of an existing entry.
- [ ] Anything uncertain is flagged for the auditor agent, not guessed.

## Social media draft

- [ ] Facts and figures are sourced; no unverifiable claims.
- [ ] Tone and language match the owner's voice and the platform.
- [ ] Fits the platform's length limit.
- [ ] Contains no private data, agent names or internal details.
- [ ] Stays a draft: posting waits for the owner's explicit approval.
