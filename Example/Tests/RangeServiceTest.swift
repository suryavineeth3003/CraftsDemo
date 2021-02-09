import XCTest
@testable import IntuitCharts_Example

class RangeServiceTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParsingRangeData() throws {
        //given
        let mockSession = MockRequestSession(with : .Range,useTestJson: true)
        let rangeService = RangeService(with:mockSession)
        
        var rangeResponse:RangeResponse?
        var error:CustomError?
        
        //when
        rangeService.fetchCreditScoreRange { (range, err) in
            error = err
            rangeResponse = range
        }
        
        //then
        XCTAssertNil(error, "received error while parsing")
        XCTAssertNotNil(rangeResponse, "received nil range response")
        XCTAssertEqual(rangeResponse!.range.count, 5)
        
        let range = rangeResponse!.range[0]
        XCTAssertEqual(range.max, 900)
        XCTAssertEqual(range.min, 825)
        XCTAssertEqual(range.percentage, 19)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
