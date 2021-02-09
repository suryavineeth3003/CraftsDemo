//
//  Enum.swift
//  IntuitCharts_Example
//
//  Created by Surya Vineeth on 08/02/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
enum HTTPError:Int{
    case ResourceNotFound = 404
    case UnAuthorised = 401
    case ServerError = 500
    case Unknown = 999
    
}
enum CustomError:Error {
    case InvalidUrl
    case NoData
    case DecodeError
    case HTTPError(code:Int)
}

enum API {
    case Range
    case UserScore
    
    static let endpoint:URL = URL(string: "https://www.test.com")!
    
    
    var url:URL {
        switch self {
        case .Range:
            return API.endpoint.appendingPathComponent("range")
        case .UserScore:
            return API.endpoint.appendingPathComponent("userScore")
        }
    }
    
}
