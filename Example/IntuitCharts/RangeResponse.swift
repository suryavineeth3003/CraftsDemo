//
//  RangeResponse.swift
//  IntuitCharts_Example
//
//  Created by Surya Vineeth on 06/02/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation


/// Model to represent range data
struct RangeResponse : Codable {
    let range:[RangeData]
}

struct RangeData: Codable {
    let min:Int
    let max:Int
    let percentage:Int
}


/// Model to represent score data
struct ScoreData:Codable {
    let score:Int
    let date:String
}
