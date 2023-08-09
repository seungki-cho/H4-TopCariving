//
//  TCLabel.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/08.
//
import UIKit

class TCLabel: UILabel {
    // MARK: - UI properties
    
    // MARK: - Properties
    private var mutableAttributedString = NSMutableAttributedString()
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    
    // MARK: - Helpers
    private func setUI() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .hyundaiBlackGray
    }
    
    func setFont(to font: HyundaiFont.Custom) {
        self.font = .designSystem(font)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineHeightMultiple = font.size.lineHeight / font.size.rawValue
        mutableAttributedString.setAttributes([NSAttributedString.Key.kern: font.size.kern,
                                               NSAttributedString.Key.paragraphStyle: paragraphStyle],
                                              range: NSRange(0..<mutableAttributedString.length))
        attributedText = mutableAttributedString
    }
    
    func setText(to text: String) {
        self.text = text
    }
}
