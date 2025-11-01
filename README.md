# Claude Code Skill Template

A template repository for creating custom Claude Code skills with best practices, documentation structure, and automated release workflows.

## Quick Start

### 1. Use This Template

Click the "Use this template" button on GitHub to create a new repository from this template.

Or clone manually:
```bash
git clone https://github.com/s2005/skill-template.git your-skill-name
cd your-skill-name
```

### 2. Customize Your Skill

Replace placeholders in the following files:

#### SKILL.md (Required)
- [ ] Update `name:` in frontmatter
- [ ] Update `description:` in frontmatter (this is how Claude recognizes your skill!)
- [ ] Replace all placeholder text with your skill's content
- [ ] Remove sections you don't need
- [ ] Add sections specific to your skill

#### README.md (This File)
- [ ] Replace title with your skill name
- [ ] Update description and features
- [ ] Update installation instructions
- [ ] Update usage examples
- [ ] Update repository URLs

#### VERSION
- [ ] Set initial version (recommend `0.0.1` for development)

#### LICENSE
- [ ] Update year and author name
- [ ] Or choose a different license if preferred

### 3. Add Your Implementation

Depending on your skill type:

#### For Python-based skills:
```bash
# Add your Python scripts to scripts/
scripts/
  └── your_script.py
```

#### For documentation-based skills:
```bash
# Add guides to docs/guides/
docs/guides/
  └── your-guide.md
```

#### For tool-based skills:
```bash
# Add tool configurations or wrappers
# Update SKILL.md with tool usage
```

### 4. Update Documentation

#### docs/tasks/release/how-to-release.md
- [ ] Update skill name throughout
- [ ] Update repository URLs
- [ ] Adjust release steps if needed

#### docs/tasks/tests/how-to-test-skill.md
- [ ] Create test cases specific to your skill
- [ ] Update expected outputs
- [ ] Add skill-specific troubleshooting

### 5. Test Locally

```bash
# Copy skill to Claude Code skills directory
# Windows
cp -r . "$USERPROFILE/.claude/skills/your-skill-name"

# Unix/Mac
cp -r . ~/.claude/skills/your-skill-name

# Test with Claude Code
# Ask questions that should trigger your skill
```

See `docs/tasks/tests/how-to-test-skill.md` for comprehensive testing guide.

### 6. Initialize Git and Push

```bash
# Initialize git (if not using template)
git init
git branch -m main

# Configure git user
git config --local user.name "your-username"
git config --local user.email "your-email@users.noreply.github.com"

# Commit initial version
git add .
git commit -m "Initial commit: [Your Skill Name]"

# Create GitHub repository
gh repo create your-skill-name --public --source=. --description="Your skill description"

# Push to GitHub
git push -u origin main
```

## Repository Structure

```
skill-template/
├── .github/
│   └── workflows/
│       └── release-skill.yml    # Automated release workflow
├── docs/
│   ├── guides/                  # Additional documentation
│   └── tasks/
│       ├── release/
│       │   └── how-to-release.md    # Release instructions
│       └── tests/
│           └── how-to-test-skill.md # Testing guide
├── examples/                    # Example files/usage (optional)
├── scripts/                     # Python/shell scripts (optional)
├── .gitignore                   # Git ignore file
├── LICENSE                      # MIT License
├── README.md                    # This file
├── SKILL.md                     # Main skill file (REQUIRED)
└── VERSION                      # Version tracking
```

## What's Included

### Core Files

- **SKILL.md** - Main skill configuration with YAML frontmatter
  - Claude reads this to understand when to use your skill
  - Must have `name` and `description` in frontmatter
  - Contains instructions, examples, and workflows

- **VERSION** - Simple version tracking
  - Used by GitHub Actions for releases
  - Update when ready to release

- **.gitignore** - Standard ignores for Python, IDE, OS files

- **LICENSE** - MIT License (customize if needed)

### Documentation Templates

- **README.md** - This file, customize for your skill
- **docs/tasks/release/how-to-release.md** - Complete release guide
- **docs/tasks/tests/how-to-test-skill.md** - Testing framework
- **docs/guides/** - Additional guides (optional)

### Automation

- **.github/workflows/release-skill.yml** - GitHub Actions workflow
  - Automatically builds skill package on release
  - Creates zip file for distribution
  - Validates skill structure
  - Attaches to GitHub release

### Optional Directories

- **scripts/** - For Python/shell scripts
- **examples/** - For example files or usage scenarios
- **docs/guides/** - For additional documentation

## Customization Guide

### 1. Skill Name and Description

The `description` field in SKILL.md frontmatter is crucial:

```yaml
---
name: my-awesome-skill
description: This skill should be used when the user asks about [X], needs to [Y], or mentions [Z]. Use when queries involve [key terms].
---
```

**Tips:**
- Be specific about when to use the skill
- Include trigger words users might say
- Mention file types, actions, or topics
- Keep it concise but descriptive

### 2. Adding Scripts

If your skill uses Python scripts:

1. Add script to `scripts/` directory
2. Make it executable: `chmod +x scripts/your_script.py`
3. Add usage in SKILL.md
4. Test locally

Example:
```python
#!/usr/bin/env python3
"""
Your script description
"""

def main():
    # Your logic here
    pass

if __name__ == '__main__':
    main()
```

### 3. Platform-Specific Instructions

If your skill needs platform-specific commands (like plugin-manager):

1. Create `docs/guides/windows-guide.md`
2. Create `docs/guides/unix-guide.md`
3. Reference them in SKILL.md:
   ```markdown
   ## Platform-Specific Instructions
   - Windows: See `docs/guides/windows-guide.md`
   - Unix/Mac: See `docs/guides/unix-guide.md`
   ```

### 4. Updating GitHub Actions

Edit `.github/workflows/release-skill.yml`:

- Change `{skill-name}` placeholders to your skill name
- Update skill structure validation if needed
- Customize release notes template

## Release Process

When ready to release:

1. Update VERSION file (e.g., `1.0.0`)
2. Commit and push
3. Create GitHub release: `gh release create v1.0.0 --generate-notes`
4. GitHub Actions automatically builds and attaches skill zip

See `docs/tasks/release/how-to-release.md` for detailed instructions.

## Testing

Manual testing framework included in `docs/tasks/tests/how-to-test-skill.md`:

1. Install skill locally
2. Run test scenarios
3. Verify activation
4. Document results

## Best Practices

Based on Claude Code skill best practices:

### Skill Description
- Be specific about when to use the skill
- Include trigger words users might say
- Test that Claude activates the skill correctly

### Skill Content
- Keep SKILL.md focused and concise
- Use clear, actionable instructions
- Provide real examples, not hypothetical ones
- Break complex tasks into steps

### Testing
- Test incrementally after each change
- Use real user scenarios
- Verify skill activates when expected
- Test on multiple platforms if applicable

### Documentation
- Keep README clear and practical
- Provide complete setup instructions
- Document common errors and solutions
- Include troubleshooting guide

### Version Control
- Use semantic versioning (MAJOR.MINOR.PATCH)
- Start with 0.0.1 for initial development
- Release 1.0.0 when stable
- Document changes in releases

## Examples of Skills

Different types of skills you can create:

### 1. Tool Wrapper Skill
Helps Claude use a specific CLI tool (e.g., jq, docker, kubectl)

### 2. Workflow Skill
Guides Claude through multi-step processes (e.g., testing, deployment)

### 3. Documentation Skill
Provides reference information (e.g., API docs, coding standards)

### 4. File Processing Skill
Handles specific file formats (e.g., CSV processing, markdown linting)

### 5. Integration Skill
Connects to external services (within Claude Code's constraints)

## Troubleshooting

### Skill Doesn't Activate

1. Check SKILL.md has valid YAML frontmatter
2. Ensure description field is clear and specific
3. Verify skill is in correct directory
4. Try being more explicit: "Use [skill-name] to..."
5. Restart Claude Code

### Scripts Don't Execute

1. Check Python/tool is installed
2. Verify script has correct permissions
3. Test script manually first
4. Check file paths (use forward slashes)

### Release Workflow Fails

1. Check VERSION file exists
2. Verify SKILL.md structure
3. Check GitHub Actions logs
4. Ensure all required files present

## Resources

- [Claude Code Skills Documentation](https://docs.claude.com/en/docs/claude-code/skills)
- [How to Create Custom Skills](https://support.claude.com/en/articles/12512198-how-to-create-custom-skills)
- [Skill Authoring Best Practices](https://docs.claude.com/en/docs/agents-and-tools/agent-skills/best-practices)
- [Example Skills Repository](https://github.com/anthropics/skills)

## Contributing

If you have improvements to this template:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

MIT License - See LICENSE file

## Support

For issues with this template:
- [GitHub Issues](https://github.com/s2005/skill-template/issues)
- [GitHub Discussions](https://github.com/s2005/skill-template/discussions)

## Acknowledgments

This template is based on best practices from:
- Claude Code official documentation
- Community skill examples
- Real-world skill development experience
