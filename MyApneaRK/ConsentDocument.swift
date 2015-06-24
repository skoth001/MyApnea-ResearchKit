//
//  ConsentDocument.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 6/24/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import Foundation
import ResearchKit

public var ConsentDocument: ORKConsentDocument {
    let consentDocument = ORKConsentDocument()
    consentDocument.title = "MyApnea.Org Consent"
    
    let consentSectionTypes: [ORKConsentSectionType] = [
        .Overview,
        .DataGathering,
        .Privacy,
        .DataUse,
        .TimeCommitment,
        .Withdrawing
    ]
    
    var sections = [ORKConsentSection]()
    
    let overviewSection = ORKConsentSection(type: ORKConsentSectionType.Overview)
    overviewSection.summary = "The MyApnea.Org research page is a part of a medical research study across the U.S. It is paid for by the Patient-Centered Outcomes Research Institute (PCORI). Any page within MyApnea.Org that reads Research at the top indicates that information shared on that page can be used for research purposes as we describe in detail below. Research pages are only accessible after you have read this consent form and agree to participate in the research portal. The study is led by groups of doctors, patients and other advocacy groups working together."
    overviewSection.content = "Dr. Susan Redline from Brigham and Women's Hospital in Boston, MA is in charge of the study. She and her staff are available to answer any questions you may have. Please email support@myapnea.org with any questions or call 617-732-5859. Research studies include only people who want to take part. Please take your time to make your decision about participating, and discuss your decision with your family or friends if you wish. "
    sections += [overviewSection]
    
    let dataGatheringSection = ORKConsentSection(type: ORKConsentSectionType.DataGathering)
    dataGatheringSection.summary = "Here is a brief overview of what we promise to you as researchers and what we will ask of you as a research participant: Tell us about your health. Answer our health-related questions as best as you can. Update your information regularly (we'll remind you) so we have all your latest data. Stick around. We'd like you to be in the study for at least 2 years so we know how your health changes over time."
    dataGatheringSection.content = "We will: Make things easy for you. Surveys can be done in 5-minute blocks on your computer, tablet or smartphone. Respect your time and privacy. We will only contact you when necessary and assure that your data is extremely secure. Provide a community and tools you can use. We will build useful tools to help you manage your condition and provide a community where you can be supported."
    sections += [dataGatheringSection]
    
    let privacySection = ORKConsentSection(type: ORKConsentSectionType.Privacy)
    privacySection.summary = "MyApnea.Org follows the security guidelines of the U.S. Health Insurance Portability and Accountability Act of 1996 (HIPAA). All study data is sent, stored, and processed in a secure environment. We are required by the Health Insurance Portability and Accountability Act (HIPAA) to protect the privacy of health information obtained for research. This is an abbreviated notice, and does not describe all details of this requirement - see Partners Privacy Notice. During this study, identifiable information about you or your health will be collected and shared with the researchers conducting the research. In general, under federal law, identifiable health information is private. However, there are exceptions to this rule. In some cases, others may see your identifiable health information for purposes of research oversight, quality control, public health and safety, or law enforcement. We share your health information only when we must, and we ask anyone who receives it from us to protect your privacy."
    privacySection.content = "The Partners HealthCare Research IT Facilities Security Center will host the data for MyApnea.Org. All study information will be stored on secure network servers. Data and the web portal will be housed on the Partners HealthCare Research Computing Cloud Infrastructure. The Discovery Information Platform for Research (DIPR) provides a set of virtual services within the Partners HealthCare secure data center and within the Partners HealthCare network. All systems are secured behind the Partners HealthCare firewall and follow Partners HealthCare Information Security policies for authenticated, minimum access. All systems are patched, monitored and scanned routinely for vulnerabilities and intrusions by the systems administrator and PHS Information Security. Data is encrypted, where applicable, in compliance with state and federal government standards, regulations, and in accordance with Partners Security and Privacy policies. The web server and database server are hosted within the Partners Firewall, and make use of standard 256-bit encryption connection ciphers."
    sections += [privacySection]
    
    let dataUseSection = ORKConsentSection(type: ORKConsentSectionType.DataUse)
    dataUseSection.summary = "We collect information about you, your health, and some of your behaviors. This information will be used in research and will be presented in scientific conferences and published in scientific journals. These presentations and publications will never show any information that identifies you or any other individual in the study. We will share summary information that does not contain any identifying information with other participants in the network, which include members of the National Patient Centered Outcomes Network and research partners in MyApnea.Org. While we think that there are only minimal risks associated with sharing research results, we cannot predict how this information might be used in the future. We take many safety measures to protect your privacy, but we cannot guarantee that your identity will never be known."
    dataUseSection.content = "You will be able to see some of your study information and summary information provided by other members in MyApnea.Org. When you register for MyApnea.Org you provide us with a username and a password. You can use this to sign into the study and see your Dashboard and some of the health information you've provided to us (e.g., your sleep surveys and health profile). Some of this information will be displayed in summary form and shown in relationship to summary information provided by other members of MyApnea.Org. You should be very careful not to provide your login information to anyone else. If you are worried that someone else may be using your login information, please let us know immediately, or change your password yourself through the My Account Setting page."
    sections += [dataUseSection]
    
    let timeCommitmentSection = ORKConsentSection(type: ORKConsentSectionType.TimeCommitment)
    timeCommitmentSection.summary = "The surveys will be very quick to complete, but it is our hope that you stick around and join our community."
    timeCommitmentSection.content = "The community at MyApnea.Org offers additional features. These include a supportive community, discussion forums, the ability to connect with researchers and care providers, and the chance to help direct the future of sleep apnea research."
    sections += [timeCommitmentSection]
    
    let withdrawingSection = ORKConsentSection(type: ORKConsentSectionType.Withdrawing)
    withdrawingSection.summary = "You can withdraw at any point and stop contributing your information. Previously supplied data will be kept in our database."
    withdrawingSection.content = "Simply send us an email at support@myapnea.org"
    sections += [withdrawingSection]
    
    consentDocument.sections = sections
    
    consentDocument.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature"))
    
    return consentDocument
}