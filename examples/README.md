# Examples

This directory contains example files and usage scenarios for your skill.

## Purpose

Examples help users understand how to use your skill effectively. Include:

- Sample input files
- Sample configuration files
- Example workflows
- Expected outputs

## Structure

Organize examples by use case:

```text
examples/
├── README.md           # This file
├── basic/              # Basic usage examples
│   ├── input.txt
│   └── expected-output.txt
├── advanced/           # Advanced usage examples
│   ├── config.json
│   └── workflow.md
└── error-cases/        # Error handling examples
    └── invalid-input.txt
```

## Usage

Reference these examples in your SKILL.md:

```markdown
## Examples

See `examples/` directory for sample files:

**Basic Usage:**
```bash
# Run with basic example
python scripts/your_script.py --input examples/basic/input.txt
```

**Advanced Usage:**

```bash
# Run with advanced config
python scripts/your_script.py --config examples/advanced/config.json
```

## Best Practices

1. **Keep examples simple** - Focus on one concept per example
2. **Provide expected output** - Show what users should expect
3. **Explain edge cases** - Include examples of error scenarios
4. **Keep files small** - Use minimal data to demonstrate concepts
5. **Document clearly** - Add comments or README files

## Adding Examples

When adding new examples:

1. Create appropriately named files
2. Add clear comments/documentation
3. Reference in SKILL.md
4. Test to ensure they work
5. Update this README

## Tips

- Use realistic data (but sanitize sensitive information)
- Include both success and failure cases
- Show common patterns users might encounter
- Provide copy-paste-ready commands
