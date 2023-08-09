//
//  BaseMyCarViewController.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/09.
//

import UIKit

class BaseMyCarViewController: UIViewController {
    // MARK: - UI properties
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    // MARK: - Helpers
    private func setNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .hyundaiSand
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .hyundaiBlackGray
        let topCarivingImage = UIImage(named: "TopArchivingButton")?.resized(to: 40)
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(image: topCarivingImage,
                                                                                   style: .done,
                                                                                   target: nil,
                                                                                   action: nil)
    }
}
