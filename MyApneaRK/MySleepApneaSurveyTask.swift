//
//  MySleepApneaSurveyTask.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 6/25/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import Foundation
import ResearchKit

public var MySleepApneaSurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    // Instructions
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "My Sleep Apnea Survey"
    instructionStep.text = ""
    steps += [instructionStep]
    
    let diagnosedAgeQuestionStepTitle = "How old were you when you were first diagnosed with sleep apnea?"
    let diagnosedAgeChoices = [
        ORKTextChoice(text: "0-19 years old", value: 0),
        ORKTextChoice(text: "20-29 years old", value: 1),
        ORKTextChoice(text: "30-39 years old", value: 2),
        ORKTextChoice(text: "40-49 years old", value: 3),
        ORKTextChoice(text: "50-59 years old", value: 4),
        ORKTextChoice(text: "60-69 years old", value: 5),
        ORKTextChoice(text: "Over 70 years old", value: 6)
    ]
    let diagnosedAgeAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: diagnosedAgeChoices)
    let diagnosedAgeQuestionStep = ORKQuestionStep(identifier: "DiagnosedAge", title: diagnosedAgeQuestionStepTitle, answer: diagnosedAgeAnswerFormat)
    steps += [diagnosedAgeQuestionStep]
    
    // Time before diagnosis
    let timePrediagnosedQuestionStepTitle = "How lond do you think you had sleep apnea before you were diagnosed?"
    let timePrediagnosedChoices = [
        ORKTextChoice(text: "0-3 months", value: 0),
        ORKTextChoice(text: "3-6 months", value: 1),
        ORKTextChoice(text: "6-9 months", value: 2),
        ORKTextChoice(text: "9-12 months", value: 3),
        ORKTextChoice(text: "12-24 months", value: 4),
        ORKTextChoice(text: "24+ months", value: 5),
        ORKTextChoice(text: "Not sure", value: 6)
    ]
    let timePrediagnosedAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: timePrediagnosedChoices)
    let timePrediagnosedQuestionStep = ORKQuestionStep(identifier: "TimePrediagnosed", title: timePrediagnosedQuestionStepTitle, answer: timePrediagnosedAnswerFormat)
    steps += [timePrediagnosedQuestionStep]
    
    // Symptoms
    let symptomsFormStepTitle = "Which of the following symptoms triggered you to be evaluated for sleep apnea? How long had each symptom been present before you were diagnosed with sleep apnea?"
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
    
    // Doctor reccommendation
    let doctorRecQuestionStepTitle = "What doctor first talked to you about sleep apnea?"
    let doctorChoices = [
        ORKTextChoice(text: "Primary care or family doctor (PCP)", value: 0),
        ORKTextChoice(text: "Cardiologist", value: 1),
        ORKTextChoice(text: "Diabetes specialist", value: 2),
        ORKTextChoice(text: "Sleep specialist", value: 3),
        ORKTextChoice(text: "Other", value: 4)
    ]
    let doctorRecAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: doctorChoices)
    let doctorRecQuestionStep = ORKQuestionStep(identifier: "DoctorReccommendation", title: doctorRecQuestionStepTitle, answer: doctorRecAnswerFormat)
    steps += [doctorRecQuestionStep]
    
    // Type of sleep study
    let studyTypeQuestionStepTitle = "What type of sleep study did you have when first diagnosed with sleep apnea?"
    let studyTypeChoices = [
        ORKTextChoice(text: "A sleep study at my home (portable sleep study)", value: 0),
        ORKTextChoice(text: "A sleep study in a sleep lab/center", value: 1)
    ]
    let studyTypeAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: studyTypeChoices)
    let studyTypeQuestionStep = ORKQuestionStep(identifier: "SleepStudyType", title: studyTypeQuestionStepTitle, answer: studyTypeAnswerFormat)
    steps += [studyTypeQuestionStep]
    
    // Satisfaction with sleep study
    let studySatisfactionQuestionStepTitle = "How satisfied were you with the experience of getting a sleep study?"
    let studySatisfactionAnswerFormat = ORKAnswerFormat.scaleAnswerFormatWithMaximumValue(7, minimumValue: 1, defaultValue: -1, step: 1, vertical: false, maximumValueDescription: "Very satisfied", minimumValueDescription: "Very dissatisfied")
    let studySatisfactionQuestionStep = ORKQuestionStep(identifier: "StudySatisfaction", title: studySatisfactionQuestionStepTitle, answer: studySatisfactionAnswerFormat)
    
    // Healthcare coverage
    let healthcareQuestionStepTitle = "Do you have any kind of health care coverage, including health insurance, prepaid plans such as HMOs, or government plans such as Medicare?"
    let healthcareAnswerFormat = ORKAnswerFormat.booleanAnswerFormat()
    let healthcareQuestionStep = ORKQuestionStep(identifier: "Healthcare", title: healthcareQuestionStepTitle, answer: healthcareAnswerFormat)
    steps += [healthcareQuestionStep]
    
    
    // Summary
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Congratulations!"
    summaryStep.text = "You have completed the My Sleep Apnea survey! Thank you for contributing your data. You have been entered into our monthly drawing for a $250 Visa gift card."
    steps += [summaryStep]
    
    
    return ORKOrderedTask(identifier: "MySleepApneaSurveyTask", steps: steps)
}