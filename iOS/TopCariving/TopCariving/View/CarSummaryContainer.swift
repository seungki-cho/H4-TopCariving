//
//  CarSummaryContainerCell.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/03.
//

import UIKit
import Combine

protocol Foldable {
    var heightConstant: NSLayoutConstraint? { get set }
    
    func fold()
    func unfold()
}

class FoldableView: UIView, Foldable {
    // MARK: - UI properties
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .designSystem(.init(name: .bold, size: ._18))
        #warning("제거")
        label.text = "1. Le Blanc"
        label.textColor = .hyundaiPrimaryBlue
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .designSystem(.init(name: .bold, size: ._18))
        label.textColor = .hyundaiPrimaryBlue
        #warning("제거")
        label.text = "47,720,000"
        label.textAlignment = .right
        return label
    }()
    
    private let wonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .designSystem(.init(name: .regular, size: ._12))
        label.textColor = .hyundaiPrimaryBlue
        label.text = "원"
        return label
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor(red: 0, green: 0.173, blue: 0.373, alpha: 0.6).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    // MARK: - Properties
    var heightConstant: NSLayoutConstraint?
    var tapSubject = PassthroughSubject<Any, Never>()
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        unfold()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
        setLayout()
        unfold()
    }
    
    // MARK: - Helpers
    func setUI() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped(sender:)))
        addGestureRecognizer(tapGesture)
        layer.cornerRadius = 8
        
        [titleLabel, priceLabel, wonLabel, separator].forEach {
            addSubview($0)
        }
    }
    
    @objc private func tapped(sender: Any) {
        tapSubject.send(self)
    }
    
    func setLayout() {
        separator.translatesAutoresizingMaskIntoConstraints = false
        heightConstant = heightAnchor.constraint(equalToConstant: 71)
        heightConstant?.isActive = true
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            titleLabel.heightAnchor.constraint(equalToConstant: 27),
            
            wonLabel.topAnchor.constraint(equalTo: topAnchor, constant: 28),
            wonLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            wonLabel.heightAnchor.constraint(equalToConstant: 22),
            wonLabel.widthAnchor.constraint(equalToConstant: 15),
            
            priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 23),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: wonLabel.leadingAnchor, constant: -4),
            priceLabel.heightAnchor.constraint(equalToConstant: 31),
            
            separator.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func fold() {
        separator.isHidden = true
        layer.borderWidth = 0
        backgroundColor = UIColor.hyundaiLightSand
    }
    
    func unfold() {
        separator.isHidden = false
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0, green: 0.173, blue: 0.373, alpha: 0.6).cgColor
        backgroundColor = UIColor(red: 0, green: 0.173, blue: 0.373, alpha: 0.1)
    }
}

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
    
    func setIcons(to iconInfo: [(image: String, text: String)]) {
        iconInfo.forEach { (image, text) in
            let stackView = UIStackView(arrangedSubviews: [makeIconImageView(by: image), makeIconLabel(by: text)])
            stackView.axis = .vertical
            iconStackView.addArrangedSubview(stackView)
        }
    }
    
    private func makeIconImageView(by imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    private func makeIconLabel(by text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .designSystem(.init(name: .regular, size: ._14))
        label.textColor = .hyundaiPrimaryBlue
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineHeightMultiple = 1.48
        label.attributedText = NSMutableAttributedString(
            string: text,
            attributes: [NSAttributedString.Key.kern: -0.28, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        )
        return label
    }
}
