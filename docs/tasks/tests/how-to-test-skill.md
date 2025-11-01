# Testing Your Skill

This guide explains how to manually test your Claude Code skill to ensure it works correctly.

## Overview

Testing focuses on verifying that Claude Code correctly invokes your skill and executes the appropriate actions when users ask relevant questions.

## Prerequisites

- [ ] Skill installed in `~/.claude/skills/{skill-name}/` or `$USERPROFILE/.claude/skills/{skill-name}/`
- [ ] Any required tools/dependencies installed (Python, jq, etc.)
- [ ] Claude Code is configured and running

## Installation for Testing

### Claude Code CLI

```bash
# Windows (Git Bash)
cd "$USERPROFILE/.claude/skills"
cp -r /path/to/your-skill-dev/{skill-name} ./

# Unix/Mac
cd ~/.claude/skills
cp -r /path/to/your-skill-dev/{skill-name} ./
```

### Verify Installation

```bash
# Check skill directory
ls -la ~/.claude/skills/{skill-name}/

# Verify SKILL.md exists
cat ~/.claude/skills/{skill-name}/SKILL.md
```

## Test Scenarios

Create test cases specific to your skill. Here's a template:

### Test Case 1: [Basic Functionality]

**User Request:**

```text
"[Example user question that should trigger your skill]"
```

**Alternative Variations:**

- "[Alternative phrasing 1]"
- "[Alternative phrasing 2]"

**Expected Behavior:**

1. Claude should recognize this matches your skill
2. Claude should execute: `[expected command or action]`
3. Output should show: `[expected output format]`

**Expected Output:**

```text
[Show what the output should look like]
```

**Validation:**

- [ ] Skill activated automatically
- [ ] Correct command/action executed
- [ ] Output format is correct
- [ ] Results are accurate

### Test Case 2: [Advanced Functionality]

**User Request:**

```text
"[More complex user question]"
```

**Expected Behavior:**

1. [Step 1]
2. [Step 2]
3. [Step 3]

**Validation:**

- [ ] [Check 1]
- [ ] [Check 2]
- [ ] [Check 3]

### Test Case 3: [Error Handling]

**Setup:**
[Describe how to set up error condition]

**User Request:**

```text
"[Question that should trigger error handling]"
```

**Expected Behavior:**

1. Skill should handle error gracefully
2. Should provide clear error message
3. Should suggest resolution

**Validation:**

- [ ] No crash/exception
- [ ] Clear error message
- [ ] Helpful guidance provided

## Troubleshooting

### Skill Doesn't Activate

**Symptoms:**

- Claude doesn't use the skill when expected
- Claude says "I don't have access to that information"

**Checks:**

1. **Verify installation:**

   ```bash
   ls ~/.claude/skills/{skill-name}/SKILL.md
   ```

2. **Check SKILL.md format:**

   ```bash
   head -10 ~/.claude/skills/{skill-name}/SKILL.md
   ```

   Should show:

   ```yaml
   ---
   name: your-skill-name
   description: [Your description]
   ---
   ```

3. **Verify description is clear:**
   - Description should mention trigger words
   - Description should be specific about use cases
   - Consider making it more detailed

4. **Try being explicit:**
   Instead of: "[vague question]"
   Try: "Use the {skill-name} skill to [specific task]"

5. **Restart Claude Code:**
   - Skills are loaded on startup
   - Restart may be needed after installation

### Command Execution Fails

**Symptoms:**

- Error: `command not found`
- Script fails to execute

**Checks:**

1. **Verify tool installation:**

   ```bash
   # Check if required tool is available
   which python
   which jq
   # etc.
   ```

2. **Test manually:**

   ```bash
   cd ~/.claude/skills/{skill-name}
   # Run command manually to test
   ```

3. **Check permissions:**

   ```bash
   # Make scripts executable if needed
   chmod +x scripts/*.py
   ```

## Testing Checklist

### Pre-Test Setup

- [ ] Skill installed in correct directory
- [ ] Required dependencies installed
- [ ] SKILL.md has valid frontmatter
- [ ] Scripts are executable (if applicable)

### Core Functionality

- [ ] Test Case 1: Basic functionality ✓
- [ ] Test Case 2: Advanced functionality ✓
- [ ] Test Case 3: Error handling ✓

### Documentation Quality

- [ ] SKILL.md description triggers skill correctly
- [ ] Instructions are clear and accurate
- [ ] Examples work as documented

## Test Results Template

```markdown
# Skill Test Results

**Date:** YYYY-MM-DD
**Platform:** Windows/macOS/Linux
**Claude Code Version:** X.X.X
**Tester:** [Name]

## Environment
- OS: [OS details]
- Shell: [bash/zsh/etc]
- Dependencies: [list versions]

## Test Results

| Test Case | Status | Notes |
|-----------|--------|-------|
| 1. Basic functionality | ✓ PASS | |
| 2. Advanced functionality | ✓ PASS | |
| 3. Error handling | ✓ PASS | |

## Issues Found
[List any issues]

## Recommendations
[Suggestions for improvements]

## Overall Assessment
☐ Ready for release
☐ Needs minor fixes
☐ Needs major revision
```

## Best Practices

### 1. Test Incrementally

- Test after each change
- Don't build everything before testing
- Catch issues early

### 2. Use Real Scenarios

- Test with actual use cases
- Get feedback from real users
- Don't use artificial examples

### 3. Cross-Platform Testing

- Test on Windows, macOS, and Linux if applicable
- Verify path handling on each platform
- Document platform-specific issues

### 4. Version Testing

- Test each version before release
- Keep test results for each version
- Track regression issues

## Resources

- [Claude Code Skills Documentation](https://docs.claude.com/en/docs/claude-code/skills)
- [Skill Authoring Best Practices](https://docs.claude.com/en/docs/agents-and-tools/agent-skills/best-practices)
