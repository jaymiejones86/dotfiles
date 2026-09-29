# ast-grep Rule Reference

This document provides a comprehensive reference for writing ast-grep rules.

## Rule Structure

Every ast-grep rule is a YAML file with this structure:

```yaml
id: unique-rule-identifier
language: javascript # or typescript, python, go, java, etc.
rule:
  # Rule definition here
message: Optional message to display on match
severity: hint | info | warning | error
fix: Optional fix template
```

## Atomic Rules

### pattern

Match code that syntactically matches a pattern:

```yaml
rule:
  pattern: console.log($MSG)
```

**Meta-variables in patterns:**

- `$NAME` - Matches any single AST node
- `$$$ARGS` - Matches zero or more nodes (variadic)
- `$_` - Matches any node but doesn't capture

### kind

Match AST nodes by their type (kind):

```yaml
rule:
  kind: function_declaration
```

Common kinds by language:

**JavaScript/TypeScript:**

- `function_declaration`
- `arrow_function`
- `call_expression`
- `method_definition`
- `class_declaration`
- `await_expression`
- `try_statement`

**Python:**

- `function_definition`
- `class_definition`
- `call`
- `await`
- `try_statement`

**Go:**

- `function_declaration`
- `method_declaration`
- `call_expression`
- `go_statement`
- `defer_statement`

### regex

Match nodes whose text matches a regular expression:

```yaml
rule:
  regex: ^test_
```

## Relational Rules

### has

Match nodes that contain a descendant matching a sub-rule:

```yaml
rule:
  kind: function_declaration
  has:
    kind: await_expression
    stopBy: end
```

**Important:** Always use `stopBy: end` unless you have a specific reason not to.

### inside

Match nodes that are inside an ancestor matching a sub-rule:

```yaml
rule:
  pattern: console.log($MSG)
  inside:
    kind: method_definition
    stopBy: end
```

### precedes

Match nodes that come before a sibling matching a sub-rule:

```yaml
rule:
  pattern: $A
  precedes:
    pattern: $B
```

### follows

Match nodes that come after a sibling matching a sub-rule:

```yaml
rule:
  pattern: $B
  follows:
    pattern: $A
```

## Composite Rules

### all

Match if ALL sub-rules match:

```yaml
rule:
  all:
    - kind: function_declaration
    - has:
        kind: await_expression
        stopBy: end
```

### any

Match if ANY sub-rule matches:

```yaml
rule:
  any:
    - pattern: console.log($MSG)
    - pattern: console.warn($MSG)
    - pattern: console.error($MSG)
```

### not

Match if the sub-rule does NOT match:

```yaml
rule:
  kind: function_declaration
  not:
    has:
      kind: try_statement
      stopBy: end
```

### matches

Reference another rule by ID:

```yaml
rule:
  matches: other-rule-id
```

## stopBy Options

The `stopBy` field controls how far relational rules search:

- `end` - Search to the end of the subtree (recommended default)
- `neighbor` - Only check immediate children
- A rule - Stop when encountering a node matching the rule

```yaml
rule:
  kind: function_declaration
  has:
    kind: await_expression
    stopBy: end # Search entire function body
```

## Field Matching

Match specific fields of AST nodes:

```yaml
rule:
  kind: function_declaration
  has:
    field: name
    pattern: $FUNC_NAME
```

## Nesting and Constraints

### nthChild

Match the nth child in a sequence:

```yaml
rule:
  kind: argument
  nthChild: 1 # First argument
```

## Fix Templates

### Simple fix

```yaml
fix: logger.info($MSG)
```

### Multi-line fix

```yaml
fix: |
  try {
    $BODY
  } catch (error) {
    logger.error(error);
  }
```

### FixConfig

For more control over the fix:

```yaml
fix:
  template: $NEW_CODE
  expandStart:
    regex: ",\\s*"
  expandEnd:
    regex: "\\s*,"
```

## Rewriters

Transform matched content before inserting into fix:

```yaml
rewriters:
  - id: uppercase
    rule:
      pattern: $NAME
    fix:
      transform:
        uppercase: $NAME

rule:
  pattern: $EXPR
fix:
  rewrite:
    rewriters: [uppercase]
    source: $EXPR
```

## Transform Operations

Available in fix templates:

- `replace`: Regex replacement
- `uppercase`: Convert to uppercase
- `lowercase`: Convert to lowercase
- `capitalize`: Capitalize first letter
- `camelCase`: Convert to camelCase
- `snakeCase`: Convert to snake_case
- `pascalCase`: Convert to PascalCase

```yaml
fix:
  transform:
    replace:
      source: $NAME
      pattern: '_'
      replacement: ''
```

## Debugging Tips

1. **Use --debug-query** to see AST structure:

   ```bash
   ast-grep run -p '$EXPR' --debug-query=cst file.js
   ```

2. **Start simple** - Begin with basic patterns, then add complexity

3. **Check kind values** - Use CST output to find correct node kinds

4. **Always use stopBy: end** for relational rules unless you need to stop early

5. **Test incrementally** - Verify each sub-rule works before combining

## Common Patterns

### Find unused variables

```yaml
rule:
  kind: variable_declarator
  not:
    inside:
      has:
        pattern: $VAR
        kind: identifier
```

### Find functions without return statements

```yaml
rule:
  kind: function_declaration
  not:
    has:
      kind: return_statement
      stopBy: end
```

### Find deprecated API usage

```yaml
rule:
  pattern: oldApi($$$ARGS)
fix: newApi($$$ARGS)
message: 'oldApi is deprecated, use newApi instead'
severity: warning
```

## Language-Specific Notes

### JavaScript/TypeScript

- Use `tsx` or `typescript` language for TypeScript files
- JSX elements have kind `jsx_element`
- Arrow functions: `arrow_function`
- Async functions have `async` keyword as a child

### Python

- Indentation-sensitive; patterns must match structure
- Function definitions: `function_definition`
- Method definitions are also `function_definition` inside `class_definition`

### Go

- Use `go` language
- Goroutines: `go_statement`
- Deferred calls: `defer_statement`
- Error handling typically uses `if` with error check
