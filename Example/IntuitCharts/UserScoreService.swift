//
//  UserScoreSercice.swift
//  IntuitCharts_Example
//
//  Created by Surya Vineeth on 07/02/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation


struct UserScoreService:UserScoreServiceProtocol {
    var requestSession: RequestSession
    
    init(with session:RequestSession) {
        self.requestSession = session
    }
    
    
    /// fetches the user score data
    /// - Parameter completion: callback to handle reponse
    func fetchUserScore(completion: @escaping UserScoreServiceCompletionBlock) {
       
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
                let score = try JSONDecoder().decode(ScoreData.self, from: data)
                return completion(score,nil)
            }catch {
                return completion(nil,.DecodeError)
            }
            
        }.resume()
        
    }
    
}
