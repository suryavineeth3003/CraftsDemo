//
//  Range.swift
//  IntuitCharts_Example
//
//  Created by Surya Vineeth on 06/02/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation


/// Model to define range
public struct Range {
    let min:Int
    let max:Int
    let percentage:Int
    
    public init(min:Int,max:Int,percentage:Int){
        self.max = max
        self.min = min
        self.percentage = percentage
    }
}
