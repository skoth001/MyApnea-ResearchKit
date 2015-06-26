//
//  AboutMyFamilySurveyTask.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 6/25/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import Foundation
import ResearchKit

public var AboutMyFamilySurveyTask: ORKNavigableOrderedTask {
    
    var steps = [ORKStep]()
    
    // Instructions
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "About My Family Survey"
    instructionStep.text = "Welcome to the survey"
    steps += [instructionStep]
    let instructionRule = ORKDirectStepNavigationRule(destinationStepIdentifier: "Origin")
    
    // Origin
    let originQuestionStepTitle = "In what country were you born?"
    let originChoices = [
        ORKTextChoice(text: "U.S.A.", value: "0"),
        ORKTextChoice(text: "Canada", value: "1"),
        ORKTextChoice(text: "Mexico", value: "2"),
        ORKTextChoice(text: "China", value: "3"),
        ORKTextChoice(text: "India", value: "4"),
        ORKTextChoice(text: "Philippines", value: "5"),
        ORKTextChoice(text: "Other", value: "6")
    ]
    let originAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: originChoices)
    let originQuestionStep = ORKQuestionStep(identifier: "Origin", title: originQuestionStepTitle, answer: originAnswerFormat)
    steps += [originQuestionStep]
    // Text entry for other
    let originOtherResultPredicate = ORKResultPredicate.predicateForChoiceQuestionResultWithResultIdentifier("Origin", expectedString: "6")
    let originRule = ORKPredicateStepNavigationRule(resultPredicates: [originOtherResultPredicate], destinationStepIdentifiers: ["OriginOther"], defaultStepIdentifier: "Language")
    let originOtherQuestionStep = ORKQuestionStep(identifier: "OriginOther", title: "Please specify the country you were born in:", answer: ORKAnswerFormat.textAnswerFormat())
    steps += [originOtherQuestionStep]
    
    // Language
    let languageQuestionStepTitle = "What language do you mainly speak at home?"
    let languageChoices = [
        ORKTextChoice(text: "English", value: "0"),
        ORKTextChoice(text: "Spanish", value: "1"),
        ORKTextChoice(text: "Chinese", value: "2"),
        ORKTextChoice(text: "Other", value: "3")
    ]
    let languageAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: languageChoices)
    let languageQuestionStep = ORKQuestionStep(identifier: "Language", title: languageQuestionStepTitle, answer: languageAnswerFormat)
    steps += [languageQuestionStep]
    // Text entry for other
    let languageOtherResultPredicate = ORKResultPredicate.predicateForChoiceQuestionResultWithResultIdentifier("Language", expectedString: "3")
    let languageRule = ORKPredicateStepNavigationRule(resultPredicates: [languageOtherResultPredicate], destinationStepIdentifiers: ["LanguageOther"], defaultStepIdentifier: "HouseholdSize")
    let languageOtherQuestionStep = ORKQuestionStep(identifier: "LanguageOther", title: "Please specify the language you mainly speak at home:", answer: ORKAnswerFormat.textAnswerFormat())
    steps += [languageOtherQuestionStep]
    
    // Household size
    let householdSizeQuestionStepTitle = "How many people, other than you, live in your household most of the time?"
    let householdSizeChoices = [
        ORKTextChoice(text: "1 person", value: "0"),
        ORKTextChoice(text: "2 people", value: "1"),
        ORKTextChoice(text: "3 people", value: "2"),
        ORKTextChoice(text: "4 or more people", value: "3"),
        ORKTextChoice(text: "I live alone", value: "4")
    ]
    let householdSizeAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: householdSizeChoices)
    let householdQuestionStep = ORKQuestionStep(identifier: "HouseholdSize", title: householdSizeQuestionStepTitle, answer: householdSizeAnswerFormat)
    steps += [householdQuestionStep]
    
    // Household size <18
    let household18QuestionStepTitle = "How many persons less than 18 years of age usually live in your home?"
    let household18Choices = [
        ORKTextChoice(text: "1 person", value: "0"),
        ORKTextChoice(text: "2 people", value: "1"),
        ORKTextChoice(text: "3 people", value: "2"),
        ORKTextChoice(text: "4 or more people", value: "3"),
        ORKTextChoice(text: "None", value: "4")
    ]
    let household18AnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: household18Choices)
    let household18QuestionStep = ORKQuestionStep(identifier: "Household18Size", title: household18QuestionStepTitle, answer: household18AnswerFormat)
    steps += [household18QuestionStep]
    
    // Biological family diagnoses
    let familyDiagnosticsQuestionStepTitle = "Have any of your immediate biological family members been diagnosed with sleep apnea?"
    let familyDiagnosticsChoices = [
        ORKTextChoice(text: "Mother", value: "0"),
        ORKTextChoice(text: "Father", value: "1"),
        ORKTextChoice(text: "Brother(s)", value: "2"),
        ORKTextChoice(text: "Sister(s)", value: "3"),
        ORKTextChoice(text: "Son(s)", value: "4"),
        ORKTextChoice(text: "Daughter(s)", value: "5"),
        ORKTextChoice(text: "None of my biological family members have been diagnosed with sleep apnea", value: "6")
    ]
    let familyDiagnosticsAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices: familyDiagnosticsChoices)
    let familyDiagnosticsQuestionStep = ORKQuestionStep(identifier: "FamilyDiagnostics", title: familyDiagnosticsQuestionStepTitle, answer: familyDiagnosticsAnswerFormat)
    steps += [familyDiagnosticsQuestionStep]
    // Specify number of diagnosed family members
    let brotherCountQuestionStep = ORKQuestionStep(identifier: "BrotherCount", title: "Please specify the number of brothers diagnosed with sleep apnea:", answer: ORKAnswerFormat.integerAnswerFormatWithUnit("brothers"))
    let sisterCountQuestionStep = ORKQuestionStep(identifier: "SisterCount", title: "Please specify the number of sisters diagnosed with sleep apnea:", answer: ORKAnswerFormat.integerAnswerFormatWithUnit("sisters"))
    let sonCountQuestionStep = ORKQuestionStep(identifier: "SonCount", title: "Please specify the number of son(s) diagnosed with sleep apnea:", answer: ORKAnswerFormat.integerAnswerFormatWithUnit("sons"))
    let daughterCountQuestionStep = ORKQuestionStep(identifier: "DaughterCount", title: "Please specify the number of daughter(s) diagnosed with sleep apena:", answer: ORKAnswerFormat.integerAnswerFormatWithUnit("daughters"))
    steps += [brotherCountQuestionStep, sisterCountQuestionStep, sonCountQuestionStep, daughterCountQuestionStep]
    // Result predicates
    let brotherResultPredicate = ORKResultPredicate.predicateForChoiceQuestionResultWithResultIdentifier("FamilyDiagnostics", expectedString: "2")
    let sisterResultPredicate = ORKResultPredicate.predicateForChoiceQuestionResultWithResultIdentifier("FamilyDiagnostics", expectedString: "3")
    let sonResultPredicate = ORKResultPredicate.predicateForChoiceQuestionResultWithResultIdentifier("FamilyDiagnostics", expectedString: "4")
    let daughterResultPredicate = ORKResultPredicate.predicateForChoiceQuestionResultWithResultIdentifier("FamilyDiagnostics", expectedString: "5")
    // Predicate navigation rules
    let familyDiagnosticsRule = ORKPredicateStepNavigationRule(resultPredicates: [brotherResultPredicate, sisterResultPredicate, sonResultPredicate, daughterResultPredicate], destinationStepIdentifiers: ["BrotherCount", "SisterCount", "SonCount", "DaughterCount"], defaultStepIdentifier: "SummaryStep")
    let brotherRule = ORKPredicateStepNavigationRule(resultPredicates: [sisterResultPredicate, sonResultPredicate, daughterResultPredicate], destinationStepIdentifiers: ["SisterCount", "SonCount", "DaughterCount"], defaultStepIdentifier: "SummaryStep")
    let sisterRule = ORKPredicateStepNavigationRule(resultPredicates: [sonResultPredicate, daughterResultPredicate], destinationStepIdentifiers: ["SonCount", "DaughterCount"], defaultStepIdentifier: "SummaryStep")
    let sonRule = ORKPredicateStepNavigationRule(resultPredicates: [daughterResultPredicate
        ], destinationStepIdentifiers: ["DaughterCount"], defaultStepIdentifier: "SummaryStep")
    
    
    // Summary
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Congratulations!"
    summaryStep.text = "You have completed the About My Family survey! Thank you for contributing your data. You have been entered into our monthly drawing for a $250 Visa gift card."
    steps += [summaryStep]
    
    var task = ORKNavigableOrderedTask(identifier: "AboutMyFamilySurveyTask", steps: steps)
    task.setNavigationRule(originRule, forTriggerStepIdentifier: "Origin")
    task.setNavigationRule(languageRule, forTriggerStepIdentifier: "Language")
    task.setNavigationRule(familyDiagnosticsRule, forTriggerStepIdentifier: "FamilyDiagnostics")
    task.setNavigationRule(brotherRule, forTriggerStepIdentifier: "BrotherCount")
    task.setNavigationRule(sisterRule, forTriggerStepIdentifier: "SisterCount")
    task.setNavigationRule(sonRule, forTriggerStepIdentifier: "SonCount")
    return task
}