# SBC Metadata Extension - Summary of Benefits and Coverage (SBC) FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SBC Metadata Extension**

## Extension: SBC Metadata Extension 

| | |
| :--- | :--- |
| *Official URL*:http://flexpa.com/fhir/sbc/StructureDefinition/sbc-metadata | *Version*:0.1.0 |
| Draft as of 2026-02-16 | *Computable Name*:SBCMetadata |

Extension containing regulatory metadata required for Summary of Benefits and Coverage documents

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [SBC Insurance Plan Profile](StructureDefinition-sbc-insurance-plan.md)
* Examples for this Extension: [Sample Health HMO Gold Plan](InsurancePlan-SBCExampleHMO.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/sbc-fhir-ig|current/StructureDefinition/sbc-metadata)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-sbc-metadata.csv), [Excel](StructureDefinition-sbc-metadata.xlsx), [Schematron](StructureDefinition-sbc-metadata.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sbc-metadata",
  "url" : "http://flexpa.com/fhir/sbc/StructureDefinition/sbc-metadata",
  "version" : "0.1.0",
  "name" : "SBCMetadata",
  "title" : "SBC Metadata Extension",
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
  "description" : "Extension containing regulatory metadata required for Summary of Benefits and Coverage documents",
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
      "expression" : "InsurancePlan"
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
        "short" : "SBC Metadata Extension",
        "definition" : "Extension containing regulatory metadata required for Summary of Benefits and Coverage documents"
      },
      {
        "id" : "Extension.extension:sbcVersionDate",
        "path" : "Extension.extension",
        "sliceName" : "sbcVersionDate",
        "short" : "SBC Template Version Date",
        "definition" : "The effective date of the SBC template version used",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Extension.extension:sbcVersionDate.extension",
        "path" : "Extension.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.extension:sbcVersionDate.url",
        "path" : "Extension.extension.url",
        "fixedUri" : "sbcVersionDate"
      },
      {
        "id" : "Extension.extension:sbcVersionDate.value[x]",
        "path" : "Extension.extension.value[x]",
        "type" : [
          {
            "code" : "date"
          }
        ]
      },
      {
        "id" : "Extension.extension:minimumEssentialCoverage",
        "path" : "Extension.extension",
        "sliceName" : "minimumEssentialCoverage",
        "short" : "Minimum Essential Coverage Indicator",
        "definition" : "Indicates whether the plan provides minimum essential coverage under section 5000A(f) of the Internal Revenue Code",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Extension.extension:minimumEssentialCoverage.extension",
        "path" : "Extension.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.extension:minimumEssentialCoverage.url",
        "path" : "Extension.extension.url",
        "fixedUri" : "minimumEssentialCoverage"
      },
      {
        "id" : "Extension.extension:minimumEssentialCoverage.value[x]",
        "path" : "Extension.extension.value[x]",
        "type" : [
          {
            "code" : "boolean"
          }
        ]
      },
      {
        "id" : "Extension.extension:minimumValue",
        "path" : "Extension.extension",
        "sliceName" : "minimumValue",
        "short" : "Minimum Value Indicator",
        "definition" : "Indicates whether the plan's share of the total allowed costs of benefits meets the minimum value requirement",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Extension.extension:minimumValue.extension",
        "path" : "Extension.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.extension:minimumValue.url",
        "path" : "Extension.extension.url",
        "fixedUri" : "minimumValue"
      },
      {
        "id" : "Extension.extension:minimumValue.value[x]",
        "path" : "Extension.extension.value[x]",
        "type" : [
          {
            "code" : "boolean"
          }
        ]
      },
      {
        "id" : "Extension.extension:abortionCoverage",
        "path" : "Extension.extension",
        "sliceName" : "abortionCoverage",
        "short" : "Abortion Coverage Disclosure",
        "definition" : "For qualified health plans, indicates coverage, exclusion, or limitation to excepted abortion services per 45 CFR 156.280",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Extension.extension:abortionCoverage.extension",
        "path" : "Extension.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.extension:abortionCoverage.url",
        "path" : "Extension.extension.url",
        "fixedUri" : "abortionCoverage"
      },
      {
        "id" : "Extension.extension:abortionCoverage.value[x]",
        "path" : "Extension.extension.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ]
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://flexpa.com/fhir/sbc/StructureDefinition/sbc-metadata"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "max" : "0"
      }
    ]
  }
}

```
