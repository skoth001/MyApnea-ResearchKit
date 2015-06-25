//
//  MyHealthConditionsSurveyTask.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 6/25/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import Foundation
import ResearchKit

public var MyHealthConditionsSurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    // Instructions
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "My Health Conditions Survey"
    instructionStep.text = ""
    steps += [instructionStep]
    
    // Health conditions
    let healthConditionsFormStep = ORKFormStep(identifier: "healthConditionsFormStep", title: "Health Conditions", text: "Has a doctor or health care professional ever told you that you had any of the following?")
    let healthConditionsFormChoices = [
        ORKTextChoice(text: "Yes", value: 0),
        ORKTextChoice(text: "No", value: 1),
        ORKTextChoice(text: "Don't know", value: 2)
    ]
    let healthConditionsFormAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: healthConditionsFormChoices)
    var healthConditionsFormItems = [ORKFormItem]()
    healthConditionsFormItems += [ORKFormItem(identifier: "healthcondition1", text: "Allergies", answerFormat: healthConditionsFormAnswerFormat)]
    healthConditionsFormItems += [ORKFormItem(identifier: "healthcondition2", text: "Asthma", answerFormat: healthConditionsFormAnswerFormat)]
    healthConditionsFormItems += [ORKFormItem(identifier: "healthcondition3", text: "Attention Deficit Disorder (ADD)", answerFormat: healthConditionsFormAnswerFormat)]
    healthConditionsFormItems += [ORKFormItem(identifier: "healthcondition4", text: "Attention Deficit Hyperactivity Disorder (ADHD)", answerFormat: healthConditionsFormAnswerFormat)]
    healthConditionsFormItems += [ORKFormItem(identifier: "healthcondition5", text: "Cancer", answerFormat: healthConditionsFormAnswerFormat)]
    healthConditionsFormItems += [ORKFormItem(identifier: "healthcondition6", text: "Chronic Obstructive Lung Disease (COPD or Emphysema)", answerFormat: healthConditionsFormAnswerFormat)]
    healthConditionsFormItems += [ORKFormItem(identifier: "healthcondition7", text: "Depression", answerFormat: healthConditionsFormAnswerFormat)]
    healthConditionsFormItems += [ORKFormItem(identifier: "healthcondition8", text: "Diabetes", answerFormat: healthConditionsFormAnswerFormat)]
    healthConditionsFormItems += [ORKFormItem(identifier: "healthcondition9", text: "Epilepsy or Seizure Disorder", answerFormat: healthConditionsFormAnswerFormat)]
    healthConditionsFormItems += [ORKFormItem(identifier: "healthcondition10", text: "High Blood Pressure", answerFormat: healthConditionsFormAnswerFormat)]
    healthConditionsFormItems += [ORKFormItem(identifier: "healthcondition11", text: "Heart Disease", answerFormat: healthConditionsFormAnswerFormat)]
    healthConditionsFormItems += [ORKFormItem(identifier: "healthcondition12", text: "Insomnia", answerFormat: healthConditionsFormAnswerFormat)]
    healthConditionsFormItems += [ORKFormItem(identifier: "healthcondition13", text: "Narcolepsy", answerFormat: healthConditionsFormAnswerFormat)]
    healthConditionsFormItems += [ORKFormItem(identifier: "healthcondition14", text: "Pulmonary Fibrosis", answerFormat: healthConditionsFormAnswerFormat)]
    healthConditionsFormItems += [ORKFormItem(identifier: "healthcondition15", text: "Restless Leg Syndrome", answerFormat: healthConditionsFormAnswerFormat)]
    healthConditionsFormItems += [ORKFormItem(identifier: "healthcondition16", text: "Stroke", answerFormat: healthConditionsFormAnswerFormat)]
    healthConditionsFormStep.formItems = healthConditionsFormItems
    steps += [healthConditionsFormStep]
    
    // Other health conditions
    let otherConditionsQuestionStepTitle = "If you've been diagnosed with other significant health conditions, please list them here."
    let otherConditionsAnswerFormat = ORKAnswerFormat.textAnswerFormat()
    let otherConditionsQuestionStep = ORKQuestionStep(identifier: "otherConditionsQuestionStep", title: otherConditionsQuestionStepTitle, answer: otherConditionsAnswerFormat)
    steps += [otherConditionsQuestionStep]
    
    // Summary
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Congratulations!"
    summaryStep.text = "You have completed the My Health Conditions survey! Thank you for contributing your data. You have been entered into our monthly drawing for a $250 Visa gift card."
    steps += [summaryStep]
    
    
    return ORKOrderedTask(identifier: "MyHealthConditionsSurveyTask", steps: steps)
}