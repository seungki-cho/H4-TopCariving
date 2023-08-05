//
//  ContainerStackView.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/03.
//

import UIKit
import Combine

class FoldableStackView: UIStackView {
    // MARK: - UI properties
    
    // MARK: - Properties
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    
    convenience init(arrangedSubviews views: [FoldableView]) {
        self.init(frame: .zero)
        views.forEach { addArrangedSubview($0) }
    }
    
    // MARK: - Helpers
    func setUI() {
        axis = .vertical
        alignment = .fill
        distribution = .equalSpacing
        spacing = 8
    }
}
