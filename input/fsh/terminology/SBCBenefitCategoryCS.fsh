CodeSystem: SBCBenefitCategoryCS
Id: sbc-benefit-category
Title: "SBC Benefit Category Code System"
Description: "Code system for the 30 benefit service rows required in Summary of Benefits and Coverage (SBC) documents per ACA Section 2715 regulations"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

// If you visit a health care provider's office or clinic
* #primary-care-visit "Primary Care Visit to Treat an Injury or Illness" "Visits to primary care physicians to treat illness or injury"
* #specialist-visit "Specialist Visit" "Visits to specialist physicians"
* #preventive-care "Preventive Care/Screening/Immunization" "Preventive care services, health screenings, and immunizations"

// If you have a test
* #diagnostic-test "Diagnostic Test (X-ray, Blood Work)" "X-rays, blood work, and other diagnostic tests"
* #imaging "Imaging (CT/PET Scans, MRIs)" "Advanced imaging services including CT scans, PET scans, and MRIs"

// If you need drugs to treat your illness or condition
* #generic-drugs "Generic Drugs" "Generic prescription medications"
* #preferred-brand-drugs "Preferred Brand Drugs" "Brand-name prescription medications on the preferred drug list"
* #non-preferred-brand-drugs "Non-Preferred Brand Drugs" "Brand-name prescription medications not on the preferred drug list"
* #specialty-drugs "Specialty Drugs" "High-cost or specialty prescription medications"

// If you have outpatient surgery
* #outpatient-facility-fee "Facility Fee (e.g., Ambulatory Surgery Center)" "Facility charges for outpatient surgery"
* #outpatient-physician-fee "Physician/Surgeon Fees (Outpatient Surgery)" "Professional fees for physicians and surgeons for outpatient surgery"

// If you need immediate medical attention
* #emergency-room-care "Emergency Room Care" "Emergency department services"
* #emergency-medical-transport "Emergency Medical Transportation" "Ambulance and emergency medical transport services"
* #urgent-care "Urgent Care" "Urgent care facility services"

// If you have a hospital stay
* #hospital-facility-fee "Facility Fee (e.g., Hospital Room)" "Facility charges for hospital inpatient stays"
* #hospital-physician-fee "Physician/Surgeon Fees (Hospital Stay)" "Professional fees for physicians and surgeons during hospital stays"

// If you need mental health, behavioral health, or substance abuse services
* #mental-health-outpatient "Mental/Behavioral Health Outpatient Services" "Outpatient mental health and substance abuse services"
* #mental-health-inpatient "Mental/Behavioral Health Inpatient Services" "Inpatient mental health and substance abuse services"

// If you are pregnant
* #pregnancy-office-visits "Office Visits (Pregnancy)" "Prenatal and postnatal office visits"
* #pregnancy-delivery-professional "Childbirth/Delivery Professional Services" "Professional services for childbirth and delivery"
* #pregnancy-delivery-facility "Childbirth/Delivery Facility Services" "Facility services for childbirth and delivery"

// If you need help recovering or have other special health needs
* #home-health-care "Home Health Care" "Home health care services"
* #rehabilitation "Rehabilitation Services" "Outpatient physical, occupational, and speech therapy"
* #habilitation "Habilitation Services" "Health care services that help develop or maintain daily living skills"
* #skilled-nursing "Skilled Nursing Care" "Skilled nursing facility services"
* #durable-medical-equipment "Durable Medical Equipment" "Medical equipment for home use such as wheelchairs, oxygen equipment"
* #hospice "Hospice Services" "End-of-life care services"

// If your child needs dental or eye care
* #children-eye-exam "Children's Eye Exam" "Eye examinations for children"
* #children-glasses "Children's Glasses" "Eyeglasses for children"
* #children-dental "Children's Dental Check-up" "Routine dental care for children"
