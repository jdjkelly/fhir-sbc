# Quick Start Guide

## Installation Prerequisites

1. **Install Node.js** (if not already installed)
   ```bash
   # On macOS with Homebrew
   brew install node

   # Or download from https://nodejs.org/
   ```

2. **Install SUSHI**
   ```bash
   npm install -g fsh-sushi
   ```

3. **Verify installation**
   ```bash
   sushi --version
   ```

## Build the IG

### Option 1: Quick FSH Compilation (Fastest)

Just compile FSH to FHIR resources:

```bash
sushi .
```

Output will be in `fsh-generated/resources/`

### Option 2: Full IG Build

Build the complete Implementation Guide with HTML documentation:

```bash
# First time only - download the IG Publisher
./_updatePublisher.sh

# Then run the full build
./_genonce.sh
```

This will:
1. Run SUSHI to convert FSH → FHIR
2. Run the IG Publisher to generate HTML documentation
3. Create output in `output/index.html`

**Note:** First build takes 5-10 minutes. Subsequent builds are faster.

## View the Results

### After FSH Compilation
```bash
# View generated FHIR resources
ls fsh-generated/resources/

# Example: View the profile
cat fsh-generated/resources/StructureDefinition-sbc-insurance-plan.json
```

### After Full Build
```bash
# Open the IG in your browser
open output/index.html

# Or on Linux
xdg-open output/index.html
```

## Project Contents

### Profiles
- **SBC InsurancePlan** (`input/fsh/profiles/SBCInsurancePlan.fsh`)
  - Main profile constraining InsurancePlan for SBC documents
  - Requires all 27 benefit categories with cost-sharing

### Terminology
- **SBC Benefit Category CodeSystem** (27 codes)
- **SBC Benefit Category ValueSet**
- **SBC Plan Type CodeSystem** (HMO, PPO, POS, EPO, HDHP, Indemnity)
- **SBC Plan Type ValueSet**

### Extensions
- **SBC Metadata** - Minimum essential coverage, minimum value, abortion coverage, version date
- **Excluded Services** - Services not covered by the plan
- **Benefit Limitation** - Limitations and exceptions for benefits

### Examples
- **SBCExampleHMO** - Complete HMO plan example with multiple benefit categories

### Documentation
- **index.md** - Home page and introduction
- **mapping.md** - Detailed SBC-to-FHIR mapping tables
- **profiles.md** - Profile documentation and usage guidance
- **terminology.md** - CodeSystem and ValueSet details
- **examples.md** - Example patterns and scenarios

## Common Commands

```bash
# Compile FSH files only
sushi .

# Clean and rebuild
rm -rf fsh-generated/ output/ temp/
sushi .

# Build full IG
./_genonce.sh

# Update IG Publisher to latest version
./_updatePublisher.sh

# Validate FHIR resources (after building)
java -jar input-cache/publisher.jar -ig . -no-sushi
```

## Troubleshooting

### "command not found: sushi"
Install SUSHI: `npm install -g fsh-sushi`

### "command not found: java"
Install Java 11 or higher from https://adoptium.net/

### "Error: Cannot find module"
Make sure you're in the project root directory (where `sushi-config.yaml` is located)

### Build fails with validation errors
- Check FSH syntax in `input/fsh/` files
- Review error messages for specific issues
- Consult SUSHI documentation: https://fshschool.org/

## Next Steps

1. **Review the example** in `input/fsh/examples/SBCExample.fsh`
2. **Customize for your needs** - Modify profiles, add more benefit categories, etc.
3. **Add your own examples** - Create additional SBC instances
4. **Build and validate** - Run SUSHI to check for errors
5. **Publish** - Generate the full IG for documentation

## Resources

- **SUSHI Documentation**: https://fshschool.org/
- **FHIR Shorthand Tutorial**: https://fshschool.org/courses/fsh-seminar/
- **FHIR R4 Spec**: http://hl7.org/fhir/R4/
- **InsurancePlan Resource**: http://hl7.org/fhir/R4/insuranceplan.html
- **SBC Regulations**: https://www.cms.gov/cciio/resources/forms-reports-and-other-resources/

## Questions?

Refer to:
- `README.md` - Full project documentation
- `input/pagecontent/*.md` - Implementation guidance
- FHIR chat: https://chat.fhir.org/
