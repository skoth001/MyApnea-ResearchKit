//
//  MemoryTask.swift
//  MyApneaRK
//
//  Created by Kyle Rand on 6/25/15.
//  Copyright (c) 2015 myapnea. All rights reserved.
//

import Foundation
import ResearchKit

public var MemoryTask: ORKOrderedTask {
    
    let time = NSTimeInterval(1)
    
    return ORKOrderedTask.spatialSpanMemoryTaskWithIdentifier("MemoryTask", intendedUseDescription: "Try your best to remember the order of items highlighted", initialSpan: 2, minimumSpan: 2, maximumSpan: 10, playSpeed: time, maxTests: 10, maxConsecutiveFailures: 3, customTargetImage: nil, customTargetPluralName: nil, requireReversal: false, options: nil)
}