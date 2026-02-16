# SBC Benefit Category Code System - Summary of Benefits and Coverage (SBC) FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SBC Benefit Category Code System**

## CodeSystem: SBC Benefit Category Code System 

| | |
| :--- | :--- |
| *Official URL*:http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category | *Version*:0.1.0 |
| Draft as of 2026-02-16 | *Computable Name*:SBCBenefitCategoryCS |

 
Code system for the 30 benefit service rows required in Summary of Benefits and Coverage (SBC) documents per ACA Section 2715 regulations 

 This Code system is referenced in the content logical definition of the following value sets: 

* [SBCBenefitCategoryVS](ValueSet-sbc-benefit-category.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "sbc-benefit-category",
  "url" : "http://flexpa.com/fhir/sbc/CodeSystem/sbc-benefit-category",
  "version" : "0.1.0",
  "name" : "SBCBenefitCategoryCS",
  "title" : "SBC Benefit Category Code System",
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
  "description" : "Code system for the 30 benefit service rows required in Summary of Benefits and Coverage (SBC) documents per ACA Section 2715 regulations",
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
  "count" : 30,
  "concept" : [
    {
      "code" : "primary-care-visit",
      "display" : "Primary Care Visit to Treat an Injury or Illness",
      "definition" : "Visits to primary care physicians to treat illness or injury"
    },
    {
      "code" : "specialist-visit",
      "display" : "Specialist Visit",
      "definition" : "Visits to specialist physicians"
    },
    {
      "code" : "preventive-care",
      "display" : "Preventive Care/Screening/Immunization",
      "definition" : "Preventive care services, health screenings, and immunizations"
    },
    {
      "code" : "diagnostic-test",
      "display" : "Diagnostic Test (X-ray, Blood Work)",
      "definition" : "X-rays, blood work, and other diagnostic tests"
    },
    {
      "code" : "imaging",
      "display" : "Imaging (CT/PET Scans, MRIs)",
      "definition" : "Advanced imaging services including CT scans, PET scans, and MRIs"
    },
    {
      "code" : "generic-drugs",
      "display" : "Generic Drugs",
      "definition" : "Generic prescription medications"
    },
    {
      "code" : "preferred-brand-drugs",
      "display" : "Preferred Brand Drugs",
      "definition" : "Brand-name prescription medications on the preferred drug list"
    },
    {
      "code" : "non-preferred-brand-drugs",
      "display" : "Non-Preferred Brand Drugs",
      "definition" : "Brand-name prescription medications not on the preferred drug list"
    },
    {
      "code" : "specialty-drugs",
      "display" : "Specialty Drugs",
      "definition" : "High-cost or specialty prescription medications"
    },
    {
      "code" : "outpatient-facility-fee",
      "display" : "Facility Fee (e.g., Ambulatory Surgery Center)",
      "definition" : "Facility charges for outpatient surgery"
    },
    {
      "code" : "outpatient-physician-fee",
      "display" : "Physician/Surgeon Fees (Outpatient Surgery)",
      "definition" : "Professional fees for physicians and surgeons for outpatient surgery"
    },
    {
      "code" : "emergency-room-care",
      "display" : "Emergency Room Care",
      "definition" : "Emergency department services"
    },
    {
      "code" : "emergency-medical-transport",
      "display" : "Emergency Medical Transportation",
      "definition" : "Ambulance and emergency medical transport services"
    },
    {
      "code" : "urgent-care",
      "display" : "Urgent Care",
      "definition" : "Urgent care facility services"
    },
    {
      "code" : "hospital-facility-fee",
      "display" : "Facility Fee (e.g., Hospital Room)",
      "definition" : "Facility charges for hospital inpatient stays"
    },
    {
      "code" : "hospital-physician-fee",
      "display" : "Physician/Surgeon Fees (Hospital Stay)",
      "definition" : "Professional fees for physicians and surgeons during hospital stays"
    },
    {
      "code" : "mental-health-outpatient",
      "display" : "Mental/Behavioral Health Outpatient Services",
      "definition" : "Outpatient mental health and substance abuse services"
    },
    {
      "code" : "mental-health-inpatient",
      "display" : "Mental/Behavioral Health Inpatient Services",
      "definition" : "Inpatient mental health and substance abuse services"
    },
    {
      "code" : "pregnancy-office-visits",
      "display" : "Office Visits (Pregnancy)",
      "definition" : "Prenatal and postnatal office visits"
    },
    {
      "code" : "pregnancy-delivery-professional",
      "display" : "Childbirth/Delivery Professional Services",
      "definition" : "Professional services for childbirth and delivery"
    },
    {
      "code" : "pregnancy-delivery-facility",
      "display" : "Childbirth/Delivery Facility Services",
      "definition" : "Facility services for childbirth and delivery"
    },
    {
      "code" : "home-health-care",
      "display" : "Home Health Care",
      "definition" : "Home health care services"
    },
    {
      "code" : "rehabilitation",
      "display" : "Rehabilitation Services",
      "definition" : "Outpatient physical, occupational, and speech therapy"
    },
    {
      "code" : "habilitation",
      "display" : "Habilitation Services",
      "definition" : "Health care services that help develop or maintain daily living skills"
    },
    {
      "code" : "skilled-nursing",
      "display" : "Skilled Nursing Care",
      "definition" : "Skilled nursing facility services"
    },
    {
      "code" : "durable-medical-equipment",
      "display" : "Durable Medical Equipment",
      "definition" : "Medical equipment for home use such as wheelchairs, oxygen equipment"
    },
    {
      "code" : "hospice",
      "display" : "Hospice Services",
      "definition" : "End-of-life care services"
    },
    {
      "code" : "children-eye-exam",
      "display" : "Children's Eye Exam",
      "definition" : "Eye examinations for children"
    },
    {
      "code" : "children-glasses",
      "display" : "Children's Glasses",
      "definition" : "Eyeglasses for children"
    },
    {
      "code" : "children-dental",
      "display" : "Children's Dental Check-up",
      "definition" : "Routine dental care for children"
    }
  ]
}

```
