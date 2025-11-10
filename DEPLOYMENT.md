# Deployment Guide - Publishing to GitHub Pages

This guide explains how to publish your SBC FHIR Implementation Guide to GitHub Pages.

## Prerequisites

- GitHub account
- Git installed locally
- Repository must be public (for free GitHub Pages)

## Quick Start - First Time Setup

### 1. Initialize Git Repository (if not already done)

```bash
git init
git add .
git commit -m "Initial commit: SBC FHIR IG"
```

### 2. Create GitHub Repository

1. Go to https://github.com/new
2. Create a **public** repository named `fhir-sbc` (or your preferred name)
3. **Do NOT** initialize with README, .gitignore, or license (we already have these)

### 3. Push to GitHub

```bash
# Replace [your-username] with your GitHub username
git remote add origin https://github.com/[your-username]/fhir-sbc.git
git branch -M main
git push -u origin main
```

### 4. Configure GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** → **Pages** (in left sidebar)
3. Under "Build and deployment":
   - **Source**: Deploy from a branch
   - **Branch**: `gh-pages`
   - **Folder**: `/ (root)`
4. Click **Save**

**Note**: The `gh-pages` branch will be automatically created by the GitHub Actions workflow on the first build.

### 5. Wait for Build

1. Go to the **Actions** tab in your repository
2. You'll see the "Build and Publish FHIR IG" workflow running
3. Wait for it to complete (usually 3-5 minutes)
4. Once complete, go back to Settings → Pages to see your URL

### 6. Access Your Published IG

Your IG will be available at:
```
https://[your-username].github.io/fhir-sbc/
```

## How It Works

### GitHub Actions Workflow

The `.github/workflows/publish.yml` file automates the entire build and deployment process:

1. **Triggers** on:
   - Every push to `main` branch
   - Every pull request to `main` branch
   - Manual trigger via "Run workflow" button

2. **Build Steps**:
   - Install SUSHI (FSH compiler)
   - Install Java (for IG Publisher)
   - Install Jekyll (for HTML generation)
   - Run SUSHI to compile FSH → FHIR
   - Run IG Publisher to generate HTML
   - Upload build artifacts

3. **Deployment** (only on main branch):
   - Pushes `output/` directory to `gh-pages` branch
   - GitHub Pages serves from `gh-pages` branch

### File Structure

**Committed to Git** (source files):
```
├── .github/workflows/publish.yml  # GitHub Actions workflow
├── input/                         # Source files
│   ├── fsh/                       # FSH definitions
│   ├── pagecontent/               # Markdown pages
│   ├── images/                    # Images
│   └── resources/                 # Additional resources
├── sushi-config.yaml              # SUSHI configuration
├── ig.ini                         # IG Publisher config
├── package-list.json              # Version history
├── _genonce.sh                    # Build script
├── _updatePublisher.sh            # Publisher updater
├── README.md                      # Project documentation
└── .gitignore                     # Git exclusions
```

**NOT Committed** (auto-generated, in .gitignore):
```
├── output/                        # Generated HTML (deployed to gh-pages)
├── fsh-generated/                 # SUSHI output
├── temp/                          # Build temporary files
├── template/                      # Downloaded templates
└── input-cache/*.jar              # IG Publisher JAR
```

## Subsequent Updates

After the initial setup, updating your IG is simple:

### 1. Make Changes

Edit your FSH files in `input/fsh/` or markdown pages in `input/pagecontent/`

### 2. Test Locally (Recommended)

```bash
./_genonce.sh
open output/index.html  # Review changes locally
```

### 3. Commit and Push

```bash
git add .
git commit -m "Description of changes"
git push
```

### 4. Automatic Deployment

- GitHub Actions automatically builds and deploys
- Check the Actions tab for build status
- Changes appear at your GitHub Pages URL in ~5 minutes

## Manual Build Trigger

You can manually trigger a build without making commits:

1. Go to **Actions** tab in your repository
2. Click "Build and Publish FHIR IG" workflow
3. Click **Run workflow** button
4. Select branch and click "Run workflow"

## Viewing Build Results

### Build Artifacts

For every build (including PRs), artifacts are uploaded and available for 30 days:

1. Go to **Actions** tab
2. Click on a workflow run
3. Scroll to "Artifacts" section
4. Download `fhir-ig-output.zip`

### Build Logs

If a build fails:

1. Go to **Actions** tab
2. Click the failed workflow run
3. Click on the failed step to see detailed logs
4. Common issues:
   - FSH syntax errors (check SUSHI step)
   - Missing dependencies (check IG Publisher step)
   - Jekyll errors (check Jekyll step)

## Alternative: HL7 Auto-Builder

For work-in-progress visibility, you can also use the HL7 Auto-Builder:

### Setup

1. Install the FHIR IG Builder app:
   - Visit: https://github.com/apps/fhir-ig-builder
   - Click "Install"
   - Select your repository
   - Grant permissions

2. Push to GitHub (auto-builder triggers automatically)

### Access Builds

- **Main branch**: `https://build.fhir.org/ig/[username]/fhir-sbc/`
- **Other branches**: `https://build.fhir.org/ig/[username]/fhir-sbc/branches/[branch-name]/`
- **Build logs**: `https://build.fhir.org/ig/[username]/fhir-sbc/branches/main/build.log`

### Benefits of Both

Many projects use **both**:
- **GitHub Pages**: Official, stable hosting for releases
- **Auto-Builder**: Continuous integration, work-in-progress sharing

## Updating the Canonical URL

Your IG's canonical URL should match your GitHub Pages URL. Update `sushi-config.yaml`:

```yaml
canonical: https://[your-username].github.io/fhir-sbc
```

Then rebuild and push:

```bash
git add sushi-config.yaml
git commit -m "Update canonical URL to GitHub Pages"
git push
```

## Custom Domain (Optional)

To use a custom domain (e.g., `sbc.example.com`):

1. Add `CNAME` file to repository root:
   ```bash
   echo "sbc.example.com" > CNAME
   git add CNAME
   git commit -m "Add custom domain"
   git push
   ```

2. Configure DNS with your domain provider:
   - Add CNAME record: `sbc` → `[your-username].github.io`

3. In GitHub Settings → Pages:
   - Enter custom domain
   - Enable "Enforce HTTPS"

## Versioning

To publish versioned releases:

1. Update version in `sushi-config.yaml`
2. Update `package-list.json` with new version entry
3. Tag the release:
   ```bash
   git tag -a v0.1.0 -m "Release version 0.1.0"
   git push origin v0.1.0
   ```

4. Create GitHub Release:
   - Go to repository → Releases → Draft a new release
   - Select the tag
   - Add release notes
   - Publish release

## Troubleshooting

### Build Fails

**Check Actions logs** for specific errors:
- SUSHI errors → Fix FSH syntax
- IG Publisher errors → Check resource validity
- Jekyll errors → Check markdown formatting

### 404 on GitHub Pages

- Wait 5-10 minutes after first deployment
- Verify Settings → Pages is configured correctly
- Check that `gh-pages` branch exists
- Verify workflow completed successfully

### Changes Not Appearing

- Clear browser cache
- Wait a few minutes for GitHub Pages to update
- Check Actions tab to confirm deployment succeeded
- Verify you're viewing the correct URL

## Resources

- **GitHub Pages Documentation**: https://docs.github.com/pages
- **GitHub Actions Documentation**: https://docs.github.com/actions
- **SUSHI Documentation**: https://fshschool.org/docs/sushi/
- **IG Publisher Documentation**: https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation
- **HL7 Auto-Builder**: https://github.com/FHIR/auto-ig-builder
- **FHIR Chat**: https://chat.fhir.org

## Support

For issues specific to:
- **This IG**: Open an issue in your repository
- **SUSHI/FSH**: https://chat.fhir.org/#narrow/stream/215610-shorthand
- **IG Publisher**: https://chat.fhir.org/#narrow/stream/179252-IG-creation
- **GitHub Actions**: https://github.community/

## Next Steps

After successful deployment:

1. ✅ Verify your IG at `https://[username].github.io/fhir-sbc/`
2. ✅ Review QA report at `https://[username].github.io/fhir-sbc/qa.html`
3. ✅ Share your IG URL with collaborators
4. ✅ Consider setting up auto-builder for CI builds
5. ✅ Add link to README.md pointing to published IG
