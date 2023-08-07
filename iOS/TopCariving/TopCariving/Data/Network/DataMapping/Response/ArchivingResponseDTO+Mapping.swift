//
//  ArchivingResponseDTO.swift
//  TopCariving
//
//  Created by Eunno An on 2023/08/07.
//

import Foundation

struct ArchivingResponseDTO: Decodable {
    typealias Identifier = Int64
    let archivingID: Identifier
    let photoURL: String
    let model: ArchivingOptionResponseDTO
    let engine: ArchivingOptionResponseDTO
    let bodyType: ArchivingOptionResponseDTO
    let drivingMethod: ArchivingOptionResponseDTO
    let exteriorColor: ArchivingOptionResponseDTO
    let interiorColor: ArchivingOptionResponseDTO
    let selectOptions: [ArchivingOptionResponseDTO]
}

extension ArchivingResponseDTO {
    func toDomain() -> Archiving {
        return .init(
            id: archivingID,
            photoURL: photoURL,
            model: model.toDomain(),
            engine: engine.toDomain(),
            bodyType: bodyType.toDomain(),
            drivingMethod: drivingMethod.toDomain(),
            exteriorColor: exteriorColor.toDomain(),
            interiorColor: interiorColor.toDomain(),
            selectOptions: selectOptions.map {$0.toDomain()})
    }
}
