# Benefit Limitation Extension - Summary of Benefits and Coverage (SBC) FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Benefit Limitation Extension**

## Extension: Benefit Limitation Extension 

| | |
| :--- | :--- |
| *Official URL*:http://flexpa.com/fhir/sbc/StructureDefinition/benefit-limitation | *Version*:0.1.0 |
| Draft as of 2026-02-16 | *Computable Name*:BenefitLimitation |

Extension for documenting limitations and exceptions that apply to specific benefits in the SBC

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [SBC Insurance Plan Profile](StructureDefinition-sbc-insurance-plan.md)
* Examples for this Extension: [Sample Health HMO Gold Plan](InsurancePlan-SBCExampleHMO.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/sbc-fhir-ig|current/StructureDefinition/benefit-limitation)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-benefit-limitation.csv), [Excel](StructureDefinition-benefit-limitation.xlsx), [Schematron](StructureDefinition-benefit-limitation.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "benefit-limitation",
  "url" : "http://flexpa.com/fhir/sbc/StructureDefinition/benefit-limitation",
  "version" : "0.1.0",
  "name" : "BenefitLimitation",
  "title" : "Benefit Limitation Extension",
  "status" : "draft",
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
  "description" : "Extension for documenting limitations and exceptions that apply to specific benefits in the SBC",
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
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "InsurancePlan.coverage.benefit"
    },
    {
      "type" : "element",
      "expression" : "InsurancePlan.plan.specificCost.benefit"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "Benefit Limitation Extension",
        "definition" : "Extension for documenting limitations and exceptions that apply to specific benefits in the SBC"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://flexpa.com/fhir/sbc/StructureDefinition/benefit-limitation"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "short" : "Limitation or Exception",
        "definition" : "Text describing limitations, exceptions, or additional requirements that apply to this benefit",
        "type" : [
          {
            "code" : "string"
          }
        ]
      }
    ]
  }
}

```
