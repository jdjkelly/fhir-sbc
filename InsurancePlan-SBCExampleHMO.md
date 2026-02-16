# Example SBC - Sample HMO Health Plan - Summary of Benefits and Coverage (SBC) FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example SBC - Sample HMO Health Plan**

## Example InsurancePlan: Example SBC - Sample HMO Health Plan

Profile: [SBC Insurance Plan Profile](StructureDefinition-sbc-insurance-plan.md)

> **SBC Metadata Extension**
* sbcVersionDate: 2021-01-01
* minimumEssentialCoverage: true
* minimumValue: true

> **Excluded Services Extension****serviceType**: Cosmetic surgery**description**: Services for cosmetic purposes are not covered
> **url**service
**serviceType**: Weight loss programs**description**: Weight loss programs except when medically necessary
> **url**service

**identifier**: `https://www.cms.gov/CCIIO/Resources/Data-Resources/hios`/12345CA001000101

**status**: Active

**name**: Sample Health HMO Gold Plan

**period**: 2025-01-01 --> 2025-12-31

**ownedBy**: [Sample Health Insurance Company](Organization-ExampleIssuerOrg.md)

**administeredBy**: [Organization Sample Health Insurance Company](Organization-ExampleIssuerOrg.md)

> **contact****purpose**: General Questions**telecom**: ph: 1-800-123-4567, [https://www.samplehealth.com](https://www.samplehealth.com)

> **contact****purpose**: Uniform Glossary**telecom**: [https://www.healthcare.gov/sbc-glossary/](https://www.healthcare.gov/sbc-glossary/)

> **coverage****type**: health insurance plan policy
> **benefit****type**: Preventive Care/Screening/Immunization**requirement**: No prior authorization required for in-network preventive services

> **benefit****type**: Primary Care Visit to Treat an Injury or Illness**requirement**: No referral required

> **benefit****Benefit Limitation Extension**: Limited to network specialists only; out-of-network not covered except in emergencies**type**: Specialist Visit**requirement**: Referral required from primary care physician

> **benefit****Benefit Limitation Extension**: Copay waived if admitted to hospital**type**: Emergency Room Care

> **benefit****type**: Generic Drugs

> **benefit****type**: Facility Fee (e.g., Hospital Room)**requirement**: Prior authorization required for non-emergency admissions

> **plan****type**: Health Maintenance Organization (HMO)
> **generalCost****type**: Individual Deductible

### Costs

| | | |
| :--- | :--- | :--- |
| - | **Value** | **Currency** |
| * | 1500 | United States dollar |

**comment**: Individual in-network deductible

> **generalCost****type**: Family Deductible

### Costs

| | | |
| :--- | :--- | :--- |
| - | **Value** | **Currency** |
| * | 3000 | United States dollar |


> **generalCost****type**: Individual Out-of-Pocket Maximum

### Costs

| | | |
| :--- | :--- | :--- |
| - | **Value** | **Currency** |
| * | 6000 | United States dollar |


> **generalCost****type**: Family Out-of-Pocket Maximum

### Costs

| | | |
| :--- | :--- | :--- |
| - | **Value** | **Currency** |
| * | 12000 | United States dollar |


> **specificCost****category**: Preventive Care/Screening/Immunization
> **benefit****type**: Preventive Care/Screening/Immunization
> **cost****type**: No charge**applicability**: In Network**value**: 0 USD

> **cost****type**: Not covered**applicability**: Out of Network**value**: 0 USD


> **specificCost****category**: Primary Care Visit to Treat an Injury or Illness
> **benefit****type**: Primary Care Visit to Treat an Injury or Illness
> **cost****type**: Copayment**applicability**: In Network**value**: 25 USD

> **cost****type**: Not covered**applicability**: Out of Network**value**: 0 USD


> **specificCost****category**: Specialist Visit
> **benefit****type**: Specialist Visit
> **cost****type**: Copayment**applicability**: In Network**value**: 50 USD

> **cost****type**: Not covered**applicability**: Out of Network**value**: 0 USD


> **specificCost****category**: Emergency Room Care
> **benefit****Benefit Limitation Extension**: Copay waived if admitted**type**: Emergency Room Care
> **cost****type**: Copayment**applicability**: In Network**value**: 350 USD

> **cost****type**: Copayment**applicability**: Out of Network**value**: 350 USD


> **specificCost****category**: Generic Drugs
> **benefit****type**: Generic Drugs
> **cost****type**: Copayment**applicability**: In Network**value**: 10 USD

> **cost****type**: Not covered**applicability**: Out of Network**value**: 0 USD


> **specificCost****category**: Facility Fee (e.g., Hospital Room)
> **benefit****Benefit Limitation Extension**: Prior authorization required**type**: Facility Fee (e.g., Hospital Room)
> **cost****type**: Coinsurance**applicability**: In Network**value**: 20 %

> **cost****type**: Not covered**applicability**: Out of Network**value**: 0 %





## Resource Content

```json
{
  "resourceType" : "InsurancePlan",
  "id" : "SBCExampleHMO",
  "meta" : {
    "profile" : [
      "http://flexpa.com/fhir/sbc/StructureDefinition/sbc-insurance-plan"
    ]
  },
  "extension" : [
    {
      "extension" : [
        {
          "url" : "sbcVersionDate",
          "valueDate" : "2021-01-01"
        },
        {
          "url" : "minimumEssentialCoverage",
          "valueBoolean" : true
        },
        {
          "url" : "minimumValue",
          "valueBoolean" : true
        }
      ],
      "url" : "http://flexpa.com/fhir/sbc/StructureDefinition/sbc-metadata"
    },
    {
      "extension" : [
        {
          "extension" : [
            {
              "url" : "serviceType",
              "valueCodeableConcept" : {
                "text" : "Cosmetic surgery"
              }
            },
            {
              "url" : "description",
              "valueString" : "Services for cosmetic purposes are not covered"
            }
          ],
          "url" : "service"
        },
        {
          "extension" : [
            {
              "url" : "serviceType",
              "valueCodeableConcept" : {
                "text" : "Weight loss programs"
              }
            },
            {
              "url" : "description",
              "valueString" : "Weight loss programs except when medically necessary"
            }
          ],
          "url" : "service"
        }
      ],
      "url" : "http://flexpa.com/fhir/sbc/StructureDefinition/excluded-services"
    }
  ],
  "identifier" : [
    {
      "system" : "https://www.cms.gov/CCIIO/Resources/Data-Resources/hios",
      "value" : "12345CA001000101"
    }
  ],
  "status" : "active",
  "name" : "Sample Health HMO Gold Plan",
  "period" : {
    "start" : "2025-01-01",
    "end" : "2025-12-31"
  },
  "ownedBy" : {
    "reference" : "Organization/ExampleIssuerOrg",
    "display" : "Sample Health Insurance Company"
  },
  "administeredBy" : {
    "reference" : "Organization/ExampleIssuerOrg"
  },
  "contact" : [
    {
      "purpose" : {
        "text" : "General Questions"
      },
      "telecom" : [
        {
          "system" : "phone",
          "value" : "1-800-123-4567"
        },
        {
          "system" : "url",
          "value" : "https://www.samplehealth.com"
        }
      ]
    },
    {
      "purpose" : {
        "text" : "Uniform Glossary"
      },
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.healthcare.gov/sbc-glossary/"
        }
      ]
    }
  ],
  "coverage" : [
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
            "code" : "HIP",
            "display" : "health insurance plan policy"
          }
        ]
      },
      "benefit" : [
        {
          "type" : {
            "coding" : [
              {
                "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
                "code" : "preventive-care"
              }
            ]
          },
          "requirement" : "No prior authorization required for in-network preventive services"
        },
        {
          "type" : {
            "coding" : [
              {
                "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
                "code" : "primary-care-visit"
              }
            ]
          },
          "requirement" : "No referral required"
        },
        {
          "extension" : [
            {
              "url" : "http://flexpa.com/fhir/sbc/StructureDefinition/benefit-limitation",
              "valueString" : "Limited to network specialists only; out-of-network not covered except in emergencies"
            }
          ],
          "type" : {
            "coding" : [
              {
                "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
                "code" : "specialist-visit"
              }
            ]
          },
          "requirement" : "Referral required from primary care physician"
        },
        {
          "extension" : [
            {
              "url" : "http://flexpa.com/fhir/sbc/StructureDefinition/benefit-limitation",
              "valueString" : "Copay waived if admitted to hospital"
            }
          ],
          "type" : {
            "coding" : [
              {
                "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
                "code" : "emergency-room-care"
              }
            ]
          }
        },
        {
          "type" : {
            "coding" : [
              {
                "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
                "code" : "generic-drugs"
              }
            ]
          }
        },
        {
          "type" : {
            "coding" : [
              {
                "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
                "code" : "hospital-facility-fee"
              }
            ]
          },
          "requirement" : "Prior authorization required for non-emergency admissions"
        }
      ]
    }
  ],
  "plan" : [
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-plan-type",
            "code" : "HMO"
          }
        ]
      },
      "generalCost" : [
        {
          "type" : {
            "text" : "Individual Deductible"
          },
          "cost" : {
            "value" : 1500,
            "currency" : "USD"
          },
          "comment" : "Individual in-network deductible"
        },
        {
          "type" : {
            "text" : "Family Deductible"
          },
          "cost" : {
            "value" : 3000,
            "currency" : "USD"
          }
        },
        {
          "type" : {
            "text" : "Individual Out-of-Pocket Maximum"
          },
          "cost" : {
            "value" : 6000,
            "currency" : "USD"
          }
        },
        {
          "type" : {
            "text" : "Family Out-of-Pocket Maximum"
          },
          "cost" : {
            "value" : 12000,
            "currency" : "USD"
          }
        }
      ],
      "specificCost" : [
        {
          "category" : {
            "coding" : [
              {
                "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
                "code" : "preventive-care"
              }
            ]
          },
          "benefit" : [
            {
              "type" : {
                "coding" : [
                  {
                    "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
                    "code" : "preventive-care"
                  }
                ]
              },
              "cost" : [
                {
                  "type" : {
                    "text" : "No charge"
                  },
                  "applicability" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/applicability",
                        "code" : "in-network",
                        "display" : "In Network"
                      }
                    ]
                  },
                  "value" : {
                    "value" : 0,
                    "unit" : "USD"
                  }
                },
                {
                  "type" : {
                    "text" : "Not covered"
                  },
                  "applicability" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/applicability",
                        "code" : "out-of-network",
                        "display" : "Out of Network"
                      }
                    ]
                  },
                  "value" : {
                    "value" : 0,
                    "unit" : "USD"
                  }
                }
              ]
            }
          ]
        },
        {
          "category" : {
            "coding" : [
              {
                "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
                "code" : "primary-care-visit"
              }
            ]
          },
          "benefit" : [
            {
              "type" : {
                "coding" : [
                  {
                    "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
                    "code" : "primary-care-visit"
                  }
                ]
              },
              "cost" : [
                {
                  "type" : {
                    "text" : "Copayment"
                  },
                  "applicability" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/applicability",
                        "code" : "in-network",
                        "display" : "In Network"
                      }
                    ]
                  },
                  "value" : {
                    "value" : 25,
                    "unit" : "USD"
                  }
                },
                {
                  "type" : {
                    "text" : "Not covered"
                  },
                  "applicability" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/applicability",
                        "code" : "out-of-network",
                        "display" : "Out of Network"
                      }
                    ]
                  },
                  "value" : {
                    "value" : 0,
                    "unit" : "USD"
                  }
                }
              ]
            }
          ]
        },
        {
          "category" : {
            "coding" : [
              {
                "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
                "code" : "specialist-visit"
              }
            ]
          },
          "benefit" : [
            {
              "type" : {
                "coding" : [
                  {
                    "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
                    "code" : "specialist-visit"
                  }
                ]
              },
              "cost" : [
                {
                  "type" : {
                    "text" : "Copayment"
                  },
                  "applicability" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/applicability",
                        "code" : "in-network",
                        "display" : "In Network"
                      }
                    ]
                  },
                  "value" : {
                    "value" : 50,
                    "unit" : "USD"
                  }
                },
                {
                  "type" : {
                    "text" : "Not covered"
                  },
                  "applicability" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/applicability",
                        "code" : "out-of-network",
                        "display" : "Out of Network"
                      }
                    ]
                  },
                  "value" : {
                    "value" : 0,
                    "unit" : "USD"
                  }
                }
              ]
            }
          ]
        },
        {
          "category" : {
            "coding" : [
              {
                "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
                "code" : "emergency-room-care"
              }
            ]
          },
          "benefit" : [
            {
              "extension" : [
                {
                  "url" : "http://flexpa.com/fhir/sbc/StructureDefinition/benefit-limitation",
                  "valueString" : "Copay waived if admitted"
                }
              ],
              "type" : {
                "coding" : [
                  {
                    "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
                    "code" : "emergency-room-care"
                  }
                ]
              },
              "cost" : [
                {
                  "type" : {
                    "text" : "Copayment"
                  },
                  "applicability" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/applicability",
                        "code" : "in-network",
                        "display" : "In Network"
                      }
                    ]
                  },
                  "value" : {
                    "value" : 350,
                    "unit" : "USD"
                  }
                },
                {
                  "type" : {
                    "text" : "Copayment"
                  },
                  "applicability" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/applicability",
                        "code" : "out-of-network",
                        "display" : "Out of Network"
                      }
                    ]
                  },
                  "value" : {
                    "value" : 350,
                    "unit" : "USD"
                  }
                }
              ]
            }
          ]
        },
        {
          "category" : {
            "coding" : [
              {
                "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
                "code" : "generic-drugs"
              }
            ]
          },
          "benefit" : [
            {
              "type" : {
                "coding" : [
                  {
                    "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
                    "code" : "generic-drugs"
                  }
                ]
              },
              "cost" : [
                {
                  "type" : {
                    "text" : "Copayment"
                  },
                  "applicability" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/applicability",
                        "code" : "in-network",
                        "display" : "In Network"
                      }
                    ]
                  },
                  "value" : {
                    "value" : 10,
                    "unit" : "USD"
                  }
                },
                {
                  "type" : {
                    "text" : "Not covered"
                  },
                  "applicability" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/applicability",
                        "code" : "out-of-network",
                        "display" : "Out of Network"
                      }
                    ]
                  },
                  "value" : {
                    "value" : 0,
                    "unit" : "USD"
                  }
                }
              ]
            }
          ]
        },
        {
          "category" : {
            "coding" : [
              {
                "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
                "code" : "hospital-facility-fee"
              }
            ]
          },
          "benefit" : [
            {
              "extension" : [
                {
                  "url" : "http://flexpa.com/fhir/sbc/StructureDefinition/benefit-limitation",
                  "valueString" : "Prior authorization required"
                }
              ],
              "type" : {
                "coding" : [
                  {
                    "system" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
                    "code" : "hospital-facility-fee"
                  }
                ]
              },
              "cost" : [
                {
                  "type" : {
                    "text" : "Coinsurance"
                  },
                  "applicability" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/applicability",
                        "code" : "in-network",
                        "display" : "In Network"
                      }
                    ]
                  },
                  "value" : {
                    "value" : 20,
                    "unit" : "%"
                  }
                },
                {
                  "type" : {
                    "text" : "Not covered"
                  },
                  "applicability" : {
                    "coding" : [
                      {
                        "system" : "http://terminology.hl7.org/CodeSystem/applicability",
                        "code" : "out-of-network",
                        "display" : "Out of Network"
                      }
                    ]
                  },
                  "value" : {
                    "value" : 0,
                    "unit" : "%"
                  }
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}

```
