//
//  CarSummaryContainerCell.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/03.
//

import UIKit
import Combine
class CarSummaryContainer: FoldableView {
    // MARK: - UI properties
    private let iconStackView = UIStackView()
    
    // MARK: - Helpers
    override func setUI() {
        super.setUI()
        addSubview(iconStackView)
    }
    
    override func setLayout() {
        super.setLayout()
        iconStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconStackView.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 23),
            iconStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1, constant: -40)
        ])
    }
    
    override func fold() {
        super.fold()
        iconStackView.isHidden = true
        heightConstant?.constant = 71
    }
    
    override func unfold() {
        super.unfold()
        iconStackView.isHidden = false
        heightConstant?.constant = 215
    }
    
