//
//  ArchivingDetailViewController.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/22.
//

import UIKit

class ArchivingDetailViewController: BaseArchivingViewController {
    // MARK: - UI properties
    private let detailView = ArchivingDetailView()

    // MARK: - Properties
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setNavigationBar()
    }
    
    // MARK: - Helpers
    private func setUI() {
        view.addSubview(detailView)
    }
    private func setLayout() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    private func setNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .hyundaiSand
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .hyundaiBlackGray
        let topCarivingImage = UIImage(named: "MyCariving")?.resized(to: 78)
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(image: topCarivingImage,
                                                                                   style: .done,
                                                                                   target: nil,
                                                                                   action: nil)
    }
}
