# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the blog and photos site for Bruce E. Wilson, hosted at `usethedata.net`. The GitHub repository is `usethedata/personal-website`. The professional profile site is a separate repo (`usethedata/profile-site`) at `usethedata.me`. Both sites share a common theme via `usethedata/site-theme`.

## Local Development with Docker (Preferred)

```bash
# Start the Jekyll server in Docker with LiveReload
docker-compose up

# Rebuild container after Gemfile changes
docker-compose up --build

# Stop the container
docker-compose down

# Access the site at http://localhost:4001
```

## Local Development without Docker

```bash
bundle install
bundle exec jekyll serve --livereload
bundle exec jekyll build
bundle exec jekyll clean
```

## Branching and Deployment

**IMPORTANT:** Always work on the `dev` branch. If the repo is checked out to `main`, ask the user before making any file changes — working on `main` directly is an exception, not the norm.

GitHub Actions automatically builds and deploys the site:
- `main` branch → Production at https://usethedata.net
- `dev` branch → Development environment for testing GitHub rendering
- Feature branches → Local testing only (do not deploy)

Merge `dev` to `main` only when explicitly asked to deploy.

Deployment workflow: `.github/workflows/deploy.yml`

## Project Structure

- `_posts/` - Blog posts (named `YYYY-MM-DD-title.md`)
- `_layouts/` - HTML templates (`post.html` for blog posts)
- `assets/images/` - Photos and images
- `_config.yml` - Site configuration
- `CNAME` - Custom domain configuration for GitHub Pages
- `index.html` - Homepage with paginated post listing
- `_site/` - Generated static site (git-ignored)

## Shared Theme

This site uses `usethedata/site-theme` as a Jekyll remote theme, providing:
- Shared CSS (colors, typography, header, footer styles)
- Configurable header and footer navigation links
- Consistent visual identity with `usethedata.me`

Navigation links are configured in `_config.yml` via `header_links` and `footer_links`.

## Writing Posts

Create new posts in `_posts/` with the filename format `YYYY-MM-DD-title.md`:

```markdown
---
layout: post
title: "Post Title"
---

Post content here.
```

## Configuration Notes

- Jekyll 4.3 with `jekyll-remote-theme` for shared theming
- Plugins: `jekyll-feed`, `jekyll-seo-tag`, `jekyll-remote-theme`, `jekyll-paginate`
- Pagination: 10 posts per page
