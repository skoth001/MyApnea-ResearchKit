//
//  AdditionalInformationSurveyTask.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 6/25/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import Foundation
import ResearchKit

public var AdditionalInformationSurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "Additional Information Survey"
    instructionStep.text = "These questions are designed to get to know you and your background more, so we can understand our members better."
    steps += [instructionStep]
    
    
    // Height
    let heightQuestionStepTitle = "How tall are you? (inches)"
    let heightAnswerFormat = ORKAnswerFormat.integerAnswerFormatWithUnit("inches")
    let heightQuestionStep = ORKQuestionStep(identifier: "HeightStep", title: heightQuestionStepTitle, answer: heightAnswerFormat)
    steps += [heightQuestionStep]
    
    // Weight
    let weightQuestionStepTitle = "How much do you weight? (pounds)"
    let weightAnswerFormat = ORKAnswerFormat.integerAnswerFormatWithUnit("pounds")
    let weightQuestionStep = ORKQuestionStep(identifier: "WeightStep", title: weightQuestionStepTitle, answer: weightAnswerFormat)
    steps += [weightQuestionStep]
    
    // Marital Status
    let maritalQuestionStepTitle = "What is your current marital status?"
    let maritalChoices = [
        ORKTextChoice(text: "Now married", value: 0),
        ORKTextChoice(text: "Unmarried, but living with a partner", value: 1),
        ORKTextChoice(text: "Widowed", value: 2),
        ORKTextChoice(text: "Divorced", value: 3),
        ORKTextChoice(text: "Separated", value: 4),
        ORKTextChoice(text: "Never married", value: 5)
    ]
    let maritalAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: maritalChoices)
    let maritalQuestionStep = ORKQuestionStep(identifier: "MaritalStep", title: maritalQuestionStepTitle, answer: maritalAnswerFormat)
    steps += [maritalQuestionStep]
    
    // Daily Activities
    let activitiesQuestionStepTitle = "What best describes your current maind aily activities?"
    let activitiesChoices = [
        ORKTextChoice(text: "Working full time", detailText: "(day shifts)", value: 0),
        ORKTextChoice(text: "Working full time", detailText: "(night shifts)", value: 1),
        ORKTextChoice(text: "Working part time", detailText: "(day shifts)", value: 2),
        ORKTextChoice(text: "Working part time", detailText: "(night shifts)", value: 3),
        ORKTextChoice(text: "Unemployed, laid off, or looking for work", value: 4),
        ORKTextChoice(text: "In school (full- or part-time student)", value: 5),
        ORKTextChoice(text: "Stay-at-home parent or keeping household", value: 6),
        ORKTextChoice(text: "Retired", value: 7),
        ORKTextChoice(text: "Disabled", value: 8)
    ]
    let activitiesAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: activitiesChoices)
    let activitiesQuestionStep = ORKQuestionStep(identifier: "ActivitiesStep", title: activitiesQuestionStepTitle, answer: activitiesAnswerFormat)
    steps += [activitiesQuestionStep]
    
    // Paying for Basics
    let basicsQuestionStepTitle = "On a scale of 1 to 4, how hard is it for you (and your family) to pay for basics like food, rent or mortgage, heating, etc.?"
    // If we need to use multiple choice
    let basicsChoices = [
        ORKTextChoice(text: "Very hard", value: 0),
        ORKTextChoice(text: "Hard", value: 1),
        ORKTextChoice(text: "Somewhat hard", value: 2),
        ORKTextChoice(text: "Not very hard", value: 3),
        ORKTextChoice(text: "Don't know", value: 4)
    ]
    let basicsAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(4, minimumValue: 1, defaultValue: -1, step: 1, vertical: false, maximumValueDescription: "Very hard", minimumValueDescription: "Not very hard")
    let basicsQuestionStep = ORKQuestionStep(identifier: "PayingBasicsStep", title: basicsQuestionStepTitle, answer: basicsAnswerFormat)
    steps += [basicsQuestionStep]
    
    
    // Summary
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Congratulations!"
    summaryStep.text = "You have completed the Additional Information survey! Thank you for contributing your data. You have been entered into our monthly drawing for a $250 Visa gift card."
    steps += [summaryStep]
    
    
    return ORKOrderedTask(identifier: "AdditionalInformationSurveyTask", steps: steps)
}