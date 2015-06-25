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
    
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "My Sleep Apnea Survey"
    instructionStep.text = ""
    steps += [instructionStep]
    
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Congratulations!"
    summaryStep.text = "You have completed the My Sleep Apnea survey! Thank you for contributing your data. You have been entered into our monthly drawing for a $250 Visa gift card."
    steps += [summaryStep]
    
    
    return ORKOrderedTask(identifier: "MySleepApneaSurveyTask", steps: steps)
}