//
//  ModelResponseDTO+Mapping.swift
//  TopCariving
//
//  Created by Eunno An on 2023/08/07.
//

import Foundation

struct ModelResponseDTO: Decodable {
    typealias Identifier = Int64
    let carOptionID: Identifier
    let optionName: String
    let price: Int32
    let photos: [ModelPhotoResponseDTO]
}

extension ModelResponseDTO {
    func toDomain() -> Model {
        return .init(
            id: carOptionID,
            optionName: optionName,
            price: price,
            photos: photos.map {$0.toDomain()})
    }
}
