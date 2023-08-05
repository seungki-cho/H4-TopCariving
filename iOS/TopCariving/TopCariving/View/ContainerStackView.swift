//
//  ContainerStackView.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/03.
//

import UIKit
import Combine

class ContainerStackView<Container: FoldableView>: UIStackView {
    // MARK: - UI properties
    
    // MARK: - Properties
    var bag = Set<AnyCancellable>()
    var tapSubject = PassthroughSubject<Int, Never>()

    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    
    // MARK: - Helpers
    func setUI() {
        axis = .vertical
        alignment = .fill
        distribution = .equalSpacing
        spacing = 8
    }
    
    override func addArrangedSubview(_ view: UIView) {
        guard let view = view as? FoldableView else { return }
        super.addArrangedSubview(view)
        
        view.tapSubject
            .compactMap { [weak self] _ in
                self?.arrangedSubviews.firstIndex(of: view)
            }
            .sink(receiveValue: { [weak self] index in
                guard let self else { return }
                tapped(at: index)
            })
            .store(in: &bag)
    }
    
    private func tapped(at index: Int) {
        guard (0..<arrangedSubviews.count) ~= index else { return }
        
        arrangedSubviews
            .compactMap { $0 as? Foldable }
            .forEach { $0.fold() }
        
        tapSubject.send(index)
        (arrangedSubviews[index] as? Foldable)?.unfold()
    }
}
