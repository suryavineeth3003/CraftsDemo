//
//  ScoreServiceTest.swift
//  IntuitCharts_Tests
//
//  Created by Surya Vineeth on 08/02/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest

@testable import IntuitCharts_Example

class ScoreServiceTest: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParsingUserScoreData() throws {
        //given
        let mockSession = MockRequestSession(with : .UserScore,useTestJson: true)
        let scoreService = UserScoreService(with:mockSession)
        
        var scoreData:ScoreData?
        var error:CustomError?
        
        //when
        scoreService.fetchUserScore { (score, err) in
            error = err
            scoreData = score
        }
        
        //then
        XCTAssertNil(error, "received error while parsing")
        XCTAssertNotNil(scoreData, "received nil range response")
        XCTAssertEqual(scoreData!.score, 800)
        XCTAssertEqual(scoreData!.date, "06-02-2021")
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
