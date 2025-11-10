# Summary of Benefits and Coverage (SBC) FHIR Implementation Guide

A FHIR Implementation Guide for representing Summary of Benefits and Coverage (SBC) documents as structured data using the InsurancePlan resource.

[![Build and Publish FHIR IG](https://github.com/[your-username]/fhir-sbc/actions/workflows/publish.yml/badge.svg)](https://github.com/[your-username]/fhir-sbc/actions/workflows/publish.yml)

**📖 [View Published IG](https://[your-username].github.io/fhir-sbc/)** | **📋 [Deployment Guide](DEPLOYMENT.md)** | **🚀 [Quick Start](#quick-start)**

## Overview

This FHIR IG defines profiles, extensions, and terminology for converting Summary of Benefits and Coverage documents (required under ACA Section 2715) into machine-readable FHIR format.

### Key Features

- **Complete SBC Mapping**: Represents all SBC elements including the 27 required benefit categories
- **Cost-Sharing Structure**: Models copays, coinsurance, and deductibles with in-network/out-of-network distinctions
- **Regulatory Compliance**: Includes extensions for minimum essential coverage, minimum value, and other SBC-specific disclosures
- **Standards-Based**: Built on FHIR R4 InsurancePlan resource with US Core dependencies

## Project Structure

```
├── sushi-config.yaml           # SUSHI IG configuration
├── input/
│   ├── fsh/
│   │   ├── profiles/           # SBC InsurancePlan profile
│   │   ├── extensions/         # SBC-specific extensions
│   │   ├── terminology/        # CodeSystems and ValueSets
│   │   └── examples/           # Example instances
│   ├── pagecontent/            # IG documentation pages
│   └── resources/              # Additional resources
└── README.md                   # This file
```

## Prerequisites

To build this IG, you need:

1. **Node.js** (v14 or higher)
2. **SUSHI** (FSH to FHIR converter)
   ```bash
   npm install -g fsh-sushi
   ```
3. **HL7 IG Publisher** (Java-based)
   - Download from: https://github.com/HL7/fhir-ig-publisher/releases
   - Or let SUSHI download it automatically on first build

## Building the IG

### Quick Build (FSH to FHIR only)

To compile FSH files to FHIR resources:

```bash
sushi .
```

This generates FHIR resources in `fsh-generated/resources/`

### Full IG Build

To build the complete Implementation Guide with HTML output:

```bash
./_genonce.sh    # On Mac/Linux
# or
_genonce.bat     # On Windows
```

Note: On first run, this will download the IG Publisher (~100MB) and take several minutes.

The built IG will be in `output/index.html`

### Quick Preview

For a faster build without full validation:

```bash
./_updatePublisher.sh  # Download/update publisher first
java -jar input-cache/publisher.jar -ig . -proxy WebProxy -no-sushi
```

## What's Included

### Profiles

- **SBC InsurancePlan** - Constrains InsurancePlan to represent SBC documents
  - Requires: name, status, period, ownedBy, contact, plan with cost details
  - Supports all 27 SBC benefit categories
  - Enforces in-network and out-of-network cost representation

### Terminology

- **SBC Benefit Category CodeSystem** - All 27 required SBC benefit categories
  - Preventive care, primary/specialist visits, diagnostics, imaging
  - Pharmacy (generic, preferred, non-preferred, specialty drugs)
  - Hospital care (inpatient, outpatient, ER, facility fees)
  - Mental health, pregnancy, rehabilitation, habilitation
  - Skilled nursing, DME, hospice, children's vision/dental

- **SBC Plan Type CodeSystem** - Health plan types (HMO, PPO, POS, EPO, HDHP, Indemnity)

### Extensions

- **SBC Metadata Extension** - Regulatory disclosures (minimum essential coverage, minimum value, abortion coverage, version date)
- **Excluded Services Extension** - Services not covered by the plan
- **Benefit Limitation Extension** - Limitations and exceptions for specific benefits

### Examples

- **SBCExampleHMO** - Complete example showing HMO plan with multiple benefit categories, cost-sharing, excluded services, and metadata

### Documentation

- **Home** - Introduction and overview
- **SBC to FHIR Mapping** - Detailed mapping from SBC sections to FHIR elements
- **Profiles** - Profile documentation and usage guidance
- **Terminology** - CodeSystem and ValueSet details
- **Examples** - Example patterns and scenarios

## Using the Profile

### Basic Example: Primary Care Visit

```javascript
{
  "resourceType": "InsurancePlan",
  "meta": {
    "profile": ["http://flexpa.com/fhir/sbc/StructureDefinition/sbc-insurance-plan"]
  },
  "name": "Sample HMO Plan",
  "status": "active",
  "period": {
    "start": "2025-01-01",
    "end": "2025-12-31"
  },
  "plan": [{
    "type": {
      "coding": [{
        "system": "http://flexpa.com/fhir/sbc/CodeSystem/sbc-plan-type",
        "code": "HMO"
      }]
    },
    "specificCost": [{
      "category": {
        "coding": [{
          "system": "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
          "code": "primary-care-visit"
        }]
      },
      "benefit": [{
        "type": {
          "coding": [{
            "system": "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
            "code": "primary-care-visit"
          }]
        },
        "cost": [
          {
            "type": { "text": "Copayment" },
            "applicability": { "text": "in-network" },
            "value": { "value": 25, "unit": "USD" }
          },
          {
            "type": { "text": "Not covered" },
            "applicability": { "text": "out-of-network" },
            "value": { "value": 0, "unit": "USD" }
          }
        ]
      }]
    }]
  }]
}
```

## Key Design Decisions

1. **Maximize Base Resource Usage** - Uses standard InsurancePlan elements wherever possible, only adding extensions when truly necessary

2. **Required Network Distinctions** - All cost-sharing must specify in-network vs out-of-network applicability

3. **Custom Benefit Categories** - FHIR's standard benefit-type ValueSet has only 12 codes; SBC requires 27, so a custom CodeSystem is defined

4. **Coverage Examples Deferred** - The three standardized coverage examples (having a baby, managing diabetes, simple fracture) are not yet implemented

5. **Consumer-Friendly Text** - Definitions and displays use plain language consistent with SBC glossary terms

## Validation

To validate your SBC InsurancePlan instances:

1. Ensure all 27 benefit categories are present in `plan.specificCost`
2. Each benefit must have at least 2 cost entries (in-network and out-of-network)
3. Status must be "active"
4. Name, period, and ownedBy must be populated
5. At least one contact with phone and URL required
6. Cost values must use appropriate units (USD for copays, % for coinsurance)

## Regulatory Background

The SBC is required under:
- **ACA Section 2715** (42 U.S.C. § 300gg-15)
- **45 CFR 147.200** (HHS regulations)
- **29 CFR 2590.715-2715** (DOL regulations)
- **26 CFR 54.9815-2715** (IRS regulations)

SBC documents must be provided:
- Within 7 days of application
- At renewal (30 days before new plan year)
- Upon request
- For material modifications (60 days before effective)

Penalties for non-compliance can be up to $1,000 per willful failure.

## Future Enhancements

Potential additions in future versions:
- Coverage example scenarios (having a baby, managing diabetes, simple fracture)
- Language and translation metadata
- Links to uniform glossary term definitions
- Network tier distinctions (preferred vs standard)
- Quantitative benefit limits (e.g., "30 visits per year")

## Deployment

### Publish to GitHub Pages

This IG includes automated GitHub Actions workflow for publishing to GitHub Pages.

**Quick Start:**

1. Create a public GitHub repository
2. Push this code:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/[username]/fhir-sbc.git
   git push -u origin main
   ```
3. Configure GitHub Pages in Settings → Pages:
   - Source: Deploy from a branch
   - Branch: `gh-pages`
4. Wait for build to complete (Actions tab)
5. Access at: `https://[username].github.io/fhir-sbc/`

**Full Instructions:** See [DEPLOYMENT.md](DEPLOYMENT.md)

### Alternative: HL7 Auto-Builder

For continuous integration builds:
- Install: https://github.com/apps/fhir-ig-builder
- Builds available at: `https://build.fhir.org/ig/[username]/fhir-sbc/`

## Contributing

This is a draft IG for demonstrating SBC-to-FHIR mapping. Feedback and contributions are welcome.

## License

This implementation guide is provided for educational and interoperability purposes. Organizations using this IG remain responsible for compliance with all applicable SBC regulations.

## Related Standards

- **FHIR R4**: http://hl7.org/fhir/R4/
- **US Core**: http://hl7.org/fhir/us/core/
- **Da Vinci PDex Plan Net**: http://hl7.org/fhir/us/davinci-pdex-plan-net/
- **CARIN Blue Button**: http://hl7.org/fhir/us/carin-bb/
- **SBC Regulations**: https://www.cms.gov/cciio/resources/forms-reports-and-other-resources/
