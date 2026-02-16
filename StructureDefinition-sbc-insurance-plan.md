# SBC Insurance Plan Profile - Summary of Benefits and Coverage (SBC) FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SBC Insurance Plan Profile**

## Resource Profile: SBC Insurance Plan Profile 

| | |
| :--- | :--- |
| *Official URL*:http://flexpa.com/fhir/sbc/StructureDefinition/sbc-insurance-plan | *Version*:0.1.0 |
| Draft as of 2026-02-16 | *Computable Name*:SBCInsurancePlan |

 
Profile of InsurancePlan resource for representing Summary of Benefits and Coverage (SBC) documents as required under ACA Section 2715 and implementing regulations at 45 CFR 147.200, 29 CFR 2590.715-2715, and 26 CFR 54.9815-2715 

 
To represent Summary of Benefits and Coverage documents in structured FHIR format, enabling machine-readable representation of the 30 required SBC benefit categories, cost-sharing information, network distinctions, and regulatory disclosures 

**Usages:**

* Examples for this Profile: [Sample Health HMO Gold Plan](InsurancePlan-SBCExampleHMO.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/sbc-fhir-ig|current/StructureDefinition/sbc-insurance-plan)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-sbc-insurance-plan.csv), [Excel](StructureDefinition-sbc-insurance-plan.xlsx), [Schematron](StructureDefinition-sbc-insurance-plan.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sbc-insurance-plan",
  "url" : "http://flexpa.com/fhir/sbc/StructureDefinition/sbc-insurance-plan",
  "version" : "0.1.0",
  "name" : "SBCInsurancePlan",
  "title" : "SBC Insurance Plan Profile",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-02-16T20:07:33+00:00",
  "publisher" : "SBC FHIR Project",
  "contact" : [
    {
      "name" : "SBC FHIR Project",
      "telecom" : [
        {
          "system" : "url",
          "value" : "http://flexpa.com"
        },
        {
          "system" : "email",
          "value" : "contact@flexpa.com"
        }
      ]
    }
  ],
  "description" : "Profile of InsurancePlan resource for representing Summary of Benefits and Coverage (SBC) documents as required under ACA Section 2715 and implementing regulations at 45 CFR 147.200, 29 CFR 2590.715-2715, and 26 CFR 54.9815-2715",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "US",
          "display" : "United States of America"
        }
      ]
    }
  ],
  "purpose" : "To represent Summary of Benefits and Coverage documents in structured FHIR format, enabling machine-readable representation of the 30 required SBC benefit categories, cost-sharing information, network distinctions, and regulatory disclosures",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "InsurancePlan",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/InsurancePlan",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "InsurancePlan",
        "path" : "InsurancePlan"
      },
      {
        "id" : "InsurancePlan.extension",
        "path" : "InsurancePlan.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "InsurancePlan.extension:sbcMetadata",
        "path" : "InsurancePlan.extension",
        "sliceName" : "sbcMetadata",
        "short" : "SBC regulatory metadata",
        "definition" : "Contains minimum essential coverage indicator, minimum value indicator, abortion coverage disclosure, and SBC version date",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://flexpa.com/fhir/sbc/StructureDefinition/sbc-metadata"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.extension:excludedServices",
        "path" : "InsurancePlan.extension",
        "sliceName" : "excludedServices",
        "short" : "Excluded services list",
        "definition" : "Services that are NOT covered by this plan, as displayed in the 'Excluded Services & Other Covered Services' section of the SBC",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://flexpa.com/fhir/sbc/StructureDefinition/excluded-services"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.identifier",
        "path" : "InsurancePlan.identifier",
        "short" : "Business identifier for the insurance plan (e.g., HIOS ID)",
        "definition" : "Unique identifier for the plan, such as the 14-16 character HIOS ID (5-digit Issuer ID + 2-character State Abbreviation + 3-digit Product Iteration + 4-digit Plan Iteration + optional 2-digit Variant)",
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.status",
        "path" : "InsurancePlan.status",
        "min" : 1,
        "fixedCode" : "active",
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.name",
        "path" : "InsurancePlan.name",
        "short" : "Plan name as displayed on SBC",
        "definition" : "The official name of the health insurance plan as it appears in the SBC header",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.period",
        "path" : "InsurancePlan.period",
        "short" : "Coverage period",
        "definition" : "The time period during which this plan is or was available. Maps to the Coverage Period displayed in the SBC header",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.ownedBy",
        "path" : "InsurancePlan.ownedBy",
        "short" : "Plan issuer organization",
        "definition" : "The health insurance issuer or employer that owns/offers this plan",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.administeredBy",
        "path" : "InsurancePlan.administeredBy",
        "short" : "Plan administrator",
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.contact",
        "path" : "InsurancePlan.contact",
        "short" : "Contact information for plan questions",
        "definition" : "Contact information including phone numbers, website addresses, and other contact methods required by SBC regulations for questions, provider lists, formulary, and uniform glossary access",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.coverage",
        "path" : "InsurancePlan.coverage",
        "short" : "Benefit coverage details",
        "definition" : "Details of benefit coverage for different categories of services. Each coverage entry should represent one or more of the 30 required SBC benefit categories",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.coverage.type",
        "path" : "InsurancePlan.coverage.type",
        "short" : "Type of coverage (e.g., medical, pharmacy)",
        "definition" : "High-level categorization of coverage type. Use codes from an appropriate coverage type code system such as v3-ActCode (e.g., HIP for health insurance plan policy)",
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.coverage.network",
        "path" : "InsurancePlan.coverage.network",
        "short" : "Provider networks for this coverage",
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.coverage.benefit",
        "path" : "InsurancePlan.coverage.benefit",
        "short" : "Specific benefits covered",
        "definition" : "Individual benefit types within this coverage category, corresponding to the 30 SBC benefit categories",
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.coverage.benefit.extension",
        "path" : "InsurancePlan.coverage.benefit.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "InsurancePlan.coverage.benefit.extension:limitation",
        "path" : "InsurancePlan.coverage.benefit.extension",
        "sliceName" : "limitation",
        "short" : "Limitations and exceptions",
        "definition" : "Specific limitations, exceptions, or additional context for this benefit as displayed in the SBC",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://flexpa.com/fhir/sbc/StructureDefinition/benefit-limitation"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.coverage.benefit.type",
        "path" : "InsurancePlan.coverage.benefit.type",
        "short" : "Benefit category code",
        "definition" : "The specific benefit category from the SBC's 30 required categories",
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://flexpa.com/fhir/sbc/ValueSet/sbc-benefit-category"
        }
      },
      {
        "id" : "InsurancePlan.coverage.benefit.requirement",
        "path" : "InsurancePlan.coverage.benefit.requirement",
        "short" : "Requirements for accessing benefit",
        "definition" : "Text describing requirements such as prior authorization, referral requirements, or other access limitations",
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.plan",
        "path" : "InsurancePlan.plan",
        "short" : "Health insurance plan details",
        "definition" : "Specific plan offerings with detailed cost-sharing information for each of the 30 SBC benefit categories",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.plan.type",
        "path" : "InsurancePlan.plan.type",
        "short" : "Plan type (HMO, PPO, POS, EPO, etc.)",
        "definition" : "The type of health insurance plan as displayed in the SBC header (e.g., HMO, PPO, POS, EPO, HDHP, Indemnity)",
        "mustSupport" : true,
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "http://flexpa.com/fhir/sbc/ValueSet/sbc-plan-type"
        }
      },
      {
        "id" : "InsurancePlan.plan.coverageArea",
        "path" : "InsurancePlan.plan.coverageArea",
        "short" : "Geographic coverage area",
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.plan.network",
        "path" : "InsurancePlan.plan.network",
        "short" : "Provider networks for this plan",
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.plan.generalCost",
        "path" : "InsurancePlan.plan.generalCost",
        "short" : "Overall plan costs",
        "definition" : "Plan-level costs such as overall deductibles and out-of-pocket maximums that apply across benefit categories",
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.plan.generalCost.type",
        "path" : "InsurancePlan.plan.generalCost.type",
        "short" : "Type of cost (deductible, out-of-pocket max)",
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.plan.generalCost.cost",
        "path" : "InsurancePlan.plan.generalCost.cost",
        "short" : "Cost amount",
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.plan.generalCost.comment",
        "path" : "InsurancePlan.plan.generalCost.comment",
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.plan.specificCost",
        "path" : "InsurancePlan.plan.specificCost",
        "short" : "Cost-sharing by benefit category",
        "definition" : "Cost-sharing information (copays, coinsurance, deductibles) for each of the 30 SBC benefit categories, with separate amounts for in-network and out-of-network services",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.plan.specificCost.category",
        "path" : "InsurancePlan.plan.specificCost.category",
        "short" : "Benefit category code",
        "definition" : "The specific SBC benefit category to which these costs apply",
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://flexpa.com/fhir/sbc/ValueSet/sbc-benefit-category"
        }
      },
      {
        "id" : "InsurancePlan.plan.specificCost.benefit",
        "path" : "InsurancePlan.plan.specificCost.benefit",
        "short" : "Specific benefit with costs",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.plan.specificCost.benefit.extension",
        "path" : "InsurancePlan.plan.specificCost.benefit.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "InsurancePlan.plan.specificCost.benefit.extension:limitation",
        "path" : "InsurancePlan.plan.specificCost.benefit.extension",
        "sliceName" : "limitation",
        "short" : "Benefit-specific limitations",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://flexpa.com/fhir/sbc/StructureDefinition/benefit-limitation"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.plan.specificCost.benefit.type",
        "path" : "InsurancePlan.plan.specificCost.benefit.type",
        "short" : "Benefit type code",
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://flexpa.com/fhir/sbc/ValueSet/sbc-benefit-category"
        }
      },
      {
        "id" : "InsurancePlan.plan.specificCost.benefit.cost",
        "path" : "InsurancePlan.plan.specificCost.benefit.cost",
        "short" : "Cost-sharing amounts",
        "definition" : "Cost-sharing information including copays, coinsurance, and deductibles. Must include separate entries for in-network and out-of-network services where applicable",
        "min" : 2,
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.plan.specificCost.benefit.cost.type",
        "path" : "InsurancePlan.plan.specificCost.benefit.cost.type",
        "short" : "Type of cost (copay, coinsurance, deductible)",
        "definition" : "The type of cost-sharing: copayment (fixed dollar amount), coinsurance (percentage), or deductible",
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.plan.specificCost.benefit.cost.applicability",
        "path" : "InsurancePlan.plan.specificCost.benefit.cost.applicability",
        "short" : "Network applicability (in-network, out-of-network)",
        "definition" : "Whether this cost applies to in-network services, out-of-network services, or other scenarios",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "InsurancePlan.plan.specificCost.benefit.cost.value",
        "path" : "InsurancePlan.plan.specificCost.benefit.cost.value",
        "short" : "Cost amount",
        "definition" : "The actual cost-sharing amount (dollar amount for copay, percentage for coinsurance)",
        "min" : 1,
        "mustSupport" : true
      }
    ]
  }
}

```
