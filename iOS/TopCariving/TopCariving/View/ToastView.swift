//
//  ToastView.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/04.
//

import UIKit

class ToastView: TappableView {
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
        paragraphStyle.lineHeightMultiple = 1.48
        label.attributedText = NSMutableAttributedString(
            string: "옵션 선택이 고민되신다면, 아카이\n빙에서 다른 차량을 구경해보세요!",
            attributes: [NSAttributedString.Key.kern: -0.28, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        )
        return label
    }()
    
    // MARK: - Property
    private let padding = 10.0
    var sourceRect: CGRect?
    private var triangleStartX: Double {
        guard let sourceRect else { return frame.width / 2.0 }
        if frame.maxX - 5 < sourceRect.midX { return frame.maxX - 10.0 }
        if frame.minX + 5 > sourceRect.midX { return frame.minX }
        return abs(frame.minX - sourceRect.midX + 5)
    }
    
    // MARK: - LifeCycle
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
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawTriangle()
    }
    
    // MARK: - Helper
    private func drawTriangle() {
        let path = UIBezierPath()
        print(triangleStartX, frame)
        let startPoint = CGPoint(x: triangleStartX, y: padding)
        path.move(to: startPoint)
        
        let leftTopPoint = startPoint.applying(.init(translationX: 4, y: -7))
        path.addLine(to: leftTopPoint)
        
        let rightTopPoint = leftTopPoint.applying(.init(translationX: 2, y: 0))
        let controlPoint = leftTopPoint.applying(.init(translationX: 1, y: -2))
        path.addQuadCurve(to: rightTopPoint, controlPoint: controlPoint)

        let endPoint = CGPoint(x: startPoint.x + 10, y: padding)
        path.addLine(to: endPoint)
        
        path.close()
        UIColor.hyundaiBlackGray.withAlphaComponent(0.5).set()
        path.fill()
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
            
            closeButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 20),
            closeButton.heightAnchor.constraint(equalToConstant: 20),
            
            messageLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: 7.5),
            messageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
}
