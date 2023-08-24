//
//  TrimEndPoint.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/23.
//

import Foundation

enum TrimEndPoint {
    case getModels
    case postModels(SelectOptionRequestDTO)
    case getEngines
    case postEngines(SelectOptionRequestDTO)
    case getBodyTypes
    case postBodytypes(SelectOptionRequestDTO)
    case getDrivingMethods
    case postDrivingMethods(SelectOptionRequestDTO)
}
extension TrimEndPoint: EndPoint {
    var path: String {
        switch self {
        case .getModels, .postModels:
            return "/api/options/trims/models"
        case .getEngines, .postEngines:
            return "/api/options/trims/engines"
        case .getBodyTypes, .postBodytypes:
            return "/api/options/trims/body-types"
        case .getDrivingMethods, .postDrivingMethods:
            return "/api/options/trims/driving-methods"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getModels, .getEngines, .getBodyTypes, .getDrivingMethods:
            return .get
        case .postModels, .postEngines, .postBodytypes, .postDrivingMethods:
            return .post
        }
    }
    
    var header: [String: String]? {
        // swiftlint: disable line_length
        var baseHeader = ["authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2OTIxNjk5NzAsImV4cCI6MTcyMzcwNTk3MCwiaXNzIjoiVG9wQ2FyaXZpbmciLCJzdWIiOiIxIn0.p1bkF0pLsHkobfdkyPyGBjaClOHDhXbUFpeagBUWvx4"]
        switch self {
        case .getModels, .getEngines, .getBodyTypes, .getDrivingMethods:
            return baseHeader
        case .postModels, .postEngines, .postBodytypes, .postDrivingMethods:
            baseHeader["accept"] = "*/*"
            baseHeader["Content-Type"] = "application/json"
            return baseHeader
        }
    }
    
    var body: Encodable? {
        switch self {
        case .postModels(let selectOption):
            return selectOption
        case .postEngines(let selectOption):
            return selectOption
        case .postBodytypes(let selectOption):
            return selectOption
        case .postDrivingMethods(let selectOption):
            return selectOption
        default:
            return nil
        }
    }
}
