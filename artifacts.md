# Artifacts Summary - Summary of Benefits and Coverage (SBC) FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [SBC Insurance Plan Profile](StructureDefinition-sbc-insurance-plan.md) | Profile of InsurancePlan resource for representing Summary of Benefits and Coverage (SBC) documents as required under ACA Section 2715 and implementing regulations at 45 CFR 147.200, 29 CFR 2590.715-2715, and 26 CFR 54.9815-2715 |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Benefit Limitation Extension](StructureDefinition-benefit-limitation.md) | Extension for documenting limitations and exceptions that apply to specific benefits in the SBC |
| [Excluded Services Extension](StructureDefinition-excluded-services.md) | Extension for documenting services that are not covered by the health insurance plan, as required in SBC 'Excluded Services & Other Covered Services' section |
| [SBC Metadata Extension](StructureDefinition-sbc-metadata.md) | Extension containing regulatory metadata required for Summary of Benefits and Coverage documents |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [SBC Benefit Category Value Set](ValueSet-sbc-benefit-category.md) | Value set containing all 30 benefit service categories required in Summary of Benefits and Coverage (SBC) documents |
| [SBC Plan Type Value Set](ValueSet-sbc-plan-type.md) | Value set containing health insurance plan types for Summary of Benefits and Coverage documents |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [SBC Benefit Category Code System](CodeSystem-sbc-benefit-category.md) | Code system for the 30 benefit service rows required in Summary of Benefits and Coverage (SBC) documents per ACA Section 2715 regulations |
| [SBC Plan Type Code System](CodeSystem-sbc-plan-type.md) | Code system for health insurance plan types displayed in Summary of Benefits and Coverage documents |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| | |
| :--- | :--- |
| [Example Health Insurance Issuer](Organization-ExampleIssuerOrg.md) | Example organization representing a health insurance issuer |
| [Example SBC - Sample HMO Health Plan](InsurancePlan-SBCExampleHMO.md) | Example Summary of Benefits and Coverage document represented as a FHIR InsurancePlan resource, demonstrating an HMO plan with multiple benefit categories and cost-sharing information |

