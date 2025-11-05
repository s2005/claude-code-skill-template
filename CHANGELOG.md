# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.0.7] - 2025-11-05

### Added

- Skill name validation system
  - New validation step in GitHub Actions workflow (`.github/workflows/release-skill.yml`)
  - Validates skill name format: lowercase letters, numbers, and hyphens only
  - Must start and end with alphanumeric character (not hyphen)
  - Provides clear error messages with valid/invalid examples
  - Fails fast before building if name is invalid
  - Local validation script (`scripts/validate-skill-name.sh`)
  - Test skill names before committing: `./scripts/validate-skill-name.sh`
  - Color-coded output for better readability

### Changed

- SKILL.md frontmatter now includes naming requirement comments
  - Shows valid and invalid naming examples
  - References validation script
- README.md
  - New "Skill Naming Requirements" section with detailed rules
  - Added validation instructions to "Customization Guide"
- SETUP.md
  - Emphasized naming rules as CRITICAL requirement
  - Added valid/invalid examples with visual indicators
  - Instructions to test names locally before committing
- CLAUDE.md
  - New "SKILL.md Name Field" section documenting naming requirements
  - Updated "GitHub Actions Workflow" section to mention validation
  - New "Validating Skill Name" section under "Development Commands"

### Fixed

- Prevents deployment of skills with invalid names to claude.ai
  - Previously, invalid names (uppercase, underscores, spaces) would only fail during claude.ai deployment
  - Now caught during GitHub Actions workflow before release
  - Can be tested locally before any commits
- MD036 linter error in SETUP.md (changed bold emphasis to proper heading)

## [0.0.6] - 2025-11-05

### Added in 0.0.6

- CLEANUP.md - Comprehensive cleanup guide for template users
  - 8-phase cleanup process with detailed checklists
  - Decision matrix for determining which directories to keep
  - Automated cleanup script option
  - Verification commands to find placeholders and template references
  - Guides users through customizing all core files
- CLEANUP.md documentation in CLAUDE.md
  - Added to "Important Files" section
  - New "Cleaning Up Template Files" section with manual, Claude Code, and automated approaches
  - List of files to remove after cleanup

### Fixed in 0.0.6

- MD032 errors in CLAUDE.md (blank lines around lists)
- MD031 errors in CLEANUP.md (blank lines around code fences)
- All markdown files now pass markdownlint-cli2 with 0 errors

## [0.0.5] - 2025-11-05

### Fixed in 0.0.5

- Nested archives issue in workflow_dispatch
  - Modified release workflow to prevent nested zip files
  - Split build step to only create directory structure (no zip)
  - Add conditional zip creation only for releases
  - Upload directory for workflow_dispatch (GitHub auto-zips once)
  - Upload zip file for releases (unchanged behavior)
  - Fixes nested zip archives that cannot be directly installed as Claude Code skills

## [0.0.4] - 2025-11-01

### Added in 0.0.4

- Markdown file size constraints in CLAUDE.md
  - Preferred: Keep each `.md` file under 500 lines
  - Maximum: More than 1000 lines is NOT ALLOWED (critical constraint)
  - Guidelines for splitting large files

## [0.0.3] - 2025-11-01

### Changed in 0.0.3

- Exclude internal docs from releases
  - Modified workflow to copy only `docs/guides/` instead of entire `docs/` directory
  - Keep `docs/tasks/` (internal release/testing documentation) out of skill packages

## [0.0.2] - 2025-11-01

### Changed in 0.0.2

- Enhanced release workflow
  - Include optional files in distribution (README.md, LICENSE, VERSION)
  - Add `references/` and `assets/` directories to build package

## [0.0.1] - 2025-11-01

### Added in 0.0.1

- Initial release of Claude Code Skill Template
- Template SKILL.md with YAML frontmatter
- Complete documentation structure
  - README.md with usage and customization guide
  - SETUP.md with step-by-step setup instructions
  - CLAUDE.md with project-specific instructions for Claude Code
- GitHub Actions automated release workflow
  - Extracts version from VERSION file
  - Validates SKILL.md structure
  - Builds skill distribution ZIP
  - Attaches to GitHub releases
- Testing framework and guides (`docs/tasks/tests/`)
- Release workflow documentation (`docs/tasks/release/`)
- Platform-specific path handling examples
- Example scripts and files
  - `scripts/example_script.py`
  - `references/example_reference.md`
  - `assets/example_asset.txt`
- Directory structure
  - `docs/guides/` for additional documentation
  - `scripts/` for executable code
  - `references/` for documentation loaded into context
  - `assets/` for files used in output
  - `examples/` for sample files
- Markdown linting configuration (`.markdownlint-cli2.jsonc`)
  - MD013 (line length) disabled
- VERSION file for semantic versioning support
- LICENSE file (MIT License)
- .gitignore with Python, IDE, and OS patterns

[Unreleased]: https://github.com/s2005/claude-code-skill-template/compare/v0.0.7...HEAD
[0.0.7]: https://github.com/s2005/claude-code-skill-template/compare/v0.0.6...v0.0.7
[0.0.6]: https://github.com/s2005/claude-code-skill-template/compare/v0.0.5...v0.0.6
[0.0.5]: https://github.com/s2005/claude-code-skill-template/compare/v0.0.4...v0.0.5
[0.0.4]: https://github.com/s2005/claude-code-skill-template/compare/v0.0.3...v0.0.4
[0.0.3]: https://github.com/s2005/claude-code-skill-template/compare/v0.0.2...v0.0.3
[0.0.2]: https://github.com/s2005/claude-code-skill-template/compare/v0.0.1...v0.0.2
[0.0.1]: https://github.com/s2005/claude-code-skill-template/releases/tag/v0.0.1
