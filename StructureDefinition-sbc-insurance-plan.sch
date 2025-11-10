<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile InsurancePlan
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:InsurancePlan</sch:title>
    <sch:rule context="f:InsurancePlan">
      <sch:assert test="count(f:extension[@url = 'http://flexpa.com/fhir/sbc/StructureDefinition/sbc-metadata']) &lt;= 1">extension with URL = 'http://flexpa.com/fhir/sbc/StructureDefinition/sbc-metadata': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://flexpa.com/fhir/sbc/StructureDefinition/excluded-services']) &lt;= 1">extension with URL = 'http://flexpa.com/fhir/sbc/StructureDefinition/excluded-services': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:status) &gt;= 1">status: minimum cardinality of 'status' is 1</sch:assert>
      <sch:assert test="count(f:name) &gt;= 1">name: minimum cardinality of 'name' is 1</sch:assert>
      <sch:assert test="count(f:period) &gt;= 1">period: minimum cardinality of 'period' is 1</sch:assert>
      <sch:assert test="count(f:ownedBy) &gt;= 1">ownedBy: minimum cardinality of 'ownedBy' is 1</sch:assert>
      <sch:assert test="count(f:contact) &gt;= 1">contact: minimum cardinality of 'contact' is 1</sch:assert>
      <sch:assert test="count(f:coverage) &gt;= 1">coverage: minimum cardinality of 'coverage' is 1</sch:assert>
      <sch:assert test="count(f:plan) &gt;= 1">plan: minimum cardinality of 'plan' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:InsurancePlan/f:plan</sch:title>
    <sch:rule context="f:InsurancePlan/f:plan">
      <sch:assert test="count(f:specificCost) &gt;= 1">specificCost: minimum cardinality of 'specificCost' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:InsurancePlan/f:plan/f:specificCost</sch:title>
    <sch:rule context="f:InsurancePlan/f:plan/f:specificCost">
      <sch:assert test="count(f:benefit) &gt;= 1">benefit: minimum cardinality of 'benefit' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:InsurancePlan/f:plan/f:specificCost/f:benefit</sch:title>
    <sch:rule context="f:InsurancePlan/f:plan/f:specificCost/f:benefit">
      <sch:assert test="count(f:cost) &gt;= 2">cost: minimum cardinality of 'cost' is 2</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:InsurancePlan/f:plan/f:specificCost/f:benefit/f:cost</sch:title>
    <sch:rule context="f:InsurancePlan/f:plan/f:specificCost/f:benefit/f:cost">
      <sch:assert test="count(f:applicability) &gt;= 1">applicability: minimum cardinality of 'applicability' is 1</sch:assert>
      <sch:assert test="count(f:value) &gt;= 1">value: minimum cardinality of 'value' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
