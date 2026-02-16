# Excluded Services Extension - Summary of Benefits and Coverage (SBC) FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Excluded Services Extension**

## Extension: Excluded Services Extension 

| | |
| :--- | :--- |
| *Official URL*:http://flexpa.com/fhir/sbc/StructureDefinition/excluded-services | *Version*:0.1.0 |
| Draft as of 2026-02-16 | *Computable Name*:ExcludedServices |

Extension for documenting services that are not covered by the health insurance plan, as required in SBC 'Excluded Services & Other Covered Services' section

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [SBC Insurance Plan Profile](StructureDefinition-sbc-insurance-plan.md)
* Examples for this Extension: [Sample Health HMO Gold Plan](InsurancePlan-SBCExampleHMO.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/sbc-fhir-ig|current/StructureDefinition/excluded-services)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-excluded-services.csv), [Excel](StructureDefinition-excluded-services.xlsx), [Schematron](StructureDefinition-excluded-services.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "excluded-services",
  "url" : "http://flexpa.com/fhir/sbc/StructureDefinition/excluded-services",
  "version" : "0.1.0",
  "name" : "ExcludedServices",
  "title" : "Excluded Services Extension",
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
  "description" : "Extension for documenting services that are not covered by the health insurance plan, as required in SBC 'Excluded Services & Other Covered Services' section",
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
        "short" : "Excluded Services Extension",
        "definition" : "Extension for documenting services that are not covered by the health insurance plan, as required in SBC 'Excluded Services & Other Covered Services' section"
      },
      {
        "id" : "Extension.extension:service",
        "path" : "Extension.extension",
        "sliceName" : "service",
        "short" : "Excluded Service",
        "definition" : "A service or category of services that is not covered under this plan",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Extension.extension:service.extension",
        "path" : "Extension.extension.extension",
        "min" : 1
      },
      {
        "id" : "Extension.extension:service.extension:serviceType",
        "path" : "Extension.extension.extension",
        "sliceName" : "serviceType",
        "short" : "Service Type",
        "definition" : "The type of service that is excluded",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Extension.extension:service.extension:serviceType.extension",
        "path" : "Extension.extension.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.extension:service.extension:serviceType.url",
        "path" : "Extension.extension.extension.url",
        "fixedUri" : "serviceType"
      },
      {
        "id" : "Extension.extension:service.extension:serviceType.value[x]",
        "path" : "Extension.extension.extension.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ]
      },
      {
        "id" : "Extension.extension:service.extension:description",
        "path" : "Extension.extension.extension",
        "sliceName" : "description",
        "short" : "Description",
        "definition" : "Additional description or context about the exclusion",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Extension.extension:service.extension:description.extension",
        "path" : "Extension.extension.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.extension:service.extension:description.url",
        "path" : "Extension.extension.extension.url",
        "fixedUri" : "description"
      },
      {
        "id" : "Extension.extension:service.extension:description.value[x]",
        "path" : "Extension.extension.extension.value[x]",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "Extension.extension:service.url",
        "path" : "Extension.extension.url",
        "fixedUri" : "service"
      },
      {
        "id" : "Extension.extension:service.value[x]",
        "path" : "Extension.extension.value[x]",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://flexpa.com/fhir/sbc/StructureDefinition/excluded-services"
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
