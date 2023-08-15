//
//  ViewController.swift
//  TopCariving
//
//  Created by Eunno An on 2023/08/01.
//

import Combine
import UIKit

class ViewController: BaseMyCarViewController {
    var bag: Set<AnyCancellable> = .init()
    private let colorSelectionView = ColorSelectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(colorSelectionView)
        
        NSLayoutConstraint.activate([
            colorSelectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            colorSelectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            colorSelectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            colorSelectionView.heightAnchor.constraint(equalToConstant: 92)
        ])
        
        let images = (0..<19).map { "\($0)" }
        let names = (0..<19).map { "문라이트 블루펄\($0)" }
        colorSelectionView.setCategoryName(to: "외장")
        colorSelectionView.refresh(by: images)
        colorSelectionView.setColorName(to: "문라이트 블루펄")
        
        colorSelectionView.tapColorSubject.sink(receiveValue: {
            self.colorSelectionView.setColorName(to: names[$0.row])
        }).store(in: &bag)
    }
}
