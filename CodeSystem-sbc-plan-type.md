# SBC Plan Type Code System - Summary of Benefits and Coverage (SBC) FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SBC Plan Type Code System**

## CodeSystem: SBC Plan Type Code System 

| | |
| :--- | :--- |
| *Official URL*:http://flexpa.com/fhir/sbc/CodeSystem/sbc-plan-type | *Version*:0.1.0 |
| Draft as of 2026-02-16 | *Computable Name*:SBCPlanTypeCS |

 
Code system for health insurance plan types displayed in Summary of Benefits and Coverage documents 

 This Code system is referenced in the content logical definition of the following value sets: 

* [SBCPlanTypeVS](ValueSet-sbc-plan-type.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "sbc-plan-type",
  "url" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-plan-type",
  "version" : "0.1.0",
  "name" : "SBCPlanTypeCS",
  "title" : "SBC Plan Type Code System",
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
  "description" : "Code system for health insurance plan types displayed in Summary of Benefits and Coverage documents",
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
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 6,
  "concept" : [
    {
      "code" : "HMO",
      "display" : "Health Maintenance Organization (HMO)",
      "definition" : "A type of health insurance plan that requires members to get health care services from doctors and hospitals in the plan's network, except in an emergency"
    },
    {
      "code" : "PPO",
      "display" : "Preferred Provider Organization (PPO)",
      "definition" : "A type of health insurance plan where members pay less if they use providers in the plan's network, but can use out-of-network providers at higher cost"
    },
    {
      "code" : "POS",
      "display" : "Point of Service (POS)",
      "definition" : "A type of health insurance plan where members pay less if they use doctors and hospitals in the plan's network and choose a primary care doctor to coordinate care"
    },
    {
      "code" : "EPO",
      "display" : "Exclusive Provider Organization (EPO)",
      "definition" : "A type of health insurance plan where services are covered only if members use doctors and providers in the plan's network, except in an emergency"
    },
    {
      "code" : "HDHP",
      "display" : "High Deductible Health Plan (HDHP)",
      "definition" : "A health insurance plan with a higher deductible than traditional plans, often paired with a Health Savings Account"
    },
    {
      "code" : "INDEMNITY",
      "display" : "Indemnity Plan",
      "definition" : "A type of health insurance that allows members to see any doctor or hospital and pays a portion of the bill"
    }
  ]
}

```
