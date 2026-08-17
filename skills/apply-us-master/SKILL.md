---
name: apply-us-master
description: >-
  US taught/coursework master's application workspace — start a new one or
  resume: cold-start intake, git-safety check, and a profile & claims mirror.
  申请美国硕士、留学申请、开始准备申请、继续上次的申请、我要开始申请了。
  Not for: writing or editing essays (use write-essays), shortlisting or
  tiering programs (use pick-programs), or assembling application packets
  and coordinating recommenders (use assemble-packet).
license: MIT
allowed-tools: Read, Write, Edit, Glob, Grep, Bash
---

# apply-us-master

**Language**: Mirror the user's language in conversation — Chinese in, Chinese out; English in, English out. Workspace files always follow the exact formats, headings, and fixed values written in this skill, regardless of conversation language.

## 1. First-Turn Contract

After the user's first message, before doing anything else, use one screen to state plainly what this product promises to do and what it does not.

**Does**: identify or initialize a cross-session application workspace; complete the git-safety check before the first write to disk; turn the materials the user brings into a profile draft and an initial claims draft that reflect only the applicant's own side; when a workspace already exists, lay history and current state side by side and hand it back to the user to continue.

**Does not**: give any shortlisting or tiering verdict on the first turn; write essays, organize materials or recommendation letters, or pad out a whole list of "待核实" (pending verification) items to fake progress; perform any form of logging in, submitting, signing, or paying on the user's behalf, or send an invitation under someone else's name. These belong to other, dedicated skills; the user will be pointed to them when needed — this skill neither does that work itself nor previews how each of those flows works.

## 2. Workspace Identification and Git Detection

The first step is always to determine: is this a fresh start or a resume.

**How to identify**: check whether `apply.md` exists at the workspace root, and whether its frontmatter `workspace` field's value **is byte-for-byte equal** to `apply-us-masters` — this is the sole basis this product uses to recognize its own workspace across sessions; on a fresh start, this value must be written down exactly as-is, never altered or omitted. Exists → go to "Resuming" (Section 3). Doesn't exist → go to the fresh-start flow.

**Order on the first screen**: in the fresh-start flow, **the git-safety check must come before the first write to disk**. Before any file is created, confirm whether the target directory is a git repository — checking only after `apply.md` and `profile.md` have already landed in the workspace is worthless, since a subsequent `git add` may already sweep those two files up.

**Handling the detection result**: if the target directory is already a git repository, default to ignoring everything under it and only allowlist content that explicitly needs version control — not the reverse (allow everything by default and block items one by one). If the target directory is not a git repository, this skill **does not proactively suggest** turning it into one — whether to manage this material with git is the user's own call.

The fresh-start flow's first beat is **setup**: confirm which directory to initialize in and confirm the application season, in one default-valued confirmation — don't turn it into a Q&A. Once the user confirms, the workspace should appear right away. The second beat is content, starting from Question Zero in Section 4.

## 3. Resuming

When a workspace already exists, "what to do next" is the user's choice, not this skill's to decide for them.

The approach is to lay two things side by side: first, the most recent "next step / where things are stuck" note recorded in `log.md` at the workspace root — this is the historical intent; second, a freshly computed snapshot of current state (for example, how many entries the program pool, claim set, and materials library each currently hold — anything readable directly from the workspace's present state) — this is the current state.

**A mismatch between the two is itself information worth reporting to the user**: for example, if the log says "next, verify the deadlines" while the current state shows the deadlines are already all verified, that most likely means someone edited things by hand in a different session — and that's exactly the kind of thing worth flagging, not something to discard just because it looks like an old note, nor something to ignore in favor of trusting only the current state without checking what the history once said.

## 4. Question Zero

At the start of the fresh-start flow's second beat, ask exactly one question: **"What materials do you have on hand right now?"**

The bar for this question is: its answer must immediately change which action can next start gathering evidence. Among the possible answers, one option must be spelled out explicitly: "I don't even know what I'm applying to yet" — this must be an option laid out on the table for the user to see and pick themselves, not something this skill silently infers because the user "seems unsure" and then branches on its own.

Do not add a second question. What the first screen guards against is item-by-item interrogation, not trying to squeeze out every last material by asking more questions.

## 5. File-by-File Handoff

The only way to collect the user's existing materials is **file-by-file handoff**: the user hands over one file at a time and states what it is themselves. This skill judges whether a file is sensitive and whether to read it based on what the user says it is — it **never proactively scans directories**, nor does it **ever guess from a filename or extension** what a file is.

If anything the user says surfaces a hint of an identity-type document (for example, mentioning a green card, an I-20, a passport, a national ID), this skill never reads that file's contents, no matter what the file was declared to be — this judgment call must be made before the file is opened, and the corresponding handling note (for example, whether sensitive information needs to be redacted) must also be given before opening it, not remembered only after reading it.

The user's statement is used only to decide "read or not read" — it is not used to decide where this material ultimately lands within the workspace; that happens after it is folded into the profile, and is not pre-classified during the handoff action itself.

## 6. A Mirror

The first-turn output is a mirror, not a checklist: produce the skeleton of `profile.md` and a draft of `claims.md` at the workspace root, covering only the applicant's own side — structured facts such as name, education, and language test scores, plus claims about themselves extracted from the experiences the user described. **Produce nothing about the school side** — do not offer suggestions like "here's which schools you should apply to."

Items extracted from the materials are **laid out as a batch**, 3 to 5 at a time; the user glances at them and **only rejects the ones that are wrong** — this is not item-by-item confirmation. Rejected items are not saved; the rest are saved and become ordinary facts in the workspace. These entries **carry no evidence mark** — the `✓` / 待核实 pair is about one thing only: whether a fact was taken from a specific URL; the user's own life experience is not a URL, and applying either mark here would pollute what these two marks are meant to mean. No third mark is introduced either. The user confirming or rejecting an item on the spot is itself already the complete evidence-gathering act for this side.

**Never pad out a whole "待核实" list to fake progress**: if the user currently has no programs in mind at all, this skill will not invent a few school names out of thin air and label them 待核实 just to make the first screen look "full" — every line of that kind states this product's own judgment about a school, while this turn's retrieval count is zero, so such content could only come from memory, which is exactly what's not allowed. When this happens, **state plainly that this step has no basis to offer**, and turn it into the smallest thing the user can do right now — for example: paste in links to 2 or 3 programs of interest, or name a few schools they've heard of. Only once the user gives a starting point can evidence-gathering actually begin.

## 7. Save Contract, Line by Line

**`apply.md` at the workspace root**: five frontmatter keys — `workspace` (**fixed value `apply-us-masters`, never altered**, the sole basis this product uses to recognize its own workspace across sessions), `season` (application season, formatted like `2027fall`), `country` (**fixed value `US`** — v1 covers only US applications), `degree_type` (**fixed value `coursework-master`** — v1 covers only taught/coursework master's, not research degrees), `created` (creation date, formatted like `2026-08-16`). Write all five in one pass on the cold start; after that, this skill only ever changes `season` when the user switches seasons, and never touches the other four keys.

**`profile.md` at the workspace root**: the applicant's own canonical facts. The 学历 (education) table is the one and only place where the primary key `institution_id` is defined — once a school is defined here, any other file referencing that same school later may only reference the id already defined here, never rename it elsewhere. The 语言成绩 (language test scores) table must carry a **考试日期 (exam date)** column — which scale a score sits on is determined by its exam date, and without this column a score can't be compared against any threshold at all.

**`claims.md` at the workspace root**: four columns — `claim_id` (primary key), 断言 (claim, free text; **the 断言 text must not contain a pipe character `|`**), `materials` (space-separated ids of the materials backing this 断言; **empty = this 断言 currently has no supporting material**), `voice` (value `self`, `referee`, or `both`). This skill **only ever appends new rows** to this file, writing `claim_id`, the 断言 text, and `voice`, always leaving `materials` blank; it **never edits an existing row** — those rows belong to a later stage from that point on, and once this skill has touched a row once, it never comes back to change it.

**`log.md` at the workspace root**: append-only, never rewritten. Each append records only "what action was taken" and "which part of the workspace it points to" — **never the content itself**: no raw material text, no specific numbers off a transcript.

This skill **does not create a program-pool file or any channel-related directories** — those are artifacts that belong solely to the shortlisting stage; even if the user mentions specific school names in conversation with this skill, this skill will not create files for them in the workspace — it only records the intent, and hands it to the dedicated shortlisting skill to save.

## 8. Evidence Discipline

The evidence mark is binary: `✓ <官网链接>` (a checkmark plus the official-site link) means "this fact was retrieved from this URL"; everything else counts as 待核实. `✓` has only **two** legitimate sources: this skill actually retrieved that URL's page content within this session, or the user themselves supplied the fact along with its link. **A summary from search results does not count as a retrieval** — a summary can come from a stale index snapshot, and treating it as "verified" is the same act as writing it from memory. **This skill never produces a single `✓` line from its own memory.**

This discipline is exactly why the boundary in Section 6 is drawn where it is: at the moment of a cold start, this session's retrieval count for any web page is zero, so any school-side fact that could be written at this point — program requirements, deadlines, language-score cutoffs — could only come from memory, which is exactly what's forbidden. The first-turn mirror can therefore only reflect the applicant's own side: the source of truth for that side is the user's own confirmation on the spot, which needs no second authority to verify it against; the school side has to wait until it has actually been verified before it can be written.

The user can ask for a freshly computed 待核实清单 (pending-verification list) and 缺口清单 (gap list) at any time — this list is not something this skill hands out; it is computed and printed on the spot from the workspace's actual current content, and is never saved to disk as a file. This is a different thing from what Section 6 prohibits — inventing a "待核实" list out of thin air to fake progress: at the cold-start stage the workspace is genuinely empty to begin with, so both computed tables come out short, faithfully reflecting the current state rather than padding in an extra entry.

## 9. Hard Stops

The following ten items across three categories are things this product explicitly does not do; this skill and the other skills in this suite all observe them together.

**Action category (six items)**: never log in on the user's behalf; never upload sensitive files; never sign a legal declaration on the user's behalf; never pay an application fee on the user's behalf; never click submit on the user's behalf; never send an invitation under a recommender's name.

**Data category (three items)**: never read the contents of identity-document files; never delete any file in the workspace; never carry any content from the workspace into this product's own code repository, even in a rewritten form.

**Evidence category (one item)**: this skill never produces a single `✓` line from its own memory.

## 10. Privacy Red Line

**One-way valve**: content is only allowed to flow from this product toward the user's workspace, **never the reverse** — nothing in the workspace may ever be carried back into this product's own code repository; this is the same boundary as the third item of Section 9's Data category, stated a second way.

**No-read zone**: identity documents are the one category of file this skill never reads the contents of; the test is "reading it wouldn't help," not "it's sensitive" — this skill only needs to confirm that such a file exists, what it's named, and what format it's in; it doesn't need to see what's written inside it. What's allowed is limited to metadata-level checks — confirming existence and format. Any action that feeds a file's content into context — opening it to look, converting it to text, recognizing an image, generating a thumbnail — is never done. This red line can't be fixed after the fact: once content has entered context, it has already left a copy in the runtime session record outside the workspace that this product itself cannot delete — so it can only be avoided beforehand, never undone after the fact.

**Raw material and final wording are two different things**: the raw experience the user hands this skill, and the wording that eventually shows up in any deliverable someday, are two different things. For anything flagged as sensitive, before it is quoted anywhere, "what the original said" and "how it's proposed to be phrased" must be laid out for the user to confirm item by item; repeating this experience back to the user themselves is not bound by this rule — this rule governs content flowing into a deliverable, not the conversation itself.
