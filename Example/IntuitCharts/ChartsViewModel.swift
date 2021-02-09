//
//  ChartsViewModel.swift
//  IntuitCharts_Example
//
//  Created by Surya Vineeth on 06/02/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import IntuitCharts


struct ChartsViewModel{
    private var rangeService:RangeSeviceProtocol
    private var userScoreService:UserScoreServiceProtocol
    
    var rangeList:Binding<[RangeData]> = Binding(with: [])
    var userScore:Binding<ScoreData> = Binding(with: ScoreData(score: 0, date: ""))
    
    
    /// Initializer
    /// - Parameters:
    ///   - rangeService: instance of service class to fetch range data
    ///   - userScoreService: inscance of service class to fetch score data
    init(rangeService:RangeSeviceProtocol,userScoreService:UserScoreServiceProtocol) {
        self.rangeService = rangeService
        self.userScoreService = userScoreService
        
    }
    
    
    /// Constructs the view model to pass the Rage data to charts library
    /// - Returns: viewmodel
    func getRangeListViewModel ()->RangeListViewModel{
        let rangeVMList = self.rangeList.value.map({RangeVM(with: Range(min: $0.min, max: $0.max, percentage: $0.percentage))})
        return RangeListViewModel(with: rangeVMList, currentScore: self.userScore.value.score)
    }
    
    /// Constructs the view model to pass the score data to charts library
    /// - Returns: viewmodel
    func getScoreViewModel()->ScoreViewModel {
        let min = self.rangeList.value.min { (range1, range2) -> Bool in
            return range1.min < range2.min
            }?.min ?? 0
        
        let max = self.rangeList.value.max { (range1, range2) -> Bool in
            return range1.min < range2.min
            }?.max ?? 0
        
        
        
        var userScore = UserScore(withScore: self.userScore.value.score, date: self.userScore.value.date)
        userScore.min = min
        userScore.max = max
        
        let pieChartConfig = PieChartConfig.configFrom(score: userScore)
        
        return ScoreViewModel(with: userScore, chartConfig: pieChartConfig)
    }
    
    
    /// loads range data from service
    func loadRangeData(){
        self.rangeService.fetchCreditScoreRange { (response, error) in
            guard error == nil, let response = response else {
                // handle error
                return
            }
            
            self.rangeList.value = response.range
        }
    }
    
    
    /// loads score data from service
    func loadUserScore(){
        self.userScoreService.fetchUserScore { (userScore, error) in
            guard error == nil, let unwrappedScore = userScore else{
                //handle error
                return
            }
            
            self.userScore.value = unwrappedScore
           
        }
    }

    
}
