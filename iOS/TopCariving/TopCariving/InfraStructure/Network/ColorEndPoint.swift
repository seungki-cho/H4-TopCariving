//
//  ColorEndPoint.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/24.
//

import Foundation

enum ColorEndPoint {
    case getExteriors
    case postExteriors
}
extension ColorEndPoint: EndPoint {
    var path: String {
        switch self {
        case .getExteriors, .postExteriors:
            return "/api/options/colors/exteriors"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getExteriors:
            return .get
        case .postExteriors:
            return .post
        }
    }
    
    var header: [String: String]? {
        // swiftlint: disable line_length
        var baseHeader = ["authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2OTIxNjk5NzAsImV4cCI6MTcyMzcwNTk3MCwiaXNzIjoiVG9wQ2FyaXZpbmciLCJzdWIiOiIxIn0.p1bkF0pLsHkobfdkyPyGBjaClOHDhXbUFpeagBUWvx4"]
        switch self {
        case .getExteriors:
            return baseHeader
        case .postExteriors:
            baseHeader["accept"] = "*/*"
            baseHeader["Content-Type"] = "application/json"
            return baseHeader
        }
    }
    
    var body: Encodable? {
        switch self {
        default:
            return nil
        }
    }
}
