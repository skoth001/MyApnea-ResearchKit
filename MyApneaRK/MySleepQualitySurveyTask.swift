//
//  MySleepQualitySurveyTask.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 6/25/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import Foundation
import ResearchKit

public var MySleepQualitySurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    // Instructions
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "My Sleep Quality Survey"
    instructionStep.text = ""
    steps += [instructionStep]
    
    // Recent sleep quality
    let recentSleepQualityQuestionStepTitle = "In the past 7 days, my sleep quality was:"
    let recentSleepQualityChoices = [
        ORKTextChoice(text: "Very poor", value: 0),
        ORKTextChoice(text: "Poor", value: 1),
        ORKTextChoice(text: "Fair", value: 2),
        ORKTextChoice(text: "Good", value: 3),
        ORKTextChoice(text: "Very good", value: 4)
    ]
    let recentSleepQualityAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: recentSleepQualityChoices)
    let recentSleepQualityQuestionStep = ORKQuestionStep(identifier: "RecentSleepQualityStep", title: recentSleepQualityQuestionStepTitle, answer: recentSleepQualityAnswerFormat)
    steps += [recentSleepQualityQuestionStep]
    
    // Likelihood of dozing
    let sleepQualityFormStep = ORKFormStep(identifier: "SleepQualityFormStep", title: "Recent Sleep", text: "Thinking about your sleep in the past 7 days, please answer the following questions.")
    let sleepQualityFormChoices = [
        ORKTextChoice(text: "High chance of dozing", value: 0),
        ORKTextChoice(text: "Moderate chance of dozing", value: 1),
        ORKTextChoice(text: "Slight chance of dozing", value: 2),
        ORKTextChoice(text: "Would never doze", value: 3)
    ]
    let sleepQualityFormAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: sleepQualityFormChoices)
    var sleepQualityFormItems = [ORKFormItem]()
    sleepQualityFormItems += [ORKFormItem(identifier: "sleepquality1", text: "My sleep was refreshing.", answerFormat: sleepQualityFormAnswerFormat)]
    sleepQualityFormItems += [ORKFormItem(identifier: "sleepquality2", text: "I had a problem with my sleep.", answerFormat: sleepQualityFormAnswerFormat)]
    sleepQualityFormItems += [ORKFormItem(identifier: "sleepquality3", text: "I had difficulty falling asleep.", answerFormat: sleepQualityFormAnswerFormat)]
    sleepQualityFormItems += [ORKFormItem(identifier: "sleepquality4", text: "My sleep was restless.", answerFormat: sleepQualityFormAnswerFormat)]
    sleepQualityFormItems += [ORKFormItem(identifier: "sleepquality5", text: "I tried hard to get sleep.", answerFormat: sleepQualityFormAnswerFormat)]
    sleepQualityFormItems += [ORKFormItem(identifier: "sleepquality6", text: "I worried about not being able to fall asleep.", answerFormat: sleepQualityFormAnswerFormat)]
    sleepQualityFormItems += [ORKFormItem(identifier: "sleepquality7", text: "I was satisfied with my sleep.", answerFormat: sleepQualityFormAnswerFormat)]
    sleepQualityFormStep.formItems = sleepQualityFormItems
    steps += [sleepQualityFormStep]
    
    // Summary
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Congratulations!"
    summaryStep.text = "You have completed the My Sleep Quality survey! Thank you for contributing your data. You have been entered into our monthly drawing for a $250 Visa gift card."
    steps += [summaryStep]
    
    
    return ORKOrderedTask(identifier: "MySleepQualitySurveyTask", steps: steps)
}