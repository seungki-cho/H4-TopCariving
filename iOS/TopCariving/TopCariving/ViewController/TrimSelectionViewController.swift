//
//  TrimSelectionViewController.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/20.
//

import UIKit

class TrimSelectionViewController: BaseMyCarViewController {
    // MARK: - UI properties
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    private let engineImageView = UIImageView()
    private let trimReviewedView = TrimReviewedView()
    private let foldableStackView = FoldableStackView()
    // MARK: - Properties
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        testEngine()
    }
    
    // MARK: - Helpers
    override func setUI() {
        super.setUI()
        setProgress(to: .engine)
        view.backgroundColor = .white
        view.addSubview(scrollView)
        [engineImageView, trimReviewedView, foldableStackView].forEach {
            scrollView.addSubview($0)
        }
    }
    override func setLayout() {
        super.setLayout()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        engineImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: progressView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: footerView.topAnchor),
            
            engineImageView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            engineImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            engineImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            engineImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            engineImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.63),

            trimReviewedView.topAnchor.constraint(equalTo: engineImageView.bottomAnchor, constant: 5),
            trimReviewedView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            trimReviewedView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            trimReviewedView.heightAnchor.constraint(equalToConstant: 36),

            foldableStackView.topAnchor.constraint(equalTo: trimReviewedView.bottomAnchor, constant: 22),
            foldableStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            foldableStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            foldableStackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
}
