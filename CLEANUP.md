# Repository Cleanup Guide

This guide helps you remove template-specific files and placeholders after creating your custom skill from this template. Follow this checklist to ensure your repository contains only relevant files for your specific skill.

## Quick Start

You can clean up your repository either:

1. **Manually** - Follow the checklist below
2. **With Claude Code** - Ask: "Help me clean up this template repository using CLEANUP.md"

## Cleanup Checklist

### Phase 1: Identify Your Skill Type

First, determine what resources your skill needs:

- [ ] **Scripts-based?** - Will you have Python/Bash scripts that Claude should execute?
- [ ] **Documentation-based?** - Will you provide reference documentation for Claude to read?
- [ ] **Asset-based?** - Will you provide templates/files for Claude to copy into output?
- [ ] **Examples needed?** - Will you provide example files showing usage?

### Phase 2: Remove Template Example Files

Delete example files you don't need:

```bash
# Remove example script if you don't need scripts/
# OR replace with your actual scripts
rm scripts/example_script.py

# Remove example reference if you don't need references/
# OR replace with your actual documentation
rm references/example_reference.md

# Remove example asset if you don't need assets/
# OR replace with your actual templates/assets
rm assets/example_asset.txt

# Remove examples directory if you won't provide examples
rm -rf examples/

# Remove empty guides directory if you don't need additional guides
rm -rf docs/guides/
```

**Decision Matrix:**

| Your Skill Type | Keep `scripts/` | Keep `references/` | Keep `assets/` | Keep `examples/` |
|-----------------|----------------|-------------------|---------------|-----------------|
| Tool wrapper (e.g., jq, docker) | No | Maybe | No | Maybe |
| Workflow guide (e.g., testing flow) | Maybe | Yes | No | Maybe |
| Documentation reference | No | Yes | No | No |
| File processor | Yes | Maybe | Yes | Yes |
| Code generator | No | No | Yes | Yes |

### Phase 3: Remove Template Documentation

Delete template-specific documentation files:

```bash
# Remove setup guide (only needed during initial setup)
rm SETUP.md

# Remove this cleanup guide after you're done
rm CLEANUP.md
```

### Phase 4: Customize Core Files

Replace all placeholders in these files:

#### 1. SKILL.md

- [ ] Update `name:` in frontmatter (lowercase-with-hyphens)
- [ ] Update `description:` with specific trigger words and scenarios
- [ ] Replace `[X]`, `[Y]`, `[Z]` placeholders with actual content
- [ ] Replace `Your Skill Name` header
- [ ] Fill in "Purpose" section with 2-3 sentences
- [ ] Update "When to Use This Skill" with specific scenarios
- [ ] List actual prerequisites (tools, libraries, setup)
- [ ] Update "Bundled Resources" section:
  - Remove sections for resources you don't have (scripts/references/assets)
  - Update descriptions for resources you do have
- [ ] Provide real "How to Use This Skill" instructions
- [ ] Update "Key Information" with your skill's specifics
- [ ] Add real troubleshooting scenarios (remove examples)
- [ ] Update "Best Practices" for your skill
- [ ] Remove or update "Examples" section with real examples

**Check for remaining placeholders:**

```bash
grep -n "\[X\]\|\[Y\]\|\[Z\]\|\[specific\]\|\[Description\]\|Example:" SKILL.md
```

#### 2. README.md

- [ ] Change title from "Claude Code Skill Template" to your skill name
- [ ] Remove "Prerequisites" section about skill-creator (lines 6-34)
- [ ] Update description under "Quick Start"
- [ ] Simplify "Quick Start" section - remove references to template usage
- [ ] Update installation paths with your actual skill name
- [ ] Update "Repository Structure" to match what you actually have
- [ ] Update "What's Included" to describe your actual skill
- [ ] Remove "Customization Guide" section (lines 241-346)
- [ ] Update "Release Process" to reference your repository
- [ ] Update "Examples of Skills" to describe your specific skill
- [ ] Update all repository URLs from `s2005/claude-code-skill-template` to your repo
- [ ] Remove "Acknowledgments" section referencing the template

**Check for remaining template references:**

```bash
grep -n "template\|placeholder\|s2005/claude-code-skill-template\|your-skill-name" README.md
```

#### 3. VERSION

```bash
# Set to 0.0.1 for initial development or 1.0.0 for first stable release
echo "0.0.1" > VERSION
```

#### 4. LICENSE

```bash
# Update the year and copyright holder name
# Line 3: Copyright (c) YYYY YOUR NAME
```

#### 5. CLAUDE.md

Update repository-specific references:

- [ ] Line 50: Change `s2005/claude-code-skill-template` to your repository URL
- [ ] Line 447-449: Update GitHub links to your repository
- [ ] Review the entire file to ensure it matches your repository structure

**Check for template references:**

```bash
grep -n "s2005/claude-code-skill-template" CLAUDE.md
```

### Phase 5: Update Documentation Files

#### 1. docs/tasks/release/how-to-release.md

```bash
# Open and replace all instances of:
# - {skill-name} with your actual skill name
# - Repository URLs with your repository
# - Any template-specific examples
```

**Use find and replace:**

```bash
# Preview what needs changing:
grep -n "{skill-name}\|your-skill-name\|s2005/claude-code-skill-template" docs/tasks/release/how-to-release.md
```

#### 2. docs/tasks/tests/how-to-test-skill.md

- [ ] Replace example test cases with real ones for your skill
- [ ] Update expected inputs/outputs
- [ ] Add skill-specific troubleshooting steps
- [ ] Remove generic placeholder examples

### Phase 6: Clean Up Empty Directories

Remove directories you're not using:

```bash
# Remove scripts directory if you have no scripts
# (Only if you deleted example_script.py and added nothing)
[ -z "$(ls -A scripts/)" ] && rm -rf scripts/

# Remove references directory if you have no references
[ -z "$(ls -A references/)" ] && rm -rf references/

# Remove assets directory if you have no assets
[ -z "$(ls -A assets/)" ] && rm -rf assets/

# Remove examples directory if you have no examples
[ -z "$(ls -A examples/)" ] && rm -rf examples/

# Remove docs/guides if empty
[ -z "$(ls -A docs/guides/)" ] && rm -rf docs/guides/
```

### Phase 7: Verify Structure

Ensure your skill structure is valid:

```bash
# Check SKILL.md has valid frontmatter
head -10 SKILL.md | grep -E "^name:|^description:"

# Check VERSION file exists and has content
test -f VERSION && cat VERSION

# Check no placeholder text remains
grep -r "\[X\]\|\[Y\]\|your-skill-name\|example_" --include="*.md" .

# Check README doesn't reference template
grep -i "template" README.md
```

### Phase 8: Test Your Skill

Before committing cleanup:

```bash
# Install locally
# Windows (Git Bash)
cp -r . "$USERPROFILE/.claude/skills/$(head -1 SKILL.md | grep -oP '(?<=name: ).*')"

# Unix/Mac
cp -r . ~/.claude/skills/$(grep '^name:' SKILL.md | head -1 | cut -d' ' -f2)

# Test with Claude Code
# Ask questions that should trigger your skill based on the description field
```

## Automated Cleanup Script

If you want to automate some cleanup:

```bash
#!/bin/bash
# cleanup-template.sh

echo "🧹 Cleaning up template files..."

# Remove example files
echo "Removing example files..."
rm -f scripts/example_script.py
rm -f references/example_reference.md
rm -f assets/example_asset.txt
rm -rf examples/

# Remove template documentation
echo "Removing template documentation..."
rm -f SETUP.md

# Remove empty directories
echo "Removing empty directories..."
find . -type d -empty -delete

echo "✅ Cleanup complete!"
echo ""
echo "⚠️  IMPORTANT: You still need to manually:"
echo "   1. Update SKILL.md (name, description, all content)"
echo "   2. Update README.md (title, descriptions, URLs)"
echo "   3. Update VERSION file (0.0.1 or 1.0.0)"
echo "   4. Update LICENSE (year and name)"
echo "   5. Update docs/tasks/ documentation"
echo "   6. Add your actual skill implementation"
echo "   7. Test the skill locally"
echo ""
echo "📝 Run this to check for remaining placeholders:"
echo "   grep -r '\[X\]\|\[Y\]\|your-skill-name\|example_\|template' --include='*.md' ."
```

**To use:**

```bash
chmod +x cleanup-template.sh
./cleanup-template.sh
```

## Verification Checklist

Before your first commit, verify:

### Files

- [ ] SKILL.md has valid YAML frontmatter with real `name` and `description`
- [ ] README.md has no "template" references
- [ ] VERSION file contains a version number (0.0.1 or 1.0.0)
- [ ] LICENSE has your name and current year
- [ ] All example_* files are removed
- [ ] SETUP.md is removed
- [ ] CLEANUP.md is removed (after following this guide)

### Content

- [ ] No placeholders remain: `[X]`, `[Y]`, `{skill-name}`, `your-skill-name`
- [ ] No "Example:" or "Replace this..." text in documentation
- [ ] All repository URLs point to your repository, not the template
- [ ] SKILL.md description matches when you want Claude to use the skill
- [ ] Documentation matches your actual implementation

### Structure

- [ ] Only keep directories you're actually using (scripts/, references/, assets/, examples/)
- [ ] All kept directories have real content, not examples
- [ ] docs/tasks/ documentation is updated for your skill
- [ ] .github/workflows/release-skill.yml is present (usually no changes needed)

### Functionality

- [ ] Skill installs to `~/.claude/skills/your-skill-name` without errors
- [ ] Claude activates your skill when you ask questions matching the description
- [ ] All commands/scripts documented in SKILL.md work correctly
- [ ] Test cases pass (see docs/tasks/tests/how-to-test-skill.md)

## Quick Verification Commands

Run these commands to check for common issues:

```bash
# Find remaining placeholders
echo "🔍 Checking for placeholders..."
grep -r "\[X\]\|\[Y\]\|\[Z\]\|your-skill-name\|example_\|{skill-name}" \
  --include="*.md" . | grep -v "node_modules\|.git"

# Find template references
echo "🔍 Checking for template references..."
grep -r "claude-code-skill-template\|this template" \
  --include="*.md" . | grep -v "node_modules\|.git\|CLEANUP.md"

# Check YAML frontmatter
echo "🔍 Checking SKILL.md frontmatter..."
head -5 SKILL.md

# Check version
echo "🔍 Checking VERSION..."
cat VERSION

# List all markdown files
echo "🔍 All markdown files in repo:"
find . -name "*.md" -not -path "*/node_modules/*" -not -path "*/.git/*" | sort
```

## What to Keep

**Always keep these files:**

- `.github/workflows/release-skill.yml` - Automated releases (auto-detects skill name)
- `.gitignore` - Standard ignore patterns
- `.markdownlint-cli2.jsonc` - Markdown linting configuration
- `SKILL.md` - **REQUIRED** - Main skill file
- `VERSION` - **REQUIRED** - Version tracking for releases
- `README.md` - User-facing documentation
- `LICENSE` - License file
- `CLAUDE.md` - Instructions for Claude Code working in your repository

**Conditionally keep these:**

- `scripts/` - Only if you have executable scripts
- `references/` - Only if you have reference documentation
- `assets/` - Only if you have templates/files for output
- `examples/` - Only if you provide example files
- `docs/guides/` - Only if you have additional guides
- `docs/tasks/release/` - Keep for release workflow documentation
- `docs/tasks/tests/` - Keep for testing documentation

## After Cleanup

Once cleanup is complete:

1. **Test locally:**
   ```bash
   cp -r . ~/.claude/skills/your-actual-skill-name
   # Test with Claude Code
   ```

2. **Commit changes:**
   ```bash
   git add .
   git commit -m "Clean up template files and customize for [your skill name]"
   ```

3. **Push to your repository:**
   ```bash
   git push origin main
   ```

4. **Remove CLEANUP.md:**
   ```bash
   git rm CLEANUP.md
   git commit -m "Remove cleanup guide"
   git push
   ```

## Getting Help

If you need help during cleanup:

- **With Claude Code:** "Help me clean up this template using CLEANUP.md"
- **Check for issues:** Run the verification commands above
- **Read documentation:** See CLAUDE.md for repository-specific guidance

## Next Steps

After cleanup:

1. Implement your skill functionality
2. Test thoroughly (see docs/tasks/tests/how-to-test-skill.md)
3. Create your first release (see docs/tasks/release/how-to-release.md)
4. Share your skill with others!
