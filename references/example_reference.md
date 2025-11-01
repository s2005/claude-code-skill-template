# Example Reference Documentation

This is an example reference file that demonstrates how to structure documentation for loading into context.

## Purpose

Reference files are documentation intended to be loaded into context as needed to inform Claude's process and thinking. They keep SKILL.md lean while providing detailed information when required.

## When to Use Reference Files

Use reference files for:

- Database schemas and table relationships
- API documentation and specifications
- Domain-specific knowledge
- Company policies and procedures
- Detailed workflow guides
- Complex configuration examples

## Example Content

### Database Schema

**users table:**

- id (PRIMARY KEY)
- username (VARCHAR)
- email (VARCHAR)
- created_at (TIMESTAMP)

**posts table:**

- id (PRIMARY KEY)
- user_id (FOREIGN KEY -> users.id)
- title (VARCHAR)
- content (TEXT)
- created_at (TIMESTAMP)

### API Endpoints

#### GET /api/users

- Returns list of all users
- Response: `{ "users": [...] }`

#### POST /api/users

- Creates a new user
- Body: `{ "username": "...", "email": "..." }`

## Best Practices

- Keep information organized and scannable
- Use clear headings and structure
- Include grep-friendly keywords
- For files >10k words, mention search patterns in SKILL.md
- Avoid duplicating content from SKILL.md
