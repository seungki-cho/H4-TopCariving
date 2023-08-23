//
//  ViewController.swift
//  TopCariving
//
//  Created by Eunno An on 2023/08/01.
//

import Combine
import UIKit

class ViewController: BaseMyCarViewController {
    // MARK: - UI properties
    private let scrollView: UIScrollView = UIScrollView()
    private let rotatableView: RotatableOptionImageView = RotatableOptionImageView(frame: .zero)
    private let containerStackView = FoldableStackView()
    
    // MARK: - Properties
    private let viewModel: ModelOptionViewModel
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    init(viewModel: ModelOptionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    override func setUI() {
        super.setUI()
        setProgress(to: .trim)
        view.backgroundColor = .white
        [scrollView, rotatableView, footerView].forEach {
            view.addSubview($0)
        }
        [rotatableView, containerStackView].forEach {
            scrollView.addSubview($0)
        }
    }
    override func setLayout() {
        super.setLayout()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: progressView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: footerView.topAnchor),
            
            rotatableView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: -40),
            rotatableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rotatableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rotatableView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.63),
            
            containerStackView.topAnchor.constraint(equalTo: rotatableView.bottomAnchor),
            containerStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerStackView.widthAnchor.constraint(equalToConstant: view.frame.width - 32),
            containerStackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor,
                                                       constant: -8)
        ])
    }
    private func bind() {
        let output = viewModel.transform(input: .init(
            viewDidLoadPublisher: Just(()).eraseToAnyPublisher(),
        ))
        
    }
    private func setContainer(with models: [CarSummaryContainerModel]) {
        models.forEach { model in
            let view = CarSummaryContainer()
            view.setInfo(to: model.title, price: model.price, icons: model.icons)
            containerStackView.addArrangedSubview(view)
        }
    }
}
