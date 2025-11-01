# Setup Guide

Step-by-step instructions for setting up your skill from this template.

## Prerequisites: Recommended Approach

**IMPORTANT:** Before using this manual template approach, we strongly recommend using Anthropic's official **skill-creator** skill, which automates much of this process.

### Option A: Use Anthropic's skill-creator (Recommended)

The skill-creator skill provides a guided, automated approach:

1. **Ensure you have the example-skills plugin installed** (official Anthropic plugin)
2. **Invoke the skill-creator:**

   ```text
   Ask Claude: "Help me create a new skill using the skill-creator"
   ```

3. **Follow the guided process:**
   - Answer questions about your skill's concrete use cases
   - Let skill-creator analyze and plan reusable contents
   - Use `init_skill.py` script to generate the skill structure
   - Implement your skill with guided assistance
   - Validate and package with `package_skill.py`

**Benefits of using skill-creator:**

- Automatic skill directory generation with proper structure
- Built-in validation to catch common mistakes
- Guided process ensures you don't miss important steps
- Automated packaging for distribution
- Follows Anthropic's latest best practices

### Option B: Manual Template Approach (This Guide)

If you prefer manual setup or need more control, continue with the steps below. This approach is useful when:

- You want to understand the underlying structure
- You need custom GitHub Actions workflows
- You're creating a skill with special requirements
- skill-creator is not available

---

## Step 1: Create Your Repository

### Option A: Use GitHub Template

1. Go to <https://github.com/s2005/claude-code-skill-template>
2. Click "Use this template" button
3. Choose "Create a new repository"
4. Enter your repository name (e.g., `my-awesome-skill`)
5. Choose public or private
6. Click "Create repository"
7. Clone your new repository:

   ```bash
   git clone https://github.com/your-username/my-awesome-skill.git
   cd my-awesome-skill
   ```

### Option B: Clone and Rename

```bash
# Clone the template
git clone https://github.com/s2005/claude-code-skill-template.git my-awesome-skill
cd my-awesome-skill

# Remove old git history
rm -rf .git

# Initialize new repository
git init
git branch -m main
```

## Step 2: Customize Core Files

### 2.1 Update SKILL.md

Open `SKILL.md` and customize:

```yaml
---
name: my-awesome-skill  # ← Change this to your skill name (lowercase, hyphenated)
description: This skill helps with [X] when user asks about [Y]  # ← Make this VERY specific!
---
```

**Important:** The `description` field is how Claude decides to use your skill!

- Be specific about when to activate
- Include trigger words users might say
- Mention relevant file types, actions, or topics

**Example descriptions:**

```yaml
# Good - Specific and clear
description: This skill should be used when the user asks about Docker containers, needs to run docker commands, or wants to manage Docker images and containers. Use when queries mention docker, containerization, or container management.

# Bad - Too vague
description: Helps with Docker stuff.
```

Then fill in the rest of SKILL.md:

- [ ] Purpose section
- [ ] When to Use section (list scenarios)
- [ ] Prerequisites (tools, setup needed)
- [ ] How to Use (examples and commands)
- [ ] Common workflows
- [ ] Error handling
- [ ] Remove sections you don't need
- [ ] Add skill-specific sections

### 2.2 Update README.md

Replace placeholders in README.md:

- [ ] Title: Change to your skill name
- [ ] Description: Explain what your skill does
- [ ] Features: List key capabilities
- [ ] Installation: Update skill name in paths
- [ ] Usage: Add real examples
- [ ] Repository URLs: Update all GitHub links

### 2.3 Update VERSION

```bash
# Set initial version
echo "0.0.1" > VERSION
```

Start with `0.0.1` for development. Use `1.0.0` when ready for first release.

### 2.4 Update LICENSE

```bash
# Edit LICENSE file
# Change [Your Name] to your name
# Or choose a different license if preferred
```

## Step 3: Add Your Implementation

Choose based on your skill type:

### For Script-Based Skills

Add your scripts to `scripts/` directory:

```bash
# Example: Python script
cat > scripts/my_script.py << 'EOF'
#!/usr/bin/env python3
"""
Description of what this script does
"""

def main():
    # Your implementation
    print("Hello from my skill!")

if __name__ == '__main__':
    main()
EOF

# Make executable
chmod +x scripts/my_script.py
```

Then reference in SKILL.md:

```markdown
## How to Use

Run the skill script:
```bash
python scripts/my_script.py --option value
```

### For Documentation Skills

Add guides to `docs/guides/` directory:

```bash
# Example: Create a reference guide
cat > docs/guides/reference.md << 'EOF'
# Reference Guide

## Topic 1
Information about topic 1

## Topic 2
Information about topic 2
EOF
```

Then reference in SKILL.md:

```markdown
## Reference Documentation

See `docs/guides/reference.md` for detailed information.
```

### For Tool Wrapper Skills

Add tool instructions to SKILL.md:

```markdown
## Using [Tool Name]

### Basic Commands

```bash
tool command --option value
```

### Common Patterns

**Pattern 1:**

```bash
tool pattern1 --flag
```

**Pattern 2:**

```bash
tool pattern2 --other-flag
```

## Step 4: Add Examples (Optional)

Add example files to `examples/` directory:

```bash
# Example: Sample input file
cat > examples/sample-input.txt << 'EOF'
Example input data
EOF

# Example: Sample config
cat > examples/sample-config.json << 'EOF'
{
  "setting1": "value1",
  "setting2": "value2"
}
EOF
```

Reference in SKILL.md:

```markdown
## Examples

See `examples/` directory for sample files:
- `sample-input.txt` - Example input
- `sample-config.json` - Example configuration
```

## Step 5: Update Documentation

### 5.1 Update Release Guide

Edit `docs/tasks/release/how-to-release.md`:

- [ ] Replace `{skill-name}` with your skill name
- [ ] Update repository URLs
- [ ] Adjust if you have custom release steps

### 5.2 Update Testing Guide

Edit `docs/tasks/tests/how-to-test-skill.md`:

- [ ] Create test cases specific to your skill
- [ ] Add expected inputs/outputs
- [ ] Document setup requirements
- [ ] Add troubleshooting for your skill

## Step 6: Update GitHub Actions

Edit `.github/workflows/release-skill.yml`:

The workflow auto-detects your skill name from SKILL.md, so usually no changes needed!

**Optional customizations:**

- Add build steps if you need compilation
- Add test steps if you have automated tests
- Customize release notes template

## Step 7: Test Locally

### 7.1 Install Skill Locally

```bash
# Windows (Git Bash)
cp -r . "$USERPROFILE/.claude/skills/my-awesome-skill"

# Unix/Mac
cp -r . ~/.claude/skills/my-awesome-skill
```

### 7.2 Test Activation

Start Claude Code and ask questions that should trigger your skill:

```text
"[Ask a question that matches your skill description]"
```

**Expected:** Claude should recognize and use your skill.

**If skill doesn't activate:**

1. Check SKILL.md has valid YAML frontmatter (run: `head -10 SKILL.md`)
2. Make description more specific
3. Try being explicit: "Use the [skill-name] skill to..."
4. Restart Claude Code

### 7.3 Test Functionality

Run through your test cases from `docs/tasks/tests/how-to-test-skill.md`:

- [ ] Basic functionality works
- [ ] Advanced features work
- [ ] Error handling works
- [ ] Documentation is accurate

## Step 8: Initialize Git

```bash
# Configure git user (if not global)
git config --local user.name "your-username"
git config --local user.email "your-email@users.noreply.github.com"

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: [Your Skill Name]

- Created from claude-code-skill-template
- [List main features]
"
```

## Step 9: Push to GitHub

### If you used GitHub template

```bash
# Already has remote configured
git push origin main
```

### If you cloned manually

```bash
# Create repository on GitHub
gh repo create my-awesome-skill \
  --public \
  --source=. \
  --description="Brief description of your skill"

# Push
git push -u origin main
```

## Step 10: Create First Release (Optional)

When ready for first release:

```bash
# Update version to 1.0.0
echo "1.0.0" > VERSION
git add VERSION
git commit -m "Release v1.0.0"
git push

# Create release
gh release create v1.0.0 \
  --title "v1.0.0 - First Release" \
  --generate-notes
```

GitHub Actions will automatically build and attach the skill ZIP file.

## Verification Checklist

Before considering your skill complete:

### Files

- [ ] SKILL.md has valid frontmatter with `name` and `description`
- [ ] README.md is customized (no template placeholders)
- [ ] VERSION file exists
- [ ] LICENSE updated with your name
- [ ] .gitignore is appropriate

### Functionality

- [ ] Skill installs correctly
- [ ] Claude activates skill when expected
- [ ] Commands/scripts work as documented
- [ ] Error handling works
- [ ] Examples are accurate

### Documentation

- [ ] README explains what skill does
- [ ] SKILL.md has clear instructions
- [ ] Test cases documented
- [ ] Release process documented
- [ ] No broken links

### Testing

- [ ] Tested on target platform(s)
- [ ] All test cases pass
- [ ] Error scenarios handled
- [ ] Documentation matches behavior

### Repository

- [ ] Git initialized
- [ ] Pushed to GitHub
- [ ] GitHub Actions workflow works
- [ ] README has correct repository URLs

## Next Steps

After setup is complete:

1. **Share with others** - Let people know about your skill
2. **Gather feedback** - Ask users to test and provide input
3. **Iterate** - Improve based on real usage
4. **Release** - Create official releases as you add features

## Getting Help

- Read [Claude Skills Documentation](https://docs.claude.com/en/docs/claude-code/skills)
- Check [Skill Best Practices](https://docs.claude.com/en/docs/agents-and-tools/agent-skills/best-practices)
- Ask in [GitHub Discussions](https://github.com/s2005/claude-code-skill-template/discussions)
- Open [GitHub Issue](https://github.com/s2005/claude-code-skill-template/issues)

## Common Issues

### "Skill doesn't activate"

- Make description in SKILL.md more specific
- Include trigger words users would say
- Test with explicit request: "Use [skill-name] to..."

### "Scripts don't execute"

- Check scripts are executable: `chmod +x scripts/*.py`
- Verify required tools installed
- Test scripts manually first

### "GitHub Actions fails"

- Check VERSION file exists
- Verify SKILL.md frontmatter is valid
- Review workflow logs: `gh run view --log`

Good luck with your skill! 🚀
