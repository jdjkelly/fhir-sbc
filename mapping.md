# SBC to FHIR Mapping - Summary of Benefits and Coverage (SBC) FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* **SBC to FHIR Mapping**

## SBC to FHIR Mapping

# SBC to FHIR Mapping

This page documents the detailed mapping from Summary of Benefits and Coverage (SBC) document sections to FHIR InsurancePlan elements.

## Document Header and Plan Information

| | | |
| :--- | :--- | :--- |
| Plan Name | `InsurancePlan.name` | Official plan name as it appears on SBC |
| Plan Type (HMO, PPO, etc.) | `InsurancePlan.plan.type` | Uses SBC Plan Type ValueSet |
| Coverage Period | `InsurancePlan.period` | Start and end dates |
| Plan Issuer | `InsurancePlan.ownedBy` | Reference to Organization |
| HIOS ID | `InsurancePlan.identifier` | 14-16 digit CMS identifier |

## Important Questions Section

The SBC "Important Questions" section contains seven mandatory Q&A items. These map to various FHIR elements:

| | | |
| :--- | :--- | :--- |
| What is the overall deductible? | `InsurancePlan.plan.generalCost`(type: "Individual Deductible") | Separate entries for individual and family |
| Are there services covered before you meet your deductible? | `InsurancePlan.plan.specificCost.benefit.cost` | Benefits with $0 deductible or specific exceptions |
| Are there other deductibles for specific services? | `InsurancePlan.plan.specificCost` | Service-specific deductibles in cost array |
| What is the out-of-pocket limit? | `InsurancePlan.plan.generalCost`(type: "Out-of-Pocket Maximum") | Individual and family OOP limits |
| What is not included in the out-of-pocket limit? | `InsurancePlan.plan.generalCost.comment`or extension | Descriptive text |
| Will you pay less if you use a network provider? | `InsurancePlan.plan.specificCost.benefit.cost.applicability` | in-network vs out-of-network cost variations |
| Do you need a referral to see a specialist? | `InsurancePlan.coverage.benefit.requirement` | Text on specialist benefit |

## Benefit Categories (30 Required Categories)

All 30 SBC benefit categories map to the `InsurancePlan` structure through two interconnected sections. The 30 codes correspond to the actual rows in the CMS SBC template per 45 CFR § 147.200, including:

**Key structural changes from previous versions:**

* `facility-fee` split into `outpatient-facility-fee` and `hospital-facility-fee`
* `physician-surgeon-fee` split into `outpatient-physician-fee` and `hospital-physician-fee`
* Generic `hospital-outpatient` and `hospital-inpatient` removed (not actual SBC template rows)
* `pregnancy` renamed to `pregnancy-office-visits`
* `pregnancy-delivery` renamed to `pregnancy-delivery-professional`
* `pregnancy-home-health` replaced with `pregnancy-delivery-facility` (delivery-specific facility fee)
* `home-health-care` added as a separate benefit (under recovery, not pregnancy-related)

### Coverage Section

Maps to `InsurancePlan.coverage.benefit`:

* Each benefit category is represented
* Includes requirements (e.g., "referral required", "prior authorization required")
* Uses BenefitLimitation extension for limitations and exceptions

**Note on coverage.type:** The `InsurancePlan.coverage.type` element is NOT bound to SBCBenefitCategory. Instead, it's used for high-level coverage type classification (e.g., v3-ActCode#HIP for "health insurance plan"). The specific SBC benefit categories are represented in the `coverage.benefit.type` and `plan.specificCost.category` elements.

### Plan Cost Section

Maps to `InsurancePlan.plan.specificCost`:

* Each benefit category has associated costs
* Separate cost entries for in-network and out-of-network
* Cost types: copayment, coinsurance, deductible

### Example Mapping: Primary Care Visit

**SBC Display:**

```
Primary Care Visit to Treat an Illness or Injury
In-Network: $25 copay
Out-of-Network: Not covered

```

**FHIR Representation:**

```
coverage.benefit[x]
  .type = #primary-care-visit
  .requirement = "No referral required"

plan.specificCost[x]
  .category = #primary-care-visit
  .benefit[0]
    .type = #primary-care-visit
    .cost[0]
      .type.text = "Copayment"
      .applicability.text = "in-network"
      .value = 25 USD
    .cost[1]
      .type.text = "Not covered"
      .applicability.text = "out-of-network"
      .value = 0 USD

```

## Excluded Services & Other Covered Services

The SBC includes a two-column section listing excluded services and other covered services beyond the main categories.

| | | |
| :--- | :--- | :--- |
| Excluded Services | `ExcludedServices`extension | Array of services not covered |
| Each excluded service | `extension.service.serviceType`and`.description` | CodeableConcept + descriptive text |
| Other Covered Services | Additional`coverage.benefit`entries | Services beyond the 30 required categories |

## Limitations and Exceptions

Throughout the SBC, limitations and exceptions are noted for specific benefits:

| | | |
| :--- | :--- | :--- |
| Benefit-specific limitations | `BenefitLimitation`extension on`coverage.benefit` | E.g., "Preauthorization required" |
| Cost-specific limitations | `BenefitLimitation`extension on`plan.specificCost.benefit` | E.g., "Copay waived if admitted" |

## Contact Information

The SBC requires multiple contact points for consumers:

| | | |
| :--- | :--- | :--- |
| Questions phone number | `InsurancePlan.contact[0].telecom`(purpose: "General Questions") | Primary contact |
| Website | `InsurancePlan.contact[0].telecom`(system: url) | Plan website |
| Provider list location | `InsurancePlan.contact.telecom` | URL or phone for network directory |
| Formulary location | `InsurancePlan.contact.telecom` | URL or phone for drug list |
| Uniform glossary | `InsurancePlan.contact.telecom` | Typically healthcare.gov/sbc-glossary/ |

## Regulatory Disclosures

Several SBC-specific regulatory disclosures use the SBC Metadata extension:

| | | |
| :--- | :--- | :--- |
| Minimum Essential Coverage statement | `SBCMetadata`extension`.minimumEssentialCoverage` | Boolean indicator |
| Minimum Value statement | `SBCMetadata`extension`.minimumValue` | Boolean indicator |
| Abortion coverage disclosure (QHP only) | `SBCMetadata`extension`.abortionCoverage` | CodeableConcept |
| SBC template version date | `SBCMetadata`extension`.sbcVersionDate` | Date (e.g., 2021-01-01) |

## Coverage Examples (Not Yet Implemented)

The SBC requires three standardized coverage examples:

1. Having a baby (normal delivery)
1. Managing type 2 diabetes (routine maintenance)
1. Simple fracture (emergency room visit)

**Future Implementation Options:**

* Custom extension on InsurancePlan
* Separate Claim or ExplanationOfBenefit profile
* Referenced example resources

**Note: Coverage examples are not included in the current version of this IG**

## Important Design Principles

1. **Maximize use of base InsurancePlan elements**- Extensions only where truly necessary
1. **Network distinctions are critical**- Always include both in-network and out-of-network costs via`.applicability`
1. **All 30 benefit categories should be represented**- Even if "Not covered" or "$0"
1. **Consumer-readable text is important**- Use`.requirement`,`.comment`, and extension strings for explanations
1. **Regulatory compliance**- Map all mandatory SBC elements to maintain compliance

## Unmapped SBC Elements

Some SBC elements are better represented in IG documentation than in instance data:

* **Disclaimers** ("This is only a summary…")
* **Continuation rights descriptions** (COBRA, state continuation)
* **Grievance and appeals processes**
* **Language access taglines** (for non-English speakers)
* **"Why This Matters" language** (consumer education text from template)

These elements provide important consumer information but are standardized boilerplate that doesn't vary by plan.

## Validation Considerations

Implementations should validate:

* All 30 benefit categories are present in `plan.specificCost`
* Each benefit has at least 2 cost entries (in-network and out-of-network)
* Required metadata elements are populated (name, period, ownedBy)
* Contact information includes at minimum a phone number and website
* Cost values use appropriate units (USD for copays, % for coinsurance)

