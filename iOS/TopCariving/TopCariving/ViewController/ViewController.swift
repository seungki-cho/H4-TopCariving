//
//  ViewController.swift
//  TopCariving
//
//  Created by Eunno An on 2023/08/01.
//

import UIKit
import Combine

final class ViewController: UIViewController {
    // MARK: - UI properties
    private let rotaitionCarImageView = UIImageView()
    private let scrollView: UIScrollView = UIScrollView()
    private let containerStackView = FoldableStackView()
    
    private let testView = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.addTarget(self, action: #selector(tap(sender:)), for: .touchUpInside)
        return view
    }()
    
    // MARK: - Properties
    private var bag = Set<AnyCancellable>()
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
        bind()
    }

    // MARK: - Helpers
    private func bind() {
        
        let testIcons = [(URL(string: "https://topcariving.s3.ap-northeast-2.amazonaws.com/png/leBlanc1.png")! , "20인치\n알로이 휠"),
                       (URL(string: "https://topcariving.s3.ap-northeast-2.amazonaws.com/png/leBlanc2.png")!, "서라운드 뷰\n모니터"),
                       (URL(string: "https://topcariving.s3.ap-northeast-2.amazonaws.com/png/leBlanc3.png")!, "클러스터\n(12.3인 컬러 LCD)")]
        (0..<4).forEach { _ in
            let view = CarSummaryContainer()
            view.setInfo(to: "1. Le Blanc", price: "47,720,000", icons: testIcons)
            containerStackView.addArrangedSubview(view)
        }
        
    }
    
    private func setUI() {
        [scrollView, testView].forEach {
            view.addSubview($0)
        }
        [containerStackView].forEach {
            scrollView.addSubview($0)
        }
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .camera, target: nil, action: nil)
    }
    
    private func setLayout() {
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            containerStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 300),
            containerStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerStackView.widthAnchor.constraint(equalToConstant: view.frame.width - 32),
            containerStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            testView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            testView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -150 ),
            testView.widthAnchor.constraint(equalToConstant: 50),
            testView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func tap(sender: UIButton) {
        let vcc = ToastView(frame: .init(origin: .init(x: sender.frame.maxX - 200, y: sender.frame.maxY + 5),
                                         size: .init(width: 220, height: 90)))
        vcc.sourceRect = sender.frame
        view.addSubview(vcc)
        vcc
            .tapSubject
            .sink(receiveValue: { view in
                guard let view = view as? TappableView else { return }
                view.removeFromSuperview()
                print("hi")
            })
            .store(in: &bag)
    }
}
