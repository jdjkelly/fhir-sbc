# SBC Benefit Category Value Set - Summary of Benefits and Coverage (SBC) FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SBC Benefit Category Value Set**

## ValueSet: SBC Benefit Category Value Set 

| | |
| :--- | :--- |
| *Official URL*:http://flexpa.com/fhir/sbc/ValueSet/sbc-benefit-category | *Version*:0.1.0 |
| Draft as of 2026-02-16 | *Computable Name*:SBCBenefitCategoryVS |

 
Value set containing all 30 benefit service categories required in Summary of Benefits and Coverage (SBC) documents 

 **References** 

* [SBC Insurance Plan Profile](StructureDefinition-sbc-insurance-plan.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "sbc-benefit-category",
  "url" : "http://flexpa.com/fhir/sbc/ValueSet/sbc-benefit-category",
  "version" : "0.1.0",
  "name" : "SBCBenefitCategoryVS",
  "title" : "SBC Benefit Category Value Set",
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
  "description" : "Value set containing all 30 benefit service categories required in Summary of Benefits and Coverage (SBC) documents",
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
  "compose" : {
    "include" : [
      {
        "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category"
      }
    ]
  }
}

```
