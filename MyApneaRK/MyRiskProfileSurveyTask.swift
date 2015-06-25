//
//  MyRiskProfileSurveyTask.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 6/25/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import Foundation
import ResearchKit

public var MyRiskProfileSurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    // Instructions
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "My Risk Profile Survey"
    instructionStep.text = ""
    steps += [instructionStep]
    
    // Symptoms
    let symptomsFormStepTitle = "Do you currently experience any of these symptoms? How long has each symptom been present?"
    let symptomsFormStep = ORKFormStep(identifier: "Symptoms", title: "Symptoms", text: symptomsFormStepTitle)
    let symptomsChoices = [
        ORKTextChoice(text: "0-3 months", value: 0),
        ORKTextChoice(text: "3-6 months", value: 1),
        ORKTextChoice(text: "6-12 months", value: 2),
        ORKTextChoice(text: "12-24 months", value: 3),
        ORKTextChoice(text: "N/A", value: 4)
    ]
    let symptomsAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: symptomsChoices)
    var symptomsFormItems = [ORKFormItem]()
    symptomsFormItems += [ORKFormItem(identifier: "symptom1", text: "Snoring", answerFormat: symptomsAnswerFormat)]
    symptomsFormItems += [ORKFormItem(identifier: "symptom2", text: "Sleepiness", answerFormat: symptomsAnswerFormat)]
    symptomsFormItems += [ORKFormItem(identifier: "symptom3", text: "Tiredness", answerFormat: symptomsAnswerFormat)]
    symptomsFormItems += [ORKFormItem(identifier: "symptom4", text: "Driving or work accident", answerFormat: symptomsAnswerFormat)]
    symptomsFormItems += [ORKFormItem(identifier: "symptom5", text: "Shortness of breath during sleep", answerFormat: symptomsAnswerFormat)]
    symptomsFormItems += [ORKFormItem(identifier: "symptom6", text: "Stopped breathing during sleep", answerFormat: symptomsAnswerFormat)]
    symptomsFormItems += [ORKFormItem(identifier: "symptom7", text: "Heart disease", answerFormat: symptomsAnswerFormat)]
    symptomsFormItems += [ORKFormItem(identifier: "symptom8", text: "High blood pressure", answerFormat: symptomsAnswerFormat)]
    symptomsFormItems += [ORKFormItem(identifier: "symptom9", text: "Depressed mood", answerFormat: symptomsAnswerFormat)]
    symptomsFormItems += [ORKFormItem(identifier: "symptom10", text: "Irritability", answerFormat: symptomsAnswerFormat)]
    symptomsFormItems += [ORKFormItem(identifier: "symptom11", text: "Concerned friend or spouse", answerFormat: symptomsAnswerFormat)]
    symptomsFormItems += [ORKFormItem(identifier: "symptom12", text: "Forgetfulness", answerFormat: symptomsAnswerFormat)]
    symptomsFormItems += [ORKFormItem(identifier: "symptom13", text: "Healthcare provider's suggestion", answerFormat: symptomsAnswerFormat)]
    symptomsFormStep.formItems = symptomsFormItems
    steps += [symptomsFormStep]
    
    // Summary
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Congratulations!"
    summaryStep.text = "You have completed the My Risk Profile survey! Thank you for contributing your data. You have been entered into our monthly drawing for a $250 Visa gift card."
    steps += [summaryStep]
    
    
    return ORKOrderedTask(identifier: "MyRiskProfileSurveyTask", steps: steps)
}