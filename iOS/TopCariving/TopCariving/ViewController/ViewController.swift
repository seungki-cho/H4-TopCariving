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
    var myView: UIView = {
        var view: UIView = UIView(frame: .init(x: 100, y: 150, width: 200, height: 200))
        view.backgroundColor = .red
        return view
    }()
    
    let colorimageview = ColorImageLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
        view.addSubview(colorimageview)
        
        NSLayoutConstraint.activate([
            colorimageview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            colorimageview.heightAnchor.constraint(equalToConstant: 24),
            colorimageview.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        myView.tapPublisher().sink { _ in
            self.colorimageview.setup(with: "외장", image: "book.closed.fill", name: "book.closed.fill")
            self.present(SummaryViewController(), animated: true)
        }.store(in: &bag)
        
        view.backgroundColor = .white
        
    }
}
