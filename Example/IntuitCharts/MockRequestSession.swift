//
//  MockUserScoreRequestSession.swift
//  IntuitCharts_Example
//
//  Created by Surya Vineeth on 07/02/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation


/// MockRequest session class
struct MockRequestSession:RequestSession{
    var mockDataTask:MockDataTask = MockDataTask()
    
    
    /// Initialiser
    /// - Parameter api: kind of api to call
    init(with api:API, useTestJson:Bool = false) {
        var data:Data?
        switch api {
          case .Range:
            if let filePath = Bundle.main.path(forResource: (useTestJson == false) ? "Range":"Range_Test", ofType: "json"){
                data = try? Data(contentsOf: URL(fileURLWithPath:filePath))
            }
          case .UserScore:
            if let filePath = Bundle.main.path(forResource: (useTestJson == false) ? "UserScore":"UserScore_Test", ofType: "json"){
                data = try? Data(contentsOf: URL(fileURLWithPath:filePath))
            }
        }
        
        if let data = data {
            let response = HTTPURLResponse(url: api.url, statusCode: 200, httpVersion: nil, headerFields: nil)
            mockDataTask.fakeResponse = (data,response,nil)
        }
    }
    
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        mockDataTask.completionBlock = completionHandler
        return mockDataTask
    }
    
}


/// MockDataTask subclassing the UrlSessionDataTask
class MockDataTask:URLSessionDataTask {
    typealias CompletionBlock = (Data?, URLResponse?, Error?) -> Void
    
    var completionBlock:CompletionBlock?
    var fakeResponse:(data: Data?, response: URLResponse?, error: Error?)?
    
    override func resume() {
        self.completionBlock?(fakeResponse?.data,fakeResponse?.response,fakeResponse?.error)
    }
}
