//
//  ScoreViewModel.swift
//  IntuitCharts_Example
//
//  Created by Surya Vineeth on 07/02/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

public struct ScoreViewModel {
    private var userScore:UserScore
    var piechartConfig :PieChartConfig
    
    
    /// Initializer
    /// - Parameters:
    ///   - score: score model
    ///   - chartConfig: struct containing chart configuration
    public init(with score:UserScore, chartConfig:PieChartConfig) {
        self.userScore = score
        self.piechartConfig = chartConfig
    }
    
    lazy var dateformatter:DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = self.piechartConfig.dateFormat
        return dateFormatter
    }()
    
    var value:String {
        return "\(self.userScore.score)"
    }
    
    var minRangeValue:String {
        return "\(self.userScore.min)"
    }
    
    var maxRangeValue:String {
        return "\(self.userScore.max)"
    }
        
    
    /// returns formatted date based on the date format
    var date:String {
        mutating get {
            let dateString = dateformatter.string(from: dateformatter.date(from: self.userScore.date) ?? Date())
            return "As of \(dateString)"
        }
    }
    
}
