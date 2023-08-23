//
//  RequestError.swift
//  TopCariving
//
//  Created by Eunno An on 2023/08/03.
//

import Foundation

enum RequestError: Error {
    case encode
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
}

extension RequestError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .encode:
            return "Encode Error"
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}
