# Guides

This directory contains additional documentation and guides for your skill.

## Purpose

Guides provide detailed information beyond the basic SKILL.md file:

- Reference documentation
- Advanced usage guides
- Platform-specific instructions
- Troubleshooting guides

## Suggested Guides

### Platform-Specific Guides

If your skill has platform-specific behavior:

- `windows-guide.md` - Windows-specific commands and paths
- `unix-guide.md` - Unix/Mac-specific commands and paths
- `linux-guide.md` - Linux-specific instructions

### Reference Guides

- `api-reference.md` - API or command reference
- `configuration.md` - Configuration options
- `troubleshooting.md` - Common issues and solutions

### Usage Guides

- `getting-started.md` - Beginner's guide
- `advanced-usage.md` - Advanced techniques
- `best-practices.md` - Recommended approaches

## Referencing Guides

Link to guides from your SKILL.md:

```markdown
## Platform-Specific Instructions

For detailed platform-specific commands:
- Windows: See `docs/guides/windows-guide.md`
- Unix/Mac: See `docs/guides/unix-guide.md`

## Advanced Usage

See `docs/guides/advanced-usage.md` for:
- Advanced configuration
- Complex workflows
- Performance optimization
```

## Best Practices

1. **Keep guides focused** - One topic per guide
2. **Use clear headings** - Make content scannable
3. **Provide examples** - Show, don't just tell
4. **Keep updated** - Maintain as skill evolves
5. **Cross-link** - Reference related guides

## Adding Guides

When adding a new guide:

1. Create markdown file with clear name
2. Add table of contents for long guides
3. Include examples and code snippets
4. Reference from SKILL.md
5. Update this README
6. Test all commands/examples

## Guide Template

```markdown
# Guide Title

Brief description of what this guide covers.

## Prerequisites

- Requirement 1
- Requirement 2

## Section 1

Content with examples

## Section 2

More content

## Related Resources

- Link to related guide
- Link to external resource
```
