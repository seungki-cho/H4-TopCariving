//
//  ToastView.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/04.
//

import UIKit
import Combine

class ToastView: UIView {
    // MARK: - UI Property
    private let contentView = {
        let view = UIView()
        view.backgroundColor = .hyundaiBlackGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let closeButton = {
        let button = UIButton(type: .close)
        button.setTitleColor(UIColor.hyundaiLightSand, for: .normal)
        return button
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .hyundaiLightSand
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .designSystem(.init(name: .regular, size: ._12))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineHeightMultiple = 1.57
        label.attributedText = NSMutableAttributedString(
            string: "옵션 선택이 고민되신다면, 아카이\n빙에서 다른 차량을 구경해보세요!",
            attributes: [NSAttributedString.Key.kern: -0.24, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        )
        return label
    }()
    
    // MARK: - Property
    private let padding = 10.0
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
        setLayout()
    }
    
    func setUI() {
        backgroundColor = .clear
        addSubview(contentView)
        [closeButton, messageLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setLayout() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            
            closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),
            closeButton.widthAnchor.constraint(equalToConstant: 7.5),
            closeButton.heightAnchor.constraint(equalToConstant: 7.5),
            
            messageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            messageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            messageLabel.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -13),
            messageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13)
        ])
    }
}
