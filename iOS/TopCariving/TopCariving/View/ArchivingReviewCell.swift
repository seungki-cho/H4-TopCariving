//
//  ArchivingReviewCell.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/21.
//
struct ArchivingReviewCellModel: Hashable {
    let carName: String
    let searchType: String
    let date: Date
    let trim: String
    let outColorName: String
    let inColorName: String
    let selectOptions: [String]
    let tags: [String]
}
