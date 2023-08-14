//
//  OptionCardView.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/12.
//

import Combine
import UIKit

class OptionCardCell: UICollectionViewCell {
    struct OptionCardViewModel {
        var image: String
        var name: String
        var price: Int
        var isAdded: Bool
    }
    
    // MARK: - UI properties
    private let optionImageView = UIImageView(image: UIImage(named: "TopArchivingButton"))
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setFont(to: .init(name: .medium, size: ._14))
        label.text = "컴포트 2"
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setFont(to: .init(name: .medium, size: ._14))
        label.text = "+ 1,090,000 원"
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("추가하기", for: .normal)
        button.titleLabel?.font = .designSystem(.init(name: .medium, size: ._14))
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.hyundaiNavy.cgColor
        button.layer.borderWidth = 1
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    
    // MARK: - Properties
    static let identifier = "OptionCardCell"
    var bag = Set<AnyCancellable>()
    lazy var tapAddButtonPublisher = addButton.tapPublisher()
    var isAdded: Bool = false {
        willSet {
            newValue ? select() : deselect()
        }
    }
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        deselect()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
        setLayout()
        deselect()
    }
    
    // MARK: - Helpers
    private func setUI() {
        layer.masksToBounds = true
        layer.cornerRadius = 8
        [optionImageView, nameLabel, priceLabel, addButton].forEach {
            addSubview($0)
        }
    }
    
    private func setLayout() {
        optionImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            optionImageView.topAnchor.constraint(equalTo: topAnchor),
            optionImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            optionImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            optionImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.58),
            
            nameLabel.topAnchor.constraint(equalTo: optionImageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 9),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 9),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9),
            addButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setup(with model: OptionCardViewModel) {
        isAdded = model.isAdded
        nameLabel.text = model.name
        priceLabel.text = "+ " + .decimalStyle(from: model.price) + " 원"
    }
    
    func select() {
        backgroundColor = .hyundaiPrimaryBlue.withAlphaComponent(0.1)
        nameLabel.textColor = .hyundaiPrimaryBlue
        priceLabel.textColor = .hyundaiPrimaryBlue
        addButton.backgroundColor = .hyundaiNavy
        addButton.setTitle("추가 완료", for: .normal)
        addButton.setImage(
            UIImage(systemName: "checkmark")?.withTintColor(.hyundaiNeutral).resized(to: 10),
            for: .normal
        )
        addButton.setTitleColor(.hyundaiNeutral, for: .normal)
        
    }
    
    func deselect() {
        backgroundColor = .hyundaiLightSand
        nameLabel.textColor = .hyundaiBlackGray
        priceLabel.textColor = .hyundaiBlackGray
        addButton.backgroundColor = .hyundaiNeutral
        addButton.setTitle("추가하기", for: .normal)
        addButton.setImage(nil, for: .normal)
        addButton.setTitleColor(.hyundaiBlue, for: .normal)
    }
}
