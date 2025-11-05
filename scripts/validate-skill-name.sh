#!/bin/bash
# Validates that the skill name in SKILL.md meets Claude.ai requirements
# Usage: ./scripts/validate-skill-name.sh

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "🔍 Validating skill name..."
echo ""

# Check if SKILL.md exists
if [ ! -f "SKILL.md" ]; then
    echo -e "${RED}❌ ERROR: SKILL.md not found${NC}"
    echo "Please run this script from the repository root directory"
    exit 1
fi

# Extract skill name from SKILL.md
SKILL_NAME=$(grep "^name:" SKILL.md | head -1 | sed 's/^name:[[:space:]]*//')

if [ -z "$SKILL_NAME" ]; then
    echo -e "${RED}❌ ERROR: No 'name:' field found in SKILL.md frontmatter${NC}"
    exit 1
fi

echo "Skill name: '$SKILL_NAME'"
echo ""

# Validate format: lowercase letters, numbers, and hyphens only
# Must start and end with alphanumeric character (not hyphen)
# Single character names are allowed (e.g., "x", "1")
if ! echo "$SKILL_NAME" | grep -qE '^[a-z0-9]([a-z0-9-]*[a-z0-9])?$'; then
    echo -e "${RED}❌ INVALID: Skill name does not meet format requirements${NC}"
    echo ""
    echo "Skill names must:"
    echo "  - Contain only lowercase letters (a-z), numbers (0-9), and hyphens (-)"
    echo "  - Start with a lowercase letter or number"
    echo "  - End with a lowercase letter or number (not a hyphen)"
    echo "  - Not contain consecutive hyphens, underscores, or spaces"
    echo ""
    echo "Valid examples:"
    echo -e "  ${GREEN}✓${NC} my-skill"
    echo -e "  ${GREEN}✓${NC} pdf-helper"
    echo -e "  ${GREEN}✓${NC} cli-helper"
    echo -e "  ${GREEN}✓${NC} docker2k8s"
    echo -e "  ${GREEN}✓${NC} skill123"
    echo ""
    echo "Invalid examples:"
    echo -e "  ${RED}✗${NC} My-Skill (uppercase)"
    echo -e "  ${RED}✗${NC} my_skill (underscore)"
    echo -e "  ${RED}✗${NC} my-skill- (ends with hyphen)"
    echo -e "  ${RED}✗${NC} -my-skill (starts with hyphen)"
    echo -e "  ${RED}✗${NC} my skill (space)"
    echo ""
    echo -e "${YELLOW}Fix:${NC} Update the 'name:' field in SKILL.md frontmatter"
    echo ""
    exit 1
fi

echo -e "${GREEN}✓ Valid: Skill name meets all requirements${NC}"
echo ""
echo "Your skill name '$SKILL_NAME' is ready for deployment to claude.ai"
exit 0
