//
//  ViewController.swift
//  TopCariving
//
//  Created by Eunno An on 2023/08/01.
//

import UIKit

class ViewController: UIViewController {
    private let rotatableView: RotatableOptionImageView = RotatableOptionImageView(frame: .zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(rotatableView)
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            rotatableView.topAnchor.constraint(equalTo: view.topAnchor),
            rotatableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rotatableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rotatableView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.63)
        ])
    }
}
