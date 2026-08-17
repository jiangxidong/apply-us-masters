---
name: pick-programs
description: >-
  US taught/coursework master's program shortlisting and tiering — build the
  program pool, verify each program's channel-level constraints with checked
  evidence, and tier programs (reach/match/safer/undecided/ineligible)
  against published hard requirements with a basis and a void condition.
  选校、挑学校、选学校、建项目池、项目池、分档、冲刺、匹配、较稳、伪保底、
  申请渠道。
  Not for: cold-start intake or the profile/claims mirror (use
  apply-us-master), writing or editing essays (use write-essays), or
  assembling application packets and coordinating recommenders (use
  assemble-packet).
license: MIT
allowed-tools: Read, Write, Edit, Glob, Grep, Bash, WebFetch, WebSearch
---

# pick-programs

**Language**: Mirror the user's language in conversation — Chinese in, Chinese out; English in, English out. Workspace files always follow the exact formats, headings, and fixed values written in this skill, regardless of conversation language.

## 1. Scope of Responsibility

This skill owns the program-selection phase: starting from an empty program pool, build every specific program the user is considering — granularity down to "school · college · program," not school alone, since admission requirements, forms, and AI policy can all differ across colleges at the same school — one by one into `programs.md` at the workspace root; for each program's application channel, gather evidence section by section in `channels/` for the sections this phase owns; and in the end produce a five-tier classification with a basis and a void condition for each program.

This skill is the sole writer of all thirteen columns of `programs.md` (including `status`) — this table is not split by column across owners, it is a single unit, and every other skill only reads it, never writes it. "Submission" is not a separate phase: the jump from "decided to apply" to "submitted" requires no action at all from this product — `submitted` in `status` is simply an already-happened event the user reports after the fact, and this skill's job is to record that sentence into the pool. So when the user says, inside another skill's conversation, "I submitted X," "X has already been submitted," or "take Y off the list," that other skill must not write this status in place — the write routes back to this skill. The user does not need to open a separate conversation for this, but the write itself must go through here.

This skill never touches `profile.md` / `claims.md` at the workspace root (read-only — property of the cold-start and profile phases), nor `materials/`, `essays/`, `documents/`, `recommenders.md`, or `packets/` — those belong to other skills, and the user will be routed there when needed; this skill does not do that work on their behalf. The only two places this skill creates or appends content are: new/modified rows in `programs.md`, and the sections this phase owns inside files of the form `channels/<channel_key>.md`.

## 2. The Thirteen Columns of `programs.md`

`programs.md` at the workspace root is the single program pool, one row per program. The first time content is written into the pool, also write a `season_downgraded` block table into this file's frontmatter, keyed by this phase's name — the literal string 选校 (program selection) — with the current application season as the value — this stamp is written at the same time as the content, and every later downgrade re-stamps it; if this line is missing, that can only be read as "this phase has no content in this file yet," never as staleness.

Thirteen columns; column order is part of the contract — any new column must be appended at the end, never inserted in the middle:

1. `program_key` — primary key, ASCII, of the form `<school>--<college>--<program>` (e.g. `columbia--seas--cs-ms`).
2. `school` — free text, Chinese allowed.
3. `college` — free text, Chinese allowed.
4. `program` — free text, Chinese allowed.
5. `channel_key` — ASCII foreign key pointing to `channels/<channel_key>.md`; multiple programs under the same channel can share one `channel_key`.
6. `tier` — ASCII enum `reach` / `match` / `safer` / `undecided` / `ineligible`; a judgment, never backed by an evidence marker (Section 5 details what each tier asserts).
7. `deadline` — date; write `待核实` if it cannot be found (may carry a closed-list suffix from Section 8); this column is the only thing `evidence` backs.
8. `status` — ASCII enum, full table below.
9. `evidence` — `✓ <url>` or `待核实`; it is itself a marker, and it is accountable only for column 7, `deadline` — tuition, admission thresholds, CIP classification, application fees, and every other fact of that kind are never backed by it; their verification status all lives down in the matching section of `channels/`, each carrying its own marker.
10. `tier_basis` — one sentence, no pipe characters, no line breaks; empty ⇒ `tier` must be `undecided`; `tier = ineligible` ⇒ this column must be non-empty.
11. `tier_void_if` — one sentence, likewise no pipes, no line breaks, required; its direction flips with the tier (Section 5 has the details).
12. `pseudo_safer` — ASCII three-valued `yes` / `no` / `unknown`; fill in `unknown` when it cannot be judged — do not take the shortcut of writing `no`. `no` asserts "both halves of the signal have already been examined and it has been determined not to be one," not a default value. When it is `yes`, `tier` must never be `safer` (Section 5 has the criteria).
13. `status_note` — one sentence, no pipes, no line breaks; required with one line of reasoning when `status = dropped`, may be left empty for other statuses.

The five values of `status`:

| Identifier | Meaning |
|---|---|
| `considering` | Just entered the pool, still being researched |
| `shortlist` | Seriously under consideration, not yet decided to apply |
| `applying` | Decided to apply, not yet submitted |
| `submitted` | Already submitted this season — this skill only records this after the user reports it; the product itself never produces this state change |
| `dropped` | Explicitly excluded; `status_note` must carry one line of reasoning |

The boundary between `shortlist` and `applying` is the moment the user decides to apply, not the moment they sit down to fill out the form — "starting the form" produces no state change. `dropped` (explicitly excluded) is different from a program that never entered the pool at all: the former carries a history of having been considered and then rejected.

For free-text columns that have nothing to write (`school` / `college` / `program` / `tier_basis` / `tier_void_if` / `status_note`), leave the cell empty — do not fill it with a placeholder such as "无" (none), "N/A", or "——" (a dash). A placeholder degrades "does this cell have a value" from a mechanical check into a semantic one, and whether `tier_basis` is empty or not is exactly the input to one of the mechanical rules that tiering depends on. No cell may ever contain a pipe character — even an escaped one still gets cut apart by the table parser. Anything that needs prose belongs in `channels/`.

## 3. The Sections `channels/` Assigns to This Phase

`channels/<channel_key>.md` is the per-channel constraint layer: one channel file is divided into several sections, and each section is owned by exactly one phase for writing — no section may ever have two writers, and no fact may ever have zero writers. This phase owns the following:

- `平台与账号` (Platform & Account) — the first piece of information that decides "can I even apply here"; both program selection and packet assembly need it, but selection consumes it first, so this phase is its owner.
- `硬约束` (Hard Constraints) — procedural restrictions; does not hold cost-type facts. See Section 4's scope statements for what it does and does not take.
- `学历门槛` (Academic Threshold) — the anchor for tiering, the whole category of published admission floors. See Section 4's scope statements for what it takes.
- `费用与资格` (Fees & Eligibility) — money owed during the application season, plus the program's own eligibility attributes. See Section 4's scope statements for what it takes.
- `AI 使用政策` (AI Use Policy) — decides whether AI-generated content can go into this application; program selection consumes it first (Section 7 has the details).

The same channel file also has several other sections owned by other phases (`项目内容` (program content), `文书规格` (essay specs), `材料上传` (materials upload), `推荐信机制` (recommendation-letter mechanism), `冻结点` (freeze points), and the like); this skill does not write them, does not pre-create them, and does not record anything into them even when it stumbles onto the fact — a placeholder row is still a write, and selection stumbling onto something does not mean selection should record it. Absence means "not yet checked"; the owning phase will come check it when it gets there.

Section names must pass a closed word list: first strip from the start of the heading every character that is not a Han character, a Latin letter, or a digit (emoji, decorative asterisks, full-width spaces, dashes, and the like); then prefix-match what remains against the section names in the word list — a match makes it valid. When this skill creates a new heading, any decorative characters at the very front must fall entirely inside the segment that gets stripped — what immediately follows the stripped segment must be the section name itself from the word list, with no decorative character wedged inside the name breaking the anchor. Whatever comes after a colon or dash in the heading (a cross-channel comparison note, for example) is free-form, as long as that supplementary text does not sit in front of the section name. There is also one owner-less overlay section, `## 项目级差异` (Program-Level Differences) — not another legal category, but a per-program overlay layer shared by every category; its structure is given below.

Every bullet inside a section falls into one of two kinds: a fact line asserts "the school has an answer on this," and must carry an evidence marker (`✓ <url>` or `待核实`; rules in Section 8); a judgment line is this workspace's own inference or rendering recipe, opens with a top-level `- → `, and carries no marker at all. An indented continuation line follows whichever bullet it belongs to and is never classified on its own. Marking a judgment line with `✓` fabricates a source out of nothing; marking it `待核实` creates an entry that can never be verified off — neither is allowed to happen. Only build the sections this phase actually gathered evidence for — never pre-build an empty section just to look complete; the absence of a section is itself the information that "this channel has no special constraint of this kind."

`deadline` never goes into `channels/` — its verification status lives only in the `evidence` column of `programs.md`; recording it here as well would make a third copy. CIP classification is an attribute of the program itself, recorded as a `✓ <url>` fact, but its home is the overlay's `#### 费用与资格`, not the channel layer's `## 费用与资格` — CIP and channel don't line up one-to-one, since different programs under the same channel often each have their own CIP. Its downstream conclusion — "is this program STEM-designated or not" — is never recorded: that has to be worked out fresh each time by checking this CIP line against the official list, re-fetching the list page every time; when it cannot be fetched, present "not verified" honestly in the 自查清单 (self-check list) rather than pretending the question does not exist just because it could not be answered.

The overlay's structure is `## 项目级差异` → `### <program_key>` → `#### <法定节名>` (canonical section name); `### <program_key>` must match, character for character, the `program_key` of the corresponding row in `programs.md`. Every line under a `###` must land inside some `####` — a bare line, one written directly under the `###` without falling into any `####`, is invalid, because that is exactly "a fact with no writer to claim it." A `####`'s validity depends only on whether it passes the word-list match after stripping, regardless of whether a `##` of the same name exists elsewhere in the file — a program-level fact can perfectly well have nothing to say at the channel layer.

## 4. When a Section Name Falls Outside the Word List, Check the Scope Statements First — Don't Add a Word-List Entry

The closed word list of section names is, for now, just those few entries; besides this phase's own, a few more belong to other phases. When a `##`/`####` heading cannot be made to pass the prefix match no matter how it's stripped, the only step this skill is authorized to take first is to check whether the fact already has a home in some existing section's scope statement — not to add a word-list entry. The default assumption is always "this fact already has a home, it just hasn't been found yet," never "the word list is missing an entry."

The scope of a few sections has already been spelled out clearly; check against these sentences one by one when judging — they are not an invitation to free association:

- `硬约束` holds procedural restrictions such as "only one program per semester" or "no one but the applicant may submit on their behalf"; the only home for cost-type facts is `费用与资格`, and `硬约束` does not take them.
- `费用与资格` takes two kinds of facts: money owed during the application season (application fees and their waivers), and the program's own eligibility attributes (CIP classification, STEM designation). Both are consumed by program selection; the owner does not change.
- `学历门槛` takes the entire category of "the admission floor the school publishes and imposes on applicants," together with everything needed to make sense of that floor: the academic credential itself (undergraduate-institution tier, degree and transcript authentication/evaluation, grade-conversion basis), the GPA line, and standardized-test lines (GRE, and language-test scores such as TOEFL / IELTS / Duolingo). Also included: the tier structure of that line (the name and value of each tier when there are multiple), scale conventions (test date and scale switchovers), the consequences of falling short and how it is granted (whether post-enrollment remediation, case-by-case discretion, or conditional admission counts as a real admission path), and not-yet-verified questions such as "which tier applies to this program." The criterion is whether the fact describes "what the applicant must meet, and what happens if they don't" — not "what this program is."
- `项目内容` takes the named facts a why-this-program paragraph needs to cite — course numbers, professors, labs, centers, program-specific curriculum structure. This section belongs entirely to the essay-writing phase; when this skill discovers content that belongs there, it recognizes it as such per this sentence but does not record it, leaving it for the essay-writing phase to look up on its own.

The four sentences above are the sole authoritative statement of what each of these sections takes; they will be cited elsewhere, so do not reword them. Wherever else this file mentions what these sections take, give only a one-line functional gloss and point back to this section — do not repeat the full sentence.

Only after checking against these sentences and still finding no home should the question of whether a category is genuinely missing be considered — but that is not something this skill can decide on its own at runtime. When this genuinely happens, tell the user honestly that this fact currently has nowhere to be recorded, and stop — do not force it into the nearest section just to keep the process moving, and never invent a new section name on your own.

## 5. Tiering

Tiering (`tier`) is an advisory judgment and never carries an evidence marker; five tiers:

| Identifier | What it asserts |
|---|---|
| `reach` | You meet the hard thresholds, but the main reason you'd be rejected is that other applicants are stronger than you, and the data needed for that comparison is not public |
| `match` | You meet the hard thresholds, and there is public signal placing you in the middle of its admitted-applicant pool |
| `safer` | You've cleared the program's published second line, and the main risk of rejection is not your qualifications |
| `undecided` | None of the above three can be supported with a basis |
| `ineligible` | At least one of the program's public dimensions has been verified as unmet |

`safer` never asserts "will be admitted" — it only asserts "the reason for rejection won't be your qualifications"; do not force a tier that can't be made to fit.

**Thresholds and the second line.** The first four tiers are all anchored on the hard threshold (the minimum admission requirements the program states publicly — minimum GPA, minimum language score, prerequisite courses, whether GRE is required). The authority to set the `safer` bar belongs to the school, not this skill: it requires clearing a second number the program publishes beyond its minimum line, and that comes in two forms; the test is whether the wording describes "who is eligible to apply" or "who got admitted" —

- Type A (a higher, published soft threshold): wording such as `recommended` / `preferred` / `expected`, a GRE-waiver threshold, or a conditional-admission cutoff — these describe eligibility, and clearing one earns `safer`.
- Type B (the admitted-cohort distribution): wording such as `typically` / `average` / `median` / `middle 50%` — these describe admission outcomes; falling within the range counts as `match`, and only clearing the published range's upper bound counts as `safer` — reaching `safer` via Type B requires dispersion (a range); giving only a single median or a floor value never supports a `safer` judgment.

The trigger wording only hints at the type, it cannot substitute for judgment: when wording and substance conflict, judge by substance — if the school explains elsewhere that this number is "the average score of admitted students, not a minimum line," it must be judged Type B even if the column header reads like Type A wording. When a program publishes only one line, there is no second line to clear, and `reach` is then a terminal state, not "haven't checked enough yet" — regardless of how strong or weak the applicant's own qualifications are.

The complete criterion for `safer` is a conjunction: (1) every public dimension is met; (2) at least one dimension clears the second line (Type B requires clearing the range's upper bound); (3) no dimension is grazing the line — grazing means "this dimension has a second line, and you haven't cleared it"; a dimension with only one line can never be grazing. A non-numeric binary dimension (whether a prerequisite course was taken, the country category of the undergraduate institution, and the like) can only block, never establish: it can knock out `safer`, but can never, on its own, establish `safer`.

The split between `undecided` and `ineligible`: "haven't taken TOEFL yet" is `undecided` (it's unknown whether you meet it), "scored 95, the requirement is 100" is `ineligible` (it's known that you don't meet it). `ineligible` is a factual axis, unrelated to whether the user decides to apply anyway — applying as a long shot to a program you fall a bit short of is a legitimate choice; `ineligible` sets no blocking gate, it is only surfaced once, when the user moves the row to `applying`. The direction of `tier_void_if` on an `ineligible` row is the reverse of the other four tiers: the void condition states the good news (e.g. "TOEFL reaches 100"), and it may only say "this would no longer be `ineligible`" — it must never be written as any assertion about the size of one's admission odds. Returning to the passing line is only a return to `reach`'s starting point; which tier it rises to requires re-running the full conjunction above.

**Basis (`tier_basis`).** This is not a new form of evidence — it is a pointer to an existing `✓` fact. A signal earns a place in this cell if and only if it already is, or can be written as, a fact line in `channels/` carrying `✓ <url>`, or is the `deadline` column of `programs.md` — the test is not "does this signal sound credible," it is "does it have a home in a line marked `✓`." The applicant's own background counts as a basis: all three tiers are comparisons of "you vs. the line the program publishes," and no basis can be written at all without a profile. Phrase it only as "the relationship between your X and this program's published Y" — never slide into an admission probability. This cell carries no URL, is one sentence, no pipes, no line breaks; the source lives on that fact line in `channels/` — basis and source are physically separated, and `✓` is what connects them. Two mechanical rules: `tier_basis` empty ⇒ `tier` must be `undecided`; `tier = ineligible` ⇒ `tier_basis` must be non-empty. Tiering is therefore a byproduct of gathering facts, not a substitute for it: to tier a program, the supporting facts must first be gathered into `channels/`.

**Void condition (`tier_void_if`).** One sentence, no pipes, no line breaks, required — write it even when there is little to say. It is accountable for exactly one thing: what circumstance would make this tiering judgment no longer hold. `reach`'s void condition is mostly a derivable boilerplate, and it is still required — the point is to keep "when does this tiering expire" explicit across sessions.

**The premise when the basis cites a standardized score.** A score can only be compared against a threshold on the same scale, and the scale is determined by the test date, not by the score itself; the test-date column of the score table in `profile.md` at the workspace root is required, and whenever `tier_basis` / `tier_void_if` cites a score, that score must be resolvable to a row with a test date in the score table. When the school's published conversion table cannot be found, do not interpolate one yourself — that fabricates a number out of nothing, the same class of failure as producing a `✓` line from memory.

**Pseudo-safer (`pseudo_safer`).** This is a purely program-level, counter-intuitive flag: the program's nominal threshold is low (at its most extreme, explicitly stated as `no minimum GPA`), yet the actual admissions direction is extremely competitive. It corrects the user's prior ("not highly ranked means it's a safety"), not this skill's tiering — programs of this kind are already tiered `reach` on the tiering side, because the program publishes no second line and no one can earn `safer`. Both halves — "nominally low threshold" and "extremely competitive direction" — each need their own `✓` fact line in `channels/`; fill in `unknown` when this cannot be filled in fully, and never borrow `tier_basis` / `tier_void_if` for it. Mechanical rule: `pseudo_safer = yes` ⇒ `tier` must never be `safer` — pseudo-safer corrects a prior, it cannot turn around and override a `safer` derived from an actual second line; doing so would let advisory experience override data the school itself published. It occupies no cell of the tiering table; it renders as a standalone note inside the advisory-judgment section. Its own expiry can be computed on the fly from the two `✓` facts and is never recorded.

**Red line.** No admission-probability number is ever output, in any location, in any form — `safer` asserts only "the reason for rejection won't be your qualifications," not "will be admitted." The tier column itself, `tier_basis`, and `tier_void_if` never carry an evidence marker: they are judgments, not facts copied straight off some URL, and the `evidence` column's guarantee stops at `deadline`.

## 6. Output Shape: Facts and Judgments Physically Separated

The program-selection material this skill produces is always split into two physically separate blocks — never a single passage that mixes narration and judgment.

The first block is the pure fact table — the rows of `programs.md` itself, plus the fact lines in `channels/` that each carry an evidence marker. This block answers only "what does the school's official site say," with no admixture of this skill's own judgment.

The second block is the advisory-judgment section; only here do tiering conclusions, bases, void conditions, and any pseudo-safer notes appear, opening with an explicit statement that this section is this skill's judgment, not the school's own words — the reader should never have to guess which sentence came from the official site and which came from this skill. Each tiering judgment appears as a "conclusion + basis + void condition" triplet, and the triplet carries no new unmarked assertion beyond the fact named in the basis cell itself.

## 7. AI Use Policy

`AI 使用政策` (AI Use Policy) is a section this phase owns: whether a program allows AI in application materials, and whether disclosure is required — program selection consumes this first. This information decides whether to filter a program out, and also shapes what the essay-writing phase can put on the page, but the writing constraints themselves belong to the essay-writing phase; this skill's job is only to read this channel's own policy clearly and record it.

The evidence method is exactly the same as for every other section: find the official-site text, and excerpt it into a fact line carrying `✓ <url>`; when the official-site text has been checked and truly has no relevant clause, write `待核实（官网未列）`; when it has not yet been checked, write bare `待核实` with no suffix — these two must never be conflated, and neither may ever be read as "so AI use is allowed." Policy silence does not mean permission, and "checked" must never substitute for "not yet checked" or vice versa: skipping the search and simply assuming "probably no rule" is the same class of failure as treating verified silence as permission.

Underneath that fact line, follow with a judgment line opening with `- → ` that spells out how this skill intends to handle it, and states honestly whether this is a presumption: when the official text is vague or simply silent, apply a conservative baseline — grammar/spelling-level assistance is fine, substantive ghostwriting is not, whole-paragraph translation is not — and say explicitly that this is a presumption, not the school's own written word; within the same school, if this program's own college has no findable policy but another unit at the same school that sits organizationally closer to it has already turned up a stricter policy, that conclusion may be borrowed as a conservative default — but state just as clearly that this is a borrowed presumption, not this channel's own original text.

A single essay draft is often submitted to multiple schools at once; in that case, whether a given passage can be written this way right now must be judged by the strictest reading among the currently relevant programs — but this "currently strictest" is always computed fresh at the moment it is needed, never a value this skill pre-computes and stores in the workspace: the program pool can gain a program at any time, and any channel's policy reading can change at any time through re-verification, so storing a computed value would go stale the instant it's written. What this skill records is only each channel's own judgment line; combining those judgment lines to decide whether a specific piece of text can be written this way right now is the job of whatever step consumes this information — it is outside this skill's recording scope.

## 8. Evidence Discipline

The evidence marker is binary: `✓ <官网链接>` (official-site link) asserts "this fact was taken from this URL"; every other case is `待核实` (pending verification). `✓` has exactly two legitimate sources: this skill actually fetched that URL's page body within this session, or the user supplied this fact along with its link themselves. A search-result snippet does not count as a fetch — a snippet may come from a stale index cache, and treating it as verified is the same failure as writing from memory. This skill never produces a `✓` line from memory under any circumstances; this matters most of all for facts like `deadline`, thresholds, and fees — a number reported from memory is more dangerous than leaving the cell blank.

A failed fetch — offline, tool call denied, page unreachable, a PDF or dynamic page that cannot be parsed — is a different situation from a successful fetch whose body genuinely contains no such fact, and the two must be recorded separately: the former gets bare `待核实` with no suffix, and the next step is "go check again"; the latter gets `待核实（官网未列）`, and the next step is "checking again won't help, email the admissions office." This skill must never describe a failed fetch as "the official site doesn't say." Fetch granularity attaches to the page, not to a single fact — one fetch covers every fact visible in that page's body; a fetch from a previous session does not count, and every `✓` must come from a fetch actually performed in this session, or from something the user supplied on the spot.

`待核实` may carry a suffix from a closed word list, in two categories that can co-occur; neither participates in any mechanical rollup (the `待核实` state itself still counts as fully pending regardless; the suffix only becomes an action prompt when generating a 自查清单 (self-check list)):

**Reason suffix** — explains why it hasn't been verified yet, drawn from a closed word list:

| Suffix | Meaning | Next step |
|---|---|---|
| (none) | Not yet checked | Go check the official site |
| `官网未列` | Official site checked, it doesn't say | Checking again won't help, email admissions |
| `口径不清` | Found it, but the year, cohort, or meaning is unclear | Pin down what it refers to before using it |
| `需邮件确认` | Only obtainable by contacting the institution | Email directly |

**Downgrade suffix** — one form, parameterized: `<上一季> 核过：<链接>` (verified in \<last season\>: \<link\>), used when a season change downgrades last season's `✓ <链接>` to pending verification; the last season's link must be kept — erasing the link turns "re-verify" into "start from zero."

When both are present, the reason comes first and the downgrade comes second, separated by a semicolon: `待核实（官网未列；2026fall 核过：<链接>）`.

A season change only does a lazy downgrade — it is not a trigger to re-check the entire workspace in one pass just because the application season changed. This skill owns `programs.md`'s `evidence` column and the sections of `channels/` this phase owns; after entering a new application season, an expired `✓ <链接>` is only swapped for pending verification, with last season's verified link attached, at the moment some channel or fact is actually revisited — keeping last season's link, since erasing it turns "re-verify" into "start from zero"; a section that hasn't been revisited keeps last season's marker, which is more honest than pretending it was rechecked. The first time this phase's first section is recorded in a given channel file, stamp this phase's row in that file's `season_downgraded` table with the current application season on the spot, and re-stamp it on every later downgrade; if this line is missing, that can only be read as "this phase has no content in this file yet," never as staleness — but this premise requires the content and the stamp to be written at the same time, never content without the stamp.

The user can ask at any time for a freshly computed pending-verification checklist (待核实清单) and gap list (缺口清单) — this skill computes them on the spot from the current state of the workspace and prints them out; they are never saved as a file.

Evidence-gathering actions must be recorded into `log.md` at the workspace root: append-only, each entry recording only "what action was taken + where in the workspace it points" (e.g. "verified the academic-threshold section for columbia--seas"), never recording the content itself — no score numbers, no channel source text.

## 9. Stop Lines

The following three categories, ten items, are things the product explicitly does not do, shared across all four skills; this skill has no exception to any of them.

**Action category, six items**: never log into any account on the user's behalf; never upload any sensitive file; never sign any legal declaration on the user's behalf; never pay any application fee on the user's behalf; never click submit on the user's behalf; never send an invitation to anyone in a recommender's name.

**Data category, three items**: never read the content of identity-document files; never delete any file in the workspace; never carry any workspace content — even a version this skill itself has rewritten — into this product's own code repository.

**Evidence category, one item**: this skill never produces a `✓` line from memory under any circumstances. This red line matters especially here — every fact recorded during program selection can directly decide whether a program is judged `safer` or `reach`, eligible or `ineligible`; filling in a number from memory doesn't just look bad, it can produce a false judgment that misleads an entire season's application strategy.

## 10. Privacy Red Lines

**One-way valve**: content flows only from the product's side into the user's workspace, never the reverse — the page bodies this skill fetches and the channel constraints it organizes are written only into the user's own workspace, and none of it is ever carried back into this product's own code repository; this is the same boundary as Section 9's third data-category item, stated a different way.

**This phase has almost no contact with the applicant's own private materials**: what this skill reads and writes is mainly information the schools publish publicly, not identity documents, original transcripts, or the material library. Even so, if the user pastes any lead pointing to an identity document (passport, green card, I-20, and the like) into a program-selection conversation, this skill still does not read that content — the test is "reading it wouldn't help anyway"; program selection has no use for the content of an identity document itself, it only needs to know whether the user has one.

**Raw material and the final phrasing are two different things**: this skill does not produce essay or recommendation-letter content aimed at a third party, but if an experience the user mentions in conversation is sensitive in nature (for example, explaining a GPA dip for health or family reasons), before paraphrasing it into any workspace file, lay out "what the user actually said, and how it's about to be written" for the user to confirm line by line, the same as elsewhere — this rule governs content flowing into a deliverable, not the conversation between the user and this skill itself.
