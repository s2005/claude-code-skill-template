# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a template repository for creating custom Claude Code skills. It provides a structured framework for building skills that extend Claude Code's capabilities with specialized knowledge, workflows, or tool integrations.

## Core Architecture

### Skill Structure

Claude Code skills follow a progressive disclosure pattern with three resource types:

1. **SKILL.md** (Required) - Main skill configuration with YAML frontmatter
   - Contains `name` and `description` fields that determine when Claude activates the skill
   - Uses imperative/infinitive form (verb-first instructions) throughout
   - Kept lean (<5k words), detailed info moved to references/

2. **scripts/** - Executable code for deterministic, reusable operations
   - Used when the same code is repeatedly rewritten
   - Can be executed without loading into context

3. **references/** - Documentation loaded into context as needed
   - For schemas, API docs, domain knowledge, policies
   - Keeps SKILL.md focused while providing detailed information

4. **assets/** - Files used in output (NOT loaded into context)
   - Templates, images, boilerplate, fonts
   - Copied/modified in the final output

### GitHub Actions Workflow

The repository includes `.github/workflows/release-skill.yml` which automatically:

- Extracts version from VERSION file
- Validates SKILL.md structure (frontmatter with name/description)
- **Validates skill name format** (lowercase, numbers, hyphens only)
- Builds skill distribution ZIP
- Attaches to GitHub releases

The workflow will fail fast if the skill name doesn't meet claude.ai requirements, preventing deployment of invalid skills.

## Development Commands

### Validating Skill Name

Before committing or deploying, validate your skill name:

```bash
./scripts/validate-skill-name.sh
```

This script checks that your skill name follows claude.ai requirements (lowercase, numbers, hyphens only). It uses the same validation logic as the GitHub Actions workflow.

### Testing the Skill Locally

Install skill to Claude Code skills directory:

```bash
# Windows (Git Bash)
cp -r . "$USERPROFILE/.claude/skills/your-skill-name"

# Unix/Mac
cp -r . ~/.claude/skills/your-skill-name
```

Test activation by asking Claude questions that match the skill description.

### Markdown Linting

The repository uses markdownlint-cli2 with line length checks disabled:

```bash
# Configuration in .markdownlint-cli2.jsonc
# MD013 (line length) is disabled to prevent linter warnings on long lines
```

### Git Configuration

For new repositories, configure git user locally:

```bash
git config --local user.name "your-username"
git config --local user.email "your-email@users.noreply.github.com"
```

### Release Process

1. Update VERSION file with new version (e.g., `1.0.0`)
2. Commit and push: `git commit -m "Release v1.0.0" && git push`
3. Create release: `gh release create v1.0.0 --generate-notes`
4. GitHub Actions automatically builds and attaches skill ZIP

See `docs/tasks/release/how-to-release.md` for detailed instructions.

## Important Files

- **SKILL.md** - Main skill file with YAML frontmatter (name, description)
- **VERSION** - Single version number for releases (e.g., `0.0.1`)
- **README.md** - User-facing documentation and installation instructions
- **SETUP.md** - Step-by-step setup guide for customizing the template
- **CLEANUP.md** - Guide for removing template files and placeholders after customization
- **.markdownlint-cli2.jsonc** - Markdown linter config (MD013 disabled)
- **docs/tasks/release/how-to-release.md** - Release workflow documentation
- **docs/tasks/tests/how-to-test-skill.md** - Testing framework and test cases

## Skill Development Best Practices

### SKILL.md Name Field

The name field must follow Claude.ai's strict naming requirements:

**Required format:**

- Only lowercase letters (a-z), numbers (0-9), and hyphens (-)
- Must start with a letter or number
- Must end with a letter or number (not a hyphen)
- No underscores, spaces, uppercase letters, or special characters

**Validation:**

```bash
# Test locally before committing
./scripts/validate-skill-name.sh

# Automatically validated during GitHub Actions workflow
```

**Valid examples:**

- `docker-helper` ✓
- `pdf-processor` ✓
- `cli-helper` ✓
- `skill123` ✓

**Invalid examples:**

- `Docker-Helper` ✗ (uppercase)
- `docker_helper` ✗ (underscore)
- `docker-helper-` ✗ (ends with hyphen)
- `docker helper` ✗ (space)

### SKILL.md Description Field

The description field determines when Claude activates the skill. Make it:

- Specific about trigger words users might say
- Clear about scenarios when to use the skill
- Include file types, actions, or topics relevant to the skill
- Use third-person form: "This skill should be used when..."

Example:

```yaml
---
name: docker-helper
description: This skill should be used when the user asks about Docker containers, needs to run docker commands, or wants to manage Docker images and containers. Use when queries mention docker, containerization, or container management.
---
```

### Writing Style

- Use imperative/infinitive form (verb-first instructions) throughout SKILL.md
  - Good: "Run the script to process files"
  - Bad: "You should run the script" or "You can run the script"
- Keep SKILL.md focused and concise (<5k words)
- Move detailed documentation to `references/` files
- Provide real examples, not hypothetical ones

### Markdown File Size Constraints

**CRITICAL**: Each markdown file packaged in a skill must adhere to strict size limits:

- **Preferred**: Keep each `.md` file under 500 lines
- **Maximum**: More than 1000 lines is NOT ALLOWED (critical constraint)

This applies to all markdown files in the skill:

- SKILL.md
- files in `references/` directory
- documentation files in `docs/`

If content exceeds these limits:

- Split into multiple smaller files
- Move detailed content to separate reference files
- Use clear cross-references between files
- Consider using scripts for large data/schemas

### Bundled Resources Guidelines

#### When to include scripts/

- Code is repeatedly rewritten by Claude
- Deterministic behavior is critical
- Complex logic that shouldn't be regenerated

#### When to include references/

- Detailed schemas, API docs, policies
- Domain-specific knowledge
- Information that informs Claude's process
- For files >10k words, include grep patterns in SKILL.md

#### When to include assets/

- Templates, images, boilerplate
- Files that will be copied/modified in output
- NOT loaded into context, used in final deliverables

### Testing Approach

Follow the framework in `docs/tasks/tests/how-to-test-skill.md`:

1. Install skill locally
2. Test activation with various phrasings
3. Verify core functionality
4. Test error handling
5. Validate documentation accuracy

Create specific test cases for each skill feature with expected inputs/outputs.

## Common Workflows

### Creating a New Skill from Template

1. Update SKILL.md frontmatter (name and description)
2. Customize SKILL.md content (purpose, usage, prerequisites)
3. Add implementation (scripts, references, or assets)
4. Update README.md with skill-specific information
5. Update VERSION file (start with `0.0.1`)
6. Test locally by installing to Claude skills directory
7. Initialize git and push to GitHub
8. Create release when ready

See `SETUP.md` for complete step-by-step instructions.

### Cleaning Up Template Files

After customizing your skill, remove template-specific files and placeholders:

**Manual approach:**

1. Follow the 8-phase cleanup checklist in `CLEANUP.md`
2. Remove example files (scripts/example_script.py, references/example_reference.md, etc.)
3. Delete unused directories (scripts/, references/, assets/, examples/ if empty)
4. Replace all placeholders in SKILL.md, README.md, and other files
5. Update repository URLs from template to your repository
6. Run verification commands to check for remaining placeholders
7. Test the skill locally before committing

**With Claude Code:**

Ask: "Help me clean up this template repository using CLEANUP.md"

**Automated script:**

```bash
# Run the cleanup script from CLEANUP.md
chmod +x cleanup-template.sh
./cleanup-template.sh
# Then manually update core files as prompted
```

**Files to remove after cleanup:**

- SETUP.md (after initial setup)
- CLEANUP.md (after cleanup is complete)
- Example files: scripts/example_script.py, references/example_reference.md, assets/example_asset.txt
- Empty directories that you don't need

See `CLEANUP.md` for complete instructions with verification commands.

### Validation Before Release

Required checks:

- SKILL.md has valid YAML frontmatter with `name` and `description`
- VERSION file exists with semantic version number
- README.md is customized (no template placeholders)
- Skill installs correctly to `~/.claude/skills/`
- Claude activates skill when expected
- All documented commands/scripts work
- Documentation matches actual behavior

## Troubleshooting

### Skill Doesn't Activate

1. Verify SKILL.md has valid YAML frontmatter: `head -10 SKILL.md`
2. Check description is specific with trigger words
3. Try explicit request: "Use the [skill-name] skill to..."
4. Restart Claude Code (skills loaded on startup)

### GitHub Actions Release Fails

Common issues:

- VERSION file missing or empty
- SKILL.md missing YAML frontmatter
- Invalid frontmatter (missing `name` or `description`)

Check workflow logs: `gh run view --log`

### Scripts Don't Execute

1. Verify scripts are executable: `chmod +x scripts/*.py`
2. Check required tools installed: `which python`, `which jq`, etc.
3. Test script manually: `python scripts/example_script.py`

## Documentation Structure

```text
docs/
├── guides/              # Additional documentation (optional)
│   └── README.md
└── tasks/
    ├── release/
    │   └── how-to-release.md    # Release workflow
    └── tests/
        └── how-to-test-skill.md # Testing framework
```

## Version Numbering

Follow semantic versioning (MAJOR.MINOR.PATCH):

- `0.0.1` - Initial development
- `0.1.0` - First feature complete
- `1.0.0` - First stable release
- `1.1.0` - New feature (backward compatible)
- `1.1.1` - Bug fix
- `2.0.0` - Breaking change

## References

- [Claude Code Skills Documentation](https://docs.claude.com/en/docs/claude-code/skills)
- [Skill Authoring Best Practices](https://docs.claude.com/en/docs/agents-and-tools/agent-skills/best-practices)
- [skill-creator Skill](https://github.com/anthropics/example-skills) - Official skill creation tool
