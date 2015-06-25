
//
//  MySleepPatternSurveyTask.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 6/25/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import Foundation
import ResearchKit

public var MySleepPatternSurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    // Instructions
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "My Sleep Pattern Survey"
    instructionStep.text = ""
    steps += [instructionStep]
    
    // Hours of sleep, weekdays
    let weekdaySleepQuestionStepTitle = "How many hours of sleep do you usually get per night on weekdays or workdays?"
    let weekdaySleepAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(12, minimumValue: 0, defaultValue: -1, step: 1, vertical: false, maximumValueDescription: "12+", minimumValueDescription: "0")
    let weekdaySleepQuestionStep = ORKQuestionStep(identifier: "WeekdaySleepStep", title: weekdaySleepQuestionStepTitle, answer: weekdaySleepAnswerFormat)
    steps += [weekdaySleepQuestionStep]
    
    // Hours of sleep, weekends
    let weekendSleepQuestionStepTitle = "How many hours of sleep do you usually get per night on weekends or days off?"
    let weekendSleepAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(12, minimumValue: 0, defaultValue: -1, step: 1, vertical: false, maximumValueDescription: "12+", minimumValueDescription: "0")
    let weekendSleepQuestionStep = ORKQuestionStep(identifier: "WeekendSleepStep", title: weekendSleepQuestionStepTitle, answer: weekendSleepAnswerFormat)
    steps += [weekendSleepQuestionStep]
    
    // Ideal wakeup time
    let idealWakeQuestionStepTitle = "Considering your own 'feeling best rhythm', at what time would you get up if you were entirely free to plan your day?"
    let idealWakeChoices = [
        ORKTextChoice(text: "5:00 - 6:30 am", value: 0),
        ORKTextChoice(text: "6:30 - 7:45 am", value: 1),
        ORKTextChoice(text: "7:45 - 9:45 am", value: 2),
        ORKTextChoice(text: "9:45 - 11:00 am", value: 3),
        ORKTextChoice(text: "After 11:00 am", value: 4)
    ]
    let idealWakeAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: idealWakeChoices)
    let idealWakeQuestionStep = ORKQuestionStep(identifier: "IdealWakeStep", title: idealWakeQuestionStepTitle, answer: idealWakeAnswerFormat)
    steps += [idealWakeQuestionStep]
    
    // Likelihood of dozing
    let dozingFormStep = ORKFormStep(identifier: "DozinessFormStep", title: "How likely are you to doze?", text: "Please choose one of the answers")
    let dozingFormScaleAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(4, minimumValue: 1, defaultValue: -1, step: 1, vertical: false, maximumValueDescription: "High chance of dozing", minimumValueDescription: "Would never doze")
    let dozingFormChoices = [
        ORKTextChoice(text: "High chance of dozing", value: 0),
        ORKTextChoice(text: "Moderate chance of dozing", value: 1),
        ORKTextChoice(text: "Slight chance of dozing", value: 2),
        ORKTextChoice(text: "Would never doze", value: 3)
    ]
    let dozingFormAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: dozingFormChoices)
    var dozingFormItems = [ORKFormItem]()
    dozingFormItems += [ORKFormItem(identifier: "dozing1", text: "Sitting and reading", answerFormat: dozingFormAnswerFormat)]
    dozingFormItems += [ORKFormItem(identifier: "dozing2", text: "Watching TV", answerFormat: dozingFormAnswerFormat)]
    dozingFormItems += [ORKFormItem(identifier: "dozing3", text: "Sitting inactive in a public place (like a movie theater or classroom", answerFormat: dozingFormAnswerFormat)]
    dozingFormItems += [ORKFormItem(identifier: "dozing4", text: "Riding as a passenger in a car for an hour without a break", answerFormat: dozingFormAnswerFormat)]
    dozingFormItems += [ORKFormItem(identifier: "dozing5", text: "Lying down to rest in the afternoon when time permits", answerFormat: dozingFormAnswerFormat)]
    dozingFormItems += [ORKFormItem(identifier: "dozing6", text: "Sitting and talking to someone", answerFormat: dozingFormAnswerFormat)]
    dozingFormItems += [ORKFormItem(identifier: "dozing7", text: "Sitting quietly after lunch without alcohol", answerFormat: dozingFormAnswerFormat)]
    dozingFormItems += [ORKFormItem(identifier: "dozing8", text: "In a car, while stopped for a few minutes in traffic", answerFormat: dozingFormAnswerFormat)]
    dozingFormStep.formItems = dozingFormItems
    steps += [dozingFormStep]
    
    
    // Summary
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Congratulations!"
    summaryStep.text = "You have completed the My Sleep Pattern survey! Thank you for contributing your data. You have been entered into our monthly drawing for a $250 Visa gift card."
    steps += [summaryStep]
    
    
    
    return ORKOrderedTask(identifier: "MySleepPatternSurveyTask", steps: steps)
}