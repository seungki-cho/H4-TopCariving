//
//  Archiving.swift
//  TopCariving
//
//  Created by Eunno An on 2023/08/07.
//

import Foundation

struct Archiving: Identifiable {
    typealias Identifier = Int64
    let id: Identifier
    let photoURL: String
    let model: ArchivingOption
    let engine: ArchivingOption
    let bodyType: ArchivingOption
    let drivingMethod: ArchivingOption
    let exteriorColor: ArchivingOption
    let interiorColor: ArchivingOption
    let selectOptions: [ArchivingOption]
}
