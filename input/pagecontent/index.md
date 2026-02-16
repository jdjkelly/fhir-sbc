# Summary of Benefits and Coverage (SBC) FHIR Implementation Guide

## Overview

This Implementation Guide (IG) defines a FHIR profile for representing Summary of Benefits and Coverage (SBC) documents as structured data using the InsurancePlan resource. The SBC is a standardized disclosure document required under the Affordable Care Act (ACA) Section 2715 and implementing regulations.

## Purpose

The SBC framework was established to provide consumers with clear, standardized information about health insurance benefits and costs. While SBC regulations prescribe detailed content requirements, they do not specify machine-readable data formats. This IG addresses that gap by:

- Defining a structured FHIR representation of SBC documents
- Enabling machine-readable representation of the 30 required benefit service categories
- Supporting programmatic access to cost-sharing information (copays, coinsurance, deductibles)
- Preserving network distinctions (in-network vs. out-of-network)
- Maintaining regulatory compliance with SBC content requirements

## Regulatory Context

The SBC is jointly regulated by three federal agencies:

- **Department of Health and Human Services (HHS)** through CMS and CCIIO - enforces requirements for health insurance issuers (45 CFR 147.200)
- **Department of Labor (DOL)** through EBSA - enforces requirements for ERISA-covered group health plans (29 CFR 2590.715-2715)
- **Department of the Treasury** through IRS - enforces via excise taxes (26 CFR 54.9815-2715)

The statutory authority stems from Section 2715 of the Public Health Service Act, added by ACA Section 1001(5), codified at 42 U.S.C. § 300gg-15.

## Key Features

### 30 Required Benefit Service Categories

The profile supports all 30 benefit service rows from the SBC template, organized by Common Medical Event:

**If you visit a health care provider's office or clinic:**
1. Primary care visit to treat an injury or illness
2. Specialist visit
3. Preventive care/screening/immunization

**If you have a test:**
4. Diagnostic test (x-ray, blood work)
5. Imaging (CT/PET scans, MRIs)

**If you need drugs to treat your illness or condition:**
6. Generic drugs
7. Preferred brand drugs
8. Non-preferred brand drugs
9. Specialty drugs

**If you have outpatient surgery:**
10. Facility fee (e.g., ambulatory surgery center)
11. Physician/surgeon fees

**If you need immediate medical attention:**
12. Emergency room care
13. Emergency medical transportation
14. Urgent care

**If you have a hospital stay:**
15. Facility fee (e.g., hospital room)
16. Physician/surgeon fees

**If you need mental health, behavioral health, or substance abuse services:**
17. Outpatient services
18. Inpatient services

**If you are pregnant:**
19. Office visits
20. Childbirth/delivery professional services
21. Childbirth/delivery facility services

**If you need help recovering or have other special health needs:**
22. Home health care
23. Rehabilitation services
24. Habilitation services
25. Skilled nursing care
26. Durable medical equipment
27. Hospice services

**If your child needs dental or eye care:**
28. Children's eye exam
29. Children's glasses
30. Children's dental check-up

### Cost-Sharing Representation

The profile represents cost-sharing through the InsurancePlan `plan.specificCost` structure:

- **Copayments** - Fixed dollar amounts per service
- **Coinsurance** - Percentage of costs paid by the member
- **Deductibles** - Amounts to be paid before benefits apply
- **Network distinctions** - Separate costs for in-network and out-of-network services

### SBC-Specific Extensions

While the profile prioritizes using base InsurancePlan elements, it defines minimal extensions for SBC-specific content:

- **SBC Metadata Extension** - Minimum essential coverage indicator, minimum value indicator, abortion coverage disclosure
- **Excluded Services Extension** - Services not covered by the plan
- **Benefit Limitation Extension** - Limitations and exceptions for specific benefits

## Scope

This IG currently focuses on the core benefit and cost-sharing structure of SBC documents. Future versions may include:

- Coverage examples (standardized scenarios: having a baby, managing diabetes, simple fracture)
- Additional regulatory disclosures
- Language access and translation metadata
- Links to uniform glossary definitions

## Target Audience

- Health insurance issuers creating SBC documents
- Health plan administrators
- Consumer-facing health applications
- Health IT vendors building plan comparison tools
- Researchers analyzing health plan benefits

## Getting Started

- Review the [SBC to FHIR Mapping](mapping.html) to understand how SBC elements map to FHIR
- Explore the [SBC InsurancePlan Profile](StructureDefinition-sbc-insurance-plan.html)
- Examine the [Example SBC](InsurancePlan-SBCExampleHMO.html) for a complete implementation
- Browse the [Terminology](terminology.html) for benefit category codes

## Authors and Contributors

This IG is maintained by the SBC FHIR Project.

## License and Legal

This implementation guide is provided for educational and interoperability purposes. Organizations using this IG remain responsible for compliance with all applicable SBC regulations at 45 CFR 147.200, 29 CFR 2590.715-2715, and 26 CFR 54.9815-2715.
