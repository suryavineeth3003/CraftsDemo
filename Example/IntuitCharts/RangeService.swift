//
//  ChartService.swift
//  IntuitCharts_Example
//
//  Created by Surya Vineeth on 06/02/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation


public struct RangeService:RangeSeviceProtocol {
    var requestSession: RequestSession
    
    init(with session:RequestSession) {
        self.requestSession = session
    }

    
    /// Fetches the range data
    /// - Parameter completion: callback to handle the response
    func fetchCreditScoreRange(completion: @escaping RangeServiceCompletionBlock) {
        self.requestSession.dataTask(with: API.UserScore.url) { (data, response, error) in
            guard let response = response as? HTTPURLResponse else {
                return completion(nil,.NoData)
            }
            
            guard error == nil else{
                return completion(nil,.HTTPError(code: response.statusCode))
            }
            
            guard let data = data else{
                return completion(nil,.HTTPError(code: response.statusCode))
            }
            
            do {
                let rangeResponse = try JSONDecoder().decode(RangeResponse.self, from: data)
                return completion(rangeResponse,nil)
            }catch {
                return completion(nil,.DecodeError)
            }
            
        }.resume()
    }
    
    
}
