//
//  MyQualityOfLifeSurveyTask.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 6/25/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import Foundation
import ResearchKit

public var MyQualityOfLifeSurveyTask: ORKOrderedTask {
    
    // This survey uses a similar subset of text choices, so initializing them here
    let ratingChoices = [
        ORKTextChoice(text: "Poor", value: 0),
        ORKTextChoice(text: "Fair", value: 1),
        ORKTextChoice(text: "Good", value: 2),
        ORKTextChoice(text: "Very good", value: 3),
        ORKTextChoice(text: "Excellent", value: 4)
    ]
    let ratingAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: ratingChoices)
    
    let comparisonChoices = [
        ORKTextChoice(text: "Much worse than one year ago", value: 0),
        ORKTextChoice(text: "Somewhat worse now than one year ago", value: 1),
        ORKTextChoice(text: "About the same as one year ago", value: 2),
        ORKTextChoice(text: "Somewhat better now than one year ago", value: 3),
        ORKTextChoice(text: "Much better now than one year ago", value: 4)
    ]
    let comparisonAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: comparisonChoices)
    
    let extentChoices = [
        ORKTextChoice(text: "Not at all", value: 0),
        ORKTextChoice(text: "A little", value: 1),
        ORKTextChoice(text: "Moderately", value: 2),
        ORKTextChoice(text: "Mostly", value: 3),
        ORKTextChoice(text: "Completely", value: 4)
    ]
    let extentAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: extentChoices)
    
    let difficultyChoices = [
        ORKTextChoice(text: "Unable to do", value: 0),
        ORKTextChoice(text: "With much difficulty", value: 1),
        ORKTextChoice(text: "With some difficulty", value: 2),
        ORKTextChoice(text: "With a little difficulty", value: 3),
        ORKTextChoice(text: "Without any difficulty", value: 4)
    ]
    let difficultyAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: difficultyChoices)
    
    let intensityChoices = [
        ORKTextChoice(text: "Very much", value: 0),
        ORKTextChoice(text: "Quite a bit", value: 1),
        ORKTextChoice(text: "Somewhat", value: 2),
        ORKTextChoice(text: "A little bit", value: 3),
        ORKTextChoice(text: "Not at all", value: 4)
    ]
    let intensityAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: intensityChoices)
    
    let frequencyChoices = [
        ORKTextChoice(text: "Always", value: 0),
        ORKTextChoice(text: "Often", value: 1),
        ORKTextChoice(text: "Sometimes", value: 2),
        ORKTextChoice(text: "Rarely", value: 3),
        ORKTextChoice(text: "Never", value: 4)
    ]
    let frequencyAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: frequencyChoices)
    
    
    var steps = [ORKStep]()
    
    // Instructions
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "My Quality of Life Survey"
    instructionStep.text = ""
    steps += [instructionStep]
    
    // Health rating - general
    let healthRatingQuestionStepTitle = "In general, how would you rate your health?"
    let healthRatingQuestionStep = ORKQuestionStep(identifier: "HealthRating", title: healthRatingQuestionStepTitle, answer: ratingAnswerFormat)
    steps += [healthRatingQuestionStep]
    
    // Health rating - improvement
    let healthImprovementQuestionStepTitle = "Compared to one year ago, how would you rate your health in general now?"
    let healthImprovementQuestionStep = ORKQuestionStep(identifier: "HealthImprovement", title: healthImprovementQuestionStepTitle, answer: comparisonAnswerFormat)
    steps += [healthImprovementQuestionStep]
    
    // QOL rating - general
    let qolRatingQuestionStepTitle = "In general, how would you rate your quality of life?"
    let qolRatingQuestionStep = ORKQuestionStep(identifier: "QOLRating", title: qolRatingQuestionStepTitle, answer: ratingAnswerFormat)
    steps += [qolRatingQuestionStep]
    
    // Physica activities
    let physicalActivitiesQuestionStepTitle = "To what extent are you able to carry out your everyday physical activities such as walking, climbing stairs, carrying groceries, or moving a chair?"
    let physicalActivitiesQuestionStep = ORKQuestionStep(identifier: "PhysicalActivities", title: physicalActivitiesQuestionStepTitle, answer: extentAnswerFormat)
    steps += [physicalActivitiesQuestionStep]
    
    // Errands
    let errandsQuestionStepTitle = "How well are you able to run errands and shop?"
    let errandsQuestionStep = ORKQuestionStep(identifier: "Errands", title: errandsQuestionStepTitle, answer: difficultyAnswerFormat)
    steps += [errandsQuestionStep]
    
    // Pain
    let painQuestionStepTitle = "In the past 7 days, how much did pain interfere with your day to day activities?"
    let painQuestionStep = ORKQuestionStep(identifier: "PainInterferance", title: painQuestionStepTitle, answer: intensityAnswerFormat)
    steps += [painQuestionStep]
    
    // Depression
    let depressedQuestionStepTitle = "In the past 7 days, I felt depressed:"
    let depressedQuestionStep = ORKQuestionStep(identifier: "Depression", title: depressedQuestionStepTitle, answer: frequencyAnswerFormat)
    steps += [depressedQuestionStep]
    
    // Fatigue
    let fatigueQuestionStepTitle = "During the past 7 days, I felt fatigued:"
    let fatigueQuestionStep = ORKQuestionStep(identifier: "Fatigue", title: fatigueQuestionStepTitle, answer: intensityAnswerFormat)
    steps += [fatigueQuestionStep]
    
    // Sleep
    let sleepQuestionStepTitle = "In the past 7 days, I had a problem with my sleep:"
    let sleepQuestionStep = ORKQuestionStep(identifier: "SleepProblems", title: sleepQuestionStepTitle, answer: intensityAnswerFormat)
    steps += [sleepQuestionStep]
    
    // Leisure
    let leisureQuestionStepTitle = "I have trouble doing all of my regular leisure activities with others:"
    let leisureQuestionStep = ORKQuestionStep(identifier: "Leisure", title: leisureQuestionStepTitle, answer: frequencyAnswerFormat)
    steps += [leisureQuestionStep]

    
    // Summary
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Congratulations!"
    summaryStep.text = "You have completed the My Quality of Life survey! Thank you for contributing your data. You have been entered into our monthly drawing for a $250 Visa gift card."
    steps += [summaryStep]
    
    
    return ORKOrderedTask(identifier: "MyQualityOfLifeSurveyTask", steps: steps)
}