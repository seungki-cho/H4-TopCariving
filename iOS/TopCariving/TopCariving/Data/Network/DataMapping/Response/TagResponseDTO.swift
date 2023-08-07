//
//  TagResponseDTO.swift
//  TopCariving
//
//  Created by Eunno An on 2023/08/07.
//

import Foundation

struct TagResponseDTO: Decodable {
    let content: String
}

extension TagResponseDTO {
    func toDomain() -> Tag {
        return .init(content: content)
    }
}
