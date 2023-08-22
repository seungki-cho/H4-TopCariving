//
//  ArchivingDetailHeader.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/22.
//

import UIKit

class ArchivingDetailHeader: UICollectionReusableView {
    // MARK: - UI properties
    private let testImageView = UIImageView(image: UIImage(named: "TestSummary")?.resized(to: UIScreen.main.bounds.width - 32))
    private let overallLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setFont(to: .init(name: .medium, size: ._14))
        label.text = "총평 후기"
        label.textColor = .hyundaiBlackGray
        return label
    }()
    private let reviewLabelBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .hyundaiLightSand
        view.layer.cornerRadius = 8
        return view
    }()
    private let reviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setFont(to: .init(name: .regular, size: ._14))
        label.textColor = .hyundaiBlackGray
        label.numberOfLines = 0
        return label
    }()
    // MARK: - Properties
    static let identifier = "ArchivingDetailHeader"
    
    // MARK: - Lifecycles
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
    // MARK: - Helpers
    private func setUI() {
        backgroundColor = .white
        [testImageView, overallLabel, reviewLabelBackgroundView, reviewLabel].forEach {
            addSubview($0)
        }
    }
    private func setLayout() {
        testImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testImageView.topAnchor.constraint(equalTo: topAnchor),
            testImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            testImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            testImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.15),
            
            overallLabel.topAnchor.constraint(equalTo: testImageView.bottomAnchor, constant: 23),
            overallLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            overallLabel.widthAnchor.constraint(equalToConstant: 60),
            overallLabel.heightAnchor.constraint(equalToConstant: 22),
            
            reviewLabelBackgroundView.topAnchor.constraint(equalTo: overallLabel.bottomAnchor, constant: 16),
            reviewLabelBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            reviewLabelBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            reviewLabelBackgroundView.bottomAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 12),
            
            reviewLabel.topAnchor.constraint(equalTo: reviewLabelBackgroundView.topAnchor, constant: 12),
            reviewLabel.leadingAnchor.constraint(equalTo: reviewLabelBackgroundView.leadingAnchor, constant: 17),
            reviewLabel.trailingAnchor.constraint(equalTo: reviewLabelBackgroundView.trailingAnchor, constant: -17),
            
            bottomAnchor.constraint(equalTo: reviewLabelBackgroundView.bottomAnchor, constant: 20)
        ])
    }
    func setUp(with review: String) {
        reviewLabel.text = review
    }
}
