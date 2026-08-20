# Global working agreements

These are defaults for every project. Closer `AGENTS.md` files may refine them.

## Evidence and authorization

- Read the request, applicable instructions, and relevant source-of-truth documents before acting.
- Inspect the actual repository, Git state, code, tests, configuration, runtime, and any named issue or reference. Do not substitute conventions, filenames, generated artifacts, old notes, or guesses for current evidence.
- Use implementation and runtime for present behavior; use declared PRDs, designs, decisions, and runbooks for intended behavior unless the user changes direction.
- Prefer discovering answers from available context. Ask only when a missing choice would materially change the result or risk.
- Distinguish answering, researching, reviewing, planning, diagnosing, implementing, committing, pushing, deploying, and external writes. Research, review, planning, and diagnosis do not authorize changes. Implementation authorizes necessary local edits and safe verification, but not later lifecycle actions unless requested or required by project instructions.
- Do not expand scope silently. Respect milestones, review stops, release boundaries, and “do not implement yet.” Record follow-up work separately.
- Verify time-sensitive or high-stakes facts with current authoritative sources. Separate facts, evidence, and inference.

## Working method

1. Inspect the relevant requirements, implementation, tests, and runtime.
2. Make the smallest complete vertical slice, including authorization, validation, failure behavior, and user-visible states where relevant.
3. Follow existing patterns and preserve accepted product, design, and architecture decisions.
4. Run focused checks, then the strongest proportional repository-supported verification.
5. Inspect the final diff, including untracked files, and perform only requested lifecycle actions such as commit, push, deploy, or external updates.

- Avoid speculative abstractions, opportunistic refactors, new services, and production dependencies unless necessary. Explain material additions first.

## Verification

- Use commands supported by the repository. Do not invent test, build, seed, or deployment commands.
- Start with focused tests, then run applicable formatting, lint or static analysis, warnings-as-errors or type checks, broader tests, asset builds, and packaging checks proportional to the change.
- Read documentation changes in their final form and check the diff.
- Verify UI work through the real entry point when available, including meaningful flows, representative viewports, and applicable accessibility. A screenshot alone is not runtime proof.
- For security, migration, import, AI, and job work, verify relevant denial, isolation, validation, idempotency, redaction, and failure behavior. Use labelled isolated fixtures; deterministic fixtures do not prove live or production acceptance.
- Do not weaken tests, safeguards, authentication, data isolation, or production behavior to accommodate a local environment problem.
- If a check cannot run, report the exact blocker, what passed, and what remains unverified. Never present partial verification as full acceptance.

## Git and workspace safety

- Assume tracked and untracked changes belong to the user. Check status and diffs before editing and handoff; do not alter or include unrelated work without authorization.
- Keep commits coherent and verified. For “commit all changes,” inspect every tracked and untracked change and check for secrets first.
- Do not commit unless requested or required by project instructions. Do not push, amend, rebase, force-push, reset, or rewrite history unless explicitly requested.
- Explain what changed and why in commit messages. Report the commit and remaining tree state; distinguish staged, committed, pushed, deployed, and verified.
- If Git fsmonitor IPC fails, retry the scoped command with `git -c core.fsmonitor=false` rather than changing repository configuration. If signing fails, preserve staged work and ask the user to unlock the signer or authorize an unsigned commit.

## Data, production, and external systems

- Protect secrets and private or production data. Never expose them in tracked files, logs, fixtures, commits, or responses; use sanitized diagnostics.
- Default production diagnosis to read-only. Mutate production data, configuration, infrastructure, billing, email, or external services only with authorization and a clear target and blast radius.
- Before destructive or difficult-to-reverse work, resolve the exact target, explain impact and recovery, and obtain required confirmation.
- A local release or container build is “production-packaged,” not deployed. A deploy is complete only when the intended version is running and applicable migrations, health checks, logs, and a representative workflow are verified.
- Use external systems only when in scope. Inspect live state before updating it, and close work only after verification and delivery.

## Documentation and closeout

- Keep operational documentation copy-pasteable and repository-grounded, with prerequisites, environment differences, verification, troubleshooting, and recovery where relevant.
- Use repository `AGENTS.md` files for durable project sources, commands, invariants, design rules, deployment boundaries, and done criteria.
- Lead the final response with the outcome. State what changed or was determined, what was verified, and any exact blocker or remaining risk.
- Include relevant test, runtime, Git, deployment, and unverified status. Do not claim completion from a compile, local package, clean backlog, or commit alone when the outcome requires more.
