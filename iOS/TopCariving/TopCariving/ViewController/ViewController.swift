//
//  ViewController.swift
//  TopCariving
//
//  Created by Eunno An on 2023/08/01.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - UI properties
    let rotaitionCarImageView = UIImageView()
    let scrollView: UIScrollView = UIScrollView()
    let containerStackView: ContainerStackView = {
        let stackView = ContainerStackView()
        return stackView
    }()
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
        bind()
        (0..<4).forEach { _ in 
            let view = CarSummaryContainer()
            view.setIcons(to: [
                ("ic_르블랑_1", "20인치\n알로이 휠"),
                ("ic_르블랑_2", "서라운드 뷰\n모니터"),
                ("ic_르블랑_3", "클러스터\n(12.3인 컬러 LCD)")])
            containerStackView.addArrangedSubview(view)
        }
    }

    // MARK: - Helpers
    private func bind() {
        
    }
    
    private func setUI() {
        [scrollView].forEach {
            view.addSubview($0)
        }
        [containerStackView].forEach {
            scrollView.addSubview($0)
        }
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
            containerStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}
