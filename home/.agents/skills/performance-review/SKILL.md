---
name: performance-review
description: Performance review discipline for releases, perf diagnoses, and expensive-path changes. Use when checking queries, collections, media, third-party scripts, request-path work, or Phoenix LiveView responsiveness.
---

# Performance review

Scale the review to the affected flows. Routine documentation-only changes are exempt. Use the existing architecture and verification tools.

## When to review

Review before an authorized release, during performance diagnosis, and when changing queries, large collections, media delivery, third-party scripts, or expensive request-path work.

## Measure

- Measure representative flows with realistic data and constrained devices or networks.
- For websites, check initial loading, interaction responsiveness, and layout stability. For applications, also check query count and duration, payload size, and time until actions provide useful feedback.
- Compare before and after under comparable conditions; distinguish emulation, local checks, and live-device or production evidence. If a baseline is unavailable, say so.

## Check

- Optimize delivered media, fonts, scripts, and optional UI without changing accepted branding, original assets, private-storage boundaries, or workflows. Prioritize initial content and avoid unnecessary transfer or layout shifts.
- Bound queries, collections, payloads, and concurrency. Investigate N+1 queries and justify indexes using actual query patterns, existing indexes, and query plans with representative data. Consider write and storage overhead and migration locking. Run execution-based analysis only where its execution and load are safe and authorized.
- Keep interactions responsive. Use existing async and background-job mechanisms appropriately, with clear pending, failure, and retry states. Preserve edits, focus, scroll, and explicit acceptance.
- For Phoenix LiveView, check initial HTTP rendering, connected mount, event handling, and reconnect behavior. Avoid unnecessary repeated work, blocking operations, and unbounded assigns or rendered collections. Verify that patches preserve unsaved input, focus, and scroll.
- Define cache scope, keys, expiry, and invalidation, accounting for relevant account, user, permission, and input boundaries. Verify isolation and never allow cached private data to cross user or tenant boundaries. Never put private responses or signed asset URLs into public caches.

## Report and fix

- During review, report findings without changing implementation. When implementation is authorized, fix applicable issues within scope and verify each meaningful change. Record broader architecture, infrastructure, or product changes separately without expanding release authorization.
- Keep provider recipes, numeric performance budgets, supported audit commands, important flows, and device profiles in project guidance. Use delegation when useful and available, and consolidate findings before implementing fixes.
- Report tested flows, environment, before/after evidence, remaining issues, justified exemptions, and unavailable evidence. A good Lighthouse score alone does not prove application responsiveness or physical-device acceptance.
