//
//  ChartServiceProtocol.swift
//  IntuitCharts_Example
//
//  Created by Surya Vineeth on 06/02/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation


protocol RequestSession {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}


typealias RangeServiceCompletionBlock = (_ response:RangeResponse?, _ error:CustomError?)->Void
protocol RangeSeviceProtocol {
    var requestSession:RequestSession { get set }
    func fetchCreditScoreRange (completion:@escaping RangeServiceCompletionBlock)
}


typealias UserScoreServiceCompletionBlock = (_ score:ScoreData?, _ error:CustomError?)->Void
protocol UserScoreServiceProtocol {
    var requestSession:RequestSession { get set }
    func fetchUserScore(completion:@escaping UserScoreServiceCompletionBlock)
}
