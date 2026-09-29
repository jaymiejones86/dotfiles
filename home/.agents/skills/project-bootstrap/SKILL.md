---
name: project-bootstrap
description: Bootstrap a new repository with The Office-style operating conventions including AGENTS.md, GUIDELINES.md, DECISIONS, CHANGELOG, README, ordered tasks, and a Ralph loop script.
license: MIT
compatibility: Claude Code, OpenCode
metadata:
  owner: jaymiejones
  category: repo-bootstrap
  language: multi
---

# Project Bootstrap

Use this skill when a repository needs The Office-style working conventions and repeatable agent execution structure.

## Goal

Bootstrap a project so it has:

- `AGENTS.md`
- `GUIDELINES.md`
- `CHANGELOG.md`
- `DECISIONS/` with ADR-style decision records
- `README.md` with setup, usage, dependencies, and project purpose
- `tasks/` as the canonical ordered backlog
- `tasks/TEMPLATE.md`
- `ralph-tasks.sh` for one-task-per-loop execution

## When To Use

Use this skill when:

- starting a new codebase
- normalizing an existing repository to the preferred working method
- preparing a repo for Ralph/OpenCode task-loop execution
- setting up architecture/change-management discipline for future agents

## Workflow

### 1. Inspect the Repository First

Before writing anything:

- identify the actual stack and package manager
- identify existing commands for setup/build/test/run
- identify existing docs, task trackers, and repo structure
- avoid overwriting useful established conventions without reason

### 2. Add Root Operating Files

Create or update:

- `AGENTS.md`
- `GUIDELINES.md`
- `CHANGELOG.md`
- `README.md`

Requirements:

- `AGENTS.md` must document canonical commands, coding rules, verification protocol, and documentation discipline
- `GUIDELINES.md` must capture non-obvious architectural rules and constraints
- `CHANGELOG.md` must use session-style entries with date, summary, changes, files touched, and follow-up
- `README.md` must explain what the project is, dependencies, setup, how to run it, and current status

### 3. Add ADR-Style Decision Register

Create:

- `DECISIONS/README.md`
- initial ADR files with sortable numeric prefixes like `0001-title.md`

Each ADR should include:

- status
- date
- context
- decision
- consequences

Typical bootstrap ADRs:

- file/storage strategy
- execution/runtime model
- backlog/task-loop model

### 4. Establish Canonical Task Backlog

Create or normalize:

- `tasks/`
- `tasks/TEMPLATE.md`

Task rules:

- use numeric ordering: `001-some-task.md`
- use YAML frontmatter
- include scope, notes, and output sections
- mark completed tasks as `done`
- keep pending work as explicit future tasks

Recommended task frontmatter:

```md
---
id: 001
title: Example task
status: pending
priority: high
dependencies: []
category: setup
files:
  - path/to/file
acceptance:
  - One clear acceptance criterion
verification:
  - project-specific build/test command
---
```

### 5. Add Ralph Loop Script

Create `ralph-tasks.sh`.

The script should:

- accept iteration count as the first argument
- point OpenCode at the canonical `@tasks` folder
- instruct the agent to implement exactly one pending task
- require verification commands to run
- stop early when all tasks are complete using `<promise>COMPLETE</promise>`

### 6. Update Documentation for the New Workflow

When this bootstrap changes repository behavior, also update:

- `README.md`
- `CHANGELOG.md`
- `GUIDELINES.md`
- `DECISIONS/*.md`

## Output Standard

After using this skill, the repository should be able to answer:

1. What is this project?
2. How do I install and run it?
3. Where are the architecture rules?
4. Where are the technical decisions?
5. Where is the canonical backlog?
6. How do I run one-task-at-a-time Ralph loops?

## Constraints

- Preserve repo-specific commands and stack choices; do not paste generic commands blindly.
- Keep the bootstrap minimal and operational, not bloated.
- Prefer one canonical task source. Do not leave duplicate backlog folders around.
- If the repo already has a good convention file, adapt it rather than replacing it mechanically.
