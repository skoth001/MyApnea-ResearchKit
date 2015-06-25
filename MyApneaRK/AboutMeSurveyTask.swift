//
//  AboutMeSurveyTask.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 6/25/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import Foundation
import ResearchKit

public var AboutMeSurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "About Me Survey"
    instructionStep.text = "These questions are designed to get to know you and your background more, so we can understand our members better."
    steps += [instructionStep]
    
    
    // Date of Birth Question
    let userCalendar = NSCalendar.currentCalendar()
    let defaultDateComponents = NSDateComponents()
    defaultDateComponents.year = 1950
    defaultDateComponents.month = 1
    defaultDateComponents.day = 1
    defaultDateComponents.timeZone = NSTimeZone(name: "US/Eastern")
    let defaultDate = userCalendar.dateFromComponents(defaultDateComponents)
    
    let minDateComponents = NSDateComponents()
    minDateComponents.year = 1900
    minDateComponents.month = 1
    minDateComponents.day = 1
    minDateComponents.timeZone = NSTimeZone(name: "US/Eastern")
    let minDate = userCalendar.dateFromComponents(minDateComponents)
    
    let todaysDate = NSDate.new()
    let requestedDateComponents: NSCalendarUnit = .CalendarUnitYear |
        .CalendarUnitMonth |
        .CalendarUnitDay
    let todaysDateComponents = userCalendar.components(requestedDateComponents, fromDate: todaysDate)
    
    let maxDateComponents = NSDateComponents()
    maxDateComponents.year = todaysDateComponents.year - 18
    maxDateComponents.month = todaysDateComponents.month
    maxDateComponents.day = todaysDateComponents.day
    maxDateComponents.timeZone = NSTimeZone(name: "US/Eastern")
    let maxDate = userCalendar.dateFromComponents(maxDateComponents)
    
    let dobQuestionStepTitle = "What is your date of birth?"
    let dobAnswerFormat = ORKAnswerFormat.dateAnswerFormatWithDefaultDate(defaultDate, minimumDate: minDate, maximumDate: maxDate, calendar: userCalendar)
    let dobQuestionStep = ORKQuestionStep(identifier: "DOBStep", title: dobQuestionStepTitle, answer: dobAnswerFormat)
    steps += [dobQuestionStep]
    
    // Biological Sex
    let sexQuestionStepTitle = "What is your sex?"
    let sexChoices = [
        ORKTextChoice(text: "Male", value: 0),
        ORKTextChoice(text: "Female", value: 1),
        ORKTextChoice(text: "Other", value: 2)
    ]
    let sexAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: sexChoices)
    let sexQuestionStep = ORKQuestionStep(identifier: "SexStep", title: sexQuestionStepTitle, answer: sexAnswerFormat)
    steps += [sexQuestionStep]
    
    // Race
    let raceQuestionStepTitle = "What is your racial background?"
    let raceChoices = [
        ORKTextChoice(text: "American Indian or Alaskan Native", value: 0),
        ORKTextChoice(text: "Asian", value: 1),
        ORKTextChoice(text: "Black or African American", value: 2),
        ORKTextChoice(text: "Native Hawaiian or Other Pacific Islander", value: 3),
        ORKTextChoice(text: "White", value: 4),
        ORKTextChoice(text: "Other", value: 5),
        ORKTextChoice(text: "Unsure", value: 6)
    ]
    let raceAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: raceChoices)
    let raceQuestionStep = ORKQuestionStep(identifier: "RaceStep", title: raceQuestionStepTitle, answer: raceAnswerFormat)
    steps += [raceQuestionStep]
    
    // Ethnicity
    let ethnicityQuestionStepTitle = "Are you of Hispanic, Latino, or Spanish origin or ancestry?"
    let ethnicityChoices = [
        ORKTextChoice(text: "No", value: 0),
        ORKTextChoice(text: "Yes - Mexican, Mexican American, or Chicano", value: 1),
        ORKTextChoice(text: "Yes - Puerto Rican", value: 2),
        ORKTextChoice(text: "Yes - Cuban", value: 3),
        ORKTextChoice(text: "Yes - Other or Mixed Hispanic, Latino, or Spanish origin", value: 4),
        ORKTextChoice(text: "Unsure", value: 5)
    ]
    let ethnicityAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: ethnicityChoices)
    let ethnicityQuestionStep = ORKQuestionStep(identifier: "EthnicityStep", title: ethnicityQuestionStepTitle, answer: ethnicityAnswerFormat)
    steps += [ethnicityQuestionStep]
    
    // Education
    let educationQuestionStepTitle = "What is the highest degree or level of school you have completed?"
    let educationChoices = [
        ORKTextChoice(text: "8th grade or less", value: 0),
        ORKTextChoice(text: "Some high school, but did not graduate", value: 1),
        ORKTextChoice(text: "High school graduate or GED", value: 2),
        ORKTextChoice(text: "Some college or 2-year degree", value: 3),
        ORKTextChoice(text: "4-year college graduate", value: 4),
        ORKTextChoice(text: "More than 4-year college degree", value: 5)
    ]
    let educationAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: educationChoices)
    let educationQuestionStep = ORKQuestionStep(identifier: "EducationStep", title: educationQuestionStepTitle, answer: educationAnswerFormat)
    steps += [educationQuestionStep]
    
    // Income
    let incomeQuestionStepTitle = "Last year, what was your total household income from all sources, before taxes?"
    let incomeChoices = [
        ORKTextChoice(text: "Less than $10,000 (USD)", value: 0),
        ORKTextChoice(text: "$10,000 - $49,999", value: 1),
        ORKTextChoice(text: "$50,000 - $99,999", value: 2),
        ORKTextChoice(text: "$100,000 - $149,999", value: 3),
        ORKTextChoice(text: "$150,000 - $199,999", value: 4),
        ORKTextChoice(text: "$200,000 - $249,999", value: 5),
        ORKTextChoice(text: "$250,000 or more", value: 6),
        ORKTextChoice(text: "Unknown", value: 7),
    ]
    let incomeAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: incomeChoices)
    let incomeQuestionStep = ORKQuestionStep(identifier: "IncomeStep", title: incomeQuestionStepTitle, answer: incomeAnswerFormat)
    steps += [incomeQuestionStep]
    
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Congratulations!"
    summaryStep.text = "You have completed the About Me survey! Thank you for contributing your data. You have been entered into our monthly drawing for a $250 Visa gift card."
    steps += [summaryStep]
    
    
    return ORKOrderedTask(identifier: "AboutMeSurveyTask", steps: steps)
    
}