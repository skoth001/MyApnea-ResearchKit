//
//  MyInterestInResearchSurveyTask.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 6/25/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import Foundation
import ResearchKit

public var MyInterestInResearchSurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    // Instructions
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "My Interest in Research Survey"
    instructionStep.text = ""
    steps += [instructionStep]
    
    // How did you hear about MyApnea.Org?
    let referralQuestionStepTitle = "How did you hear about MyApnea.Org?"
    let referralChoices = [
        ORKTextChoice(text: "American Sleep Apnea Association (ASAA)", value: "0"),
        ORKTextChoice(text: "A.W.A.K.E Group", value: "1"),
        ORKTextChoice(text: "CPAP company", value: "2"),
        ORKTextChoice(text: "Personal or family doctor", value: "3"),
        ORKTextChoice(text: "Clinic or hospital", value: "4"),
        ORKTextChoice(text: "CPAP provider", value: "5"),
        ORKTextChoice(text: "Poster or other advertisement", value: "6"),
        ORKTextChoice(text: "Facebook", value: "7"),
        ORKTextChoice(text: "Twitter", value: "8"),
        ORKTextChoice(text: "Family member", value: "9"),
        ORKTextChoice(text: "Friend", value: "10"),
        ORKTextChoice(text: "Internet search", value: "11"),
        ORKTextChoice(text: "Other patient-centered network", value: "12"),
        ORKTextChoice(text: "Other", value: "13")
    ]
    let referralAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: referralChoices)
    let referralQuestionStep = ORKQuestionStep(identifier: "Referral", title: referralQuestionStepTitle, answer: referralAnswerFormat)
    steps += [referralQuestionStep]
    
    // Past participation
    let researchParticipationQuestionStepTitle = "Have you ever taken part in research projects related to your health or the health of a family member?"
    let researchParticipationAnswerFormat = ORKAnswerFormat.booleanAnswerFormat()
    let researchParticipationQuestionStep = ORKQuestionStep(identifier: "ResearchParticipation", title: researchParticipationQuestionStepTitle, answer: researchParticipationAnswerFormat)
    steps += [researchParticipationQuestionStep]
    
    // Contact
    let contactQuestionStepTitle = "How would you prefer to be contacted to learn about potential research studies?"
    let contactChoices = [
        ORKTextChoice(text: "Email", value: "0"),
        ORKTextChoice(text: "Cell phone text messaging", value: "1"),
        ORKTextChoice(text: "Social media (such as Facebook, Twitter, or Pinterest", value: "2"),
        ORKTextChoice(text: "Letter or post card in the mail", value: "3"),
        ORKTextChoice(text: "A computer created phone message", value: "4"),
        ORKTextChoice(text: "Personal phone call from research staff or my doctor", value: "5"),
        ORKTextChoice(text: "Talking face-to-face with research staff or my doctor when I am visiting the clinic", value: "6"),
        ORKTextChoice(text: "Other", value: "7"),
        ORKTextChoice(text: "I am not interested in being contacted about future research studies", value: "8")
    ]
    let contactAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: contactChoices)
    let contactQuestionStep = ORKQuestionStep(identifier: "ContactPreference", title: contactQuestionStepTitle, answer: contactAnswerFormat)
    steps += [contactQuestionStep]
    
    // Study designs
    let studyDesignFormStep = ORKFormStep(identifier: "StudyDesignFormStep", title: "Study Designs", text: "If a researcher was studying a condition or health problem that you cared about, how interested would you be in participating for the following study designs?")
    let studyDesignFormChoices = [
        ORKTextChoice(text: "Not interested", value: "0"),
        ORKTextChoice(text: "Somewhat interested", value: "1"),
        ORKTextChoice(text: "Very interested", value: "2")
    ]
    let studyDesignFormAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: studyDesignFormChoices)
    var studyDesignFormItems = [ORKFormItem]()
    studyDesignFormItems += [ORKFormItem(identifier: "studydesign1", text: "Completing a survey two or more times", answerFormat: studyDesignFormAnswerFormat)]
    studyDesignFormItems += [ORKFormItem(identifier: "studydesign2", text: "Giving a blood sample", answerFormat: studyDesignFormAnswerFormat)]
    studyDesignFormItems += [ORKFormItem(identifier: "studydesign3", text: "Talking by phone or over the internet", answerFormat: studyDesignFormAnswerFormat)]
    studyDesignFormItems += [ORKFormItem(identifier: "studydesign4", text: "Taking a medication", answerFormat: studyDesignFormAnswerFormat)]
    studyDesignFormItems += [ORKFormItem(identifier: "studydesign5", text: "Meeting at a local community center or school", answerFormat: studyDesignFormAnswerFormat)]
    studyDesignFormItems += [ORKFormItem(identifier: "studydesign6", text: "Involving you and other people in your family", answerFormat: studyDesignFormAnswerFormat)]
    studyDesignFormItems += [ORKFormItem(identifier: "studydesign7", text: "Staying in the hospital for 1 or more days", answerFormat: studyDesignFormAnswerFormat)]
    studyDesignFormStep.formItems = studyDesignFormItems
    steps += [studyDesignFormStep]
    
    // Summary
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Congratulations!"
    summaryStep.text = "You have completed the My Interest in Research survey! Thank you for contributing your data. You have been entered into our monthly drawing for a $250 Visa gift card."
    steps += [summaryStep]
    
    
    return ORKOrderedTask(identifier: "MyInterestInResearchSurveyTask", steps: steps)
}