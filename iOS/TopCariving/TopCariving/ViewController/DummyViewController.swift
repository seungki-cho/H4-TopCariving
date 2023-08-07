//
//  DummyViewController.swift
//  TopCariving
//
//  Created by Eunno An on 2023/08/01.
//

import Foundation
import UIKit
import Combine

class DummyViewController: UIViewController {
    
    // MARK: - UI properties
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Helpers
    private func bind(to viewModel: DummyViewModel) {
        let input = DummyViewModel.Input()
        let output = viewModel.transform(input: input)
    }
}

