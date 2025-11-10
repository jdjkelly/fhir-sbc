# Example Health Insurance Issuer - Summary of Benefits and Coverage (SBC) FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Health Insurance Issuer**

## Example Organization: Example Health Insurance Issuer

**name**: Sample Health Insurance Company

**telecom**: ph: 1-800-123-4567, [https://www.samplehealth.com](https://www.samplehealth.com)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "ExampleIssuerOrg",
  "name" : "Sample Health Insurance Company",
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
}

```
