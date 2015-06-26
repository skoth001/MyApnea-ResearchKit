//
//  MySleepApneaTreatmentSurveyTask.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 6/25/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import Foundation
import ResearchKit

public var MySleepApneaTreatmentSurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    // Instructions
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "My Sleep Apnea Treatment Survey"
    instructionStep.text = ""
    steps += [instructionStep]
    
    // Current treatments
    let currentTreatmentsQuestionStepTitle = "What treatment(s) are you currently using for your sleep apnea?"
    let currentTreatmentsChoices = [
        ORKTextChoice(text: "Never been treated", value: "0"),
        ORKTextChoice(text: "Continuous Positive Airway Pressure machine (CPAP)", value: "1"),
        ORKTextChoice(text: "Auto Positive Airway Pressure machine (APAP)", value: "2"),
        ORKTextChoice(text: "Bi-level Positive Airway Pressure machine (BiPAP)", value: "3"),
        ORKTextChoice(text: "Adaptive Servo-Ventilation (ASV)", value: "4"),
        ORKTextChoice(text: "Oral appliance", value: "5"),
        ORKTextChoice(text: "Behavioral therapy", value: "6"),
        ORKTextChoice(text: "Tongue stimulation", value: "7"),
        ORKTextChoice(text: "Tonsillectomy (removal of tonsils)", value: "8"),
        ORKTextChoice(text: "UPPP (removal of palate and other tissue from the mouth)", value: "9"),
        ORKTextChoice(text: "Nasal deviation surgery", value: "10"),
        ORKTextChoice(text: "Tongue surgery", value: "11"),
        ORKTextChoice(text: "Jaw surgery", value: "12"),
        ORKTextChoice(text: "Bariatric surgery", value: "13")
    ]
    let currentTreatmentsAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: currentTreatmentsChoices)
    let currentTreatmentsQuestionStep = ORKQuestionStep(identifier: "CurrentTreatments", title: currentTreatmentsQuestionStepTitle, answer: currentTreatmentsAnswerFormat)
    steps += [currentTreatmentsQuestionStep]
    
    // Treatment satisfaction
    var satisfactionFormStep = ORKFormStep(identifier: "TreatmentSatisfaction", title: "Treatment Satisfaction", text: "Considering all past and present treatments that you have had, how satisfied were you with each treatment?")
    let satisfactionChoices = [
        ORKTextChoice(text: "Very dissatisfied", value: "0"),
        ORKTextChoice(text: "Dissatisfied", value: "1"),
        ORKTextChoice(text: "Satisfied", value: "2"),
        ORKTextChoice(text: "Very satisfied", value: "3"),
        ORKTextChoice(text: "Never used", value: "4")
    ]
    let satisfactionFormAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: satisfactionChoices)
    var satisfactionFormItems = [ORKFormItem]()
    satisfactionFormItems += [ORKFormItem(identifier: "treatment1", text: "Continuous Positive Airway Pressure machine (CPAP)", answerFormat: satisfactionFormAnswerFormat)]
    satisfactionFormItems += [ORKFormItem(identifier: "treatment2", text: "Auto Positive Airway Pressure machine (APAP)", answerFormat: satisfactionFormAnswerFormat)]
    satisfactionFormItems += [ORKFormItem(identifier: "treatment3", text: "Bi-level Positive Airway Pressure machine (BiPAP)", answerFormat: satisfactionFormAnswerFormat)]
    satisfactionFormItems += [ORKFormItem(identifier: "treatment4", text: "Adaptive Servo-Ventilation (ASV)", answerFormat: satisfactionFormAnswerFormat)]
    satisfactionFormItems += [ORKFormItem(identifier: "treatment5", text: "Oral appliance", answerFormat: satisfactionFormAnswerFormat)]
    satisfactionFormItems += [ORKFormItem(identifier: "treatment6", text: "Behavioral stimulation", answerFormat: satisfactionFormAnswerFormat)]
    satisfactionFormItems += [ORKFormItem(identifier: "treatment7", text: "Tongue stimulation", answerFormat: satisfactionFormAnswerFormat)]
    satisfactionFormItems += [ORKFormItem(identifier: "treatment8", text: "Tonsillectomy (removal of tonsils)", answerFormat: satisfactionFormAnswerFormat)]
    satisfactionFormItems += [ORKFormItem(identifier: "treatment9", text: "UPPP (removal of palate and other tissue from the mouth)", answerFormat: satisfactionFormAnswerFormat)]
    satisfactionFormItems += [ORKFormItem(identifier: "treatment10", text: "Nasal deviation surgery", answerFormat: satisfactionFormAnswerFormat)]
    satisfactionFormItems += [ORKFormItem(identifier: "treatment11", text: "Tongue surgery", answerFormat: satisfactionFormAnswerFormat)]
    satisfactionFormItems += [ORKFormItem(identifier: "treatment12", text: "Jaw surgery", answerFormat: satisfactionFormAnswerFormat)]
    satisfactionFormItems += [ORKFormItem(identifier: "treatment13", text: "Bariatric surgery", answerFormat: satisfactionFormAnswerFormat)]
    satisfactionFormStep.formItems = satisfactionFormItems
    steps += [satisfactionFormStep]
    
    // Summary
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Congratulations!"
    summaryStep.text = "You have completed the My Sleep Apnea Treatment survey! Thank you for contributing your data. You have been entered into our monthly drawing for a $250 Visa gift card."
    steps += [summaryStep]
    
    
    return ORKOrderedTask(identifier: "MySleepApneaTreatmentSurveyTask", steps: steps)
}