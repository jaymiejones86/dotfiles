---
name: ast-grep
description: Structural code search using ast-grep AST patterns. Use when searching for code patterns, language constructs, or structures beyond simple text search.
license: MIT
compatibility: Amp, Cursor, VS Code Copilot, Claude Code, OpenCode
metadata:
  owner: platform-tools
  category: code-search
  language: multi
---

# ast-grep Code Search

## Overview

This skill helps translate natural language queries into ast-grep rules for structural code search. ast-grep uses Abstract Syntax Tree (AST) patterns to match code based on its structure rather than just text, enabling powerful and precise code search across large codebases.

## When to Use This Skill

Use this skill when users:

- Need to search for code patterns using structural matching (e.g., "find all async functions that don't have error handling")
- Want to locate specific language constructs (e.g., "find all function calls with specific parameters")
- Request searches that require understanding code structure rather than just text
- Ask to search for code with particular AST characteristics
- Need to perform complex code queries that traditional text search cannot handle

## General Workflow

Follow this process to help users write effective ast-grep rules:

### Step 1: Understand the Query

Clearly understand what the user wants to find. Ask clarifying questions if needed:

- What specific code pattern or structure are they looking for?
- Which programming language?
- Are there specific edge cases or variations to consider?
- What should be included or excluded from matches?

### Step 2: Create Example Code

Write a simple code snippet that represents what the user wants to match. Save this to a temporary file for testing.

**Example:** If searching for "async functions that use await", create a test file:

```javascript
// test.js
async function goodExample() {
  await fetch('/api');
}

function badExample() {
  console.log('no await');
}
```

### Step 3: Write the ast-grep Rule

Translate the pattern into an ast-grep rule. Start simple and add complexity as needed.

**Key principles:**

- Always use `stopBy: end` for relational rules (`inside`, `has`) to ensure search goes to the end
- Use `pattern` for simple structures
- Use `kind` with `has`/`inside` for complex structures
- Break complex queries into smaller sub-rules using `all`, `any`, or `not`

**Example rule file (test_rule.yml):**

```yaml
id: async-with-await
language: javascript
rule:
  kind: function_declaration
  has:
    kind: await_expression
    stopBy: end
  all:
    - has:
        kind: async
```

See `references/rule_reference.md` in this skill's directory for comprehensive rule documentation.

### Step 4: Test the Rule

Use ast-grep CLI to verify the rule matches the example code:

**Option A: Test with inline rules (for quick iterations)**

```bash
ast-grep scan --inline-rules '
id: test
language: javascript
rule:
  pattern: async function $NAME($$$ARGS) { $$$ }
' test.js
```

**Option B: Test with rule files (recommended for complex rules)**

```bash
ast-grep scan -r test_rule.yml test.js
```

**Debugging if no matches:**

- Simplify the rule (remove sub-rules)
- Add `stopBy: end` to relational rules if not present
- Use `--debug-query` to understand the AST structure
- Check if `kind` values are correct for the language

### Step 5: Search the Codebase

Once the rule matches correctly, search the actual codebase:

```bash
# For simple pattern searches
ast-grep run -p 'console.log($ARG)' ./src

# For complex rule-based searches
ast-grep scan -r my_rule.yml ./src

# For inline rules
ast-grep scan --inline-rules '...' ./src
```

## ast-grep CLI Commands

### Inspect Code Structure (--debug-query)

Dump the AST structure to understand how code is parsed:

```bash
ast-grep run -p '$EXPR' --debug-query=cst test.js
```

**Available formats:**

- `cst`: Concrete Syntax Tree (shows all nodes including punctuation)
- `ast`: Abstract Syntax Tree (shows only named nodes)
- `pattern`: Shows how ast-grep interprets your pattern

### Search with Patterns (run)

Simple pattern-based search for single AST node matches:

```bash
ast-grep run -p 'console.log($MSG)' ./src
ast-grep run -p 'function $NAME($$$ARGS) { $$$ }' --lang javascript ./src
```

### Search with Rules (scan)

YAML rule-based search for complex structural queries:

```bash
ast-grep scan -r rule.yml ./src
ast-grep scan -r rules/ ./src  # Scan with all rules in directory
```

## Rewriting Code with ast-grep

ast-grep can search for code patterns and transform them:

### Command Line with --rewrite

```bash
ast-grep run -p 'console.log($MSG)' -r 'logger.info($MSG)' ./src --update-all
```

### YAML Rules with fix

```yaml
id: replace-console-log
language: javascript
rule:
  pattern: console.log($MSG)
fix: logger.info($MSG)
```

### Meta-Variables

| Meta-variable | Matches                                            |
| ------------- | -------------------------------------------------- |
| `$NAME`       | Any single AST node (expression, identifier, etc.) |
| `$$$ITEMS`    | Multiple nodes (like function arguments)           |

## Common Use Cases

### Find Functions with Specific Content

Find async functions that use await:

```yaml
rule:
  kind: function_declaration
  has:
    kind: await_expression
    stopBy: end
```

### Find Code Inside Specific Contexts

Find console.log inside class methods:

```yaml
rule:
  pattern: console.log($$$ARGS)
  inside:
    kind: method_definition
    stopBy: end
```

### Find Code Missing Expected Patterns

Find async functions without try-catch:

```yaml
rule:
  kind: function_declaration
  has:
    kind: async
  not:
    has:
      kind: try_statement
      stopBy: end
```

## Resources

### references/

Contains detailed documentation for ast-grep rule syntax:

- `rule_reference.md`: Comprehensive ast-grep rule documentation covering atomic rules, relational rules, composite rules, and metavariables

Load these references when detailed rule syntax information is needed.
