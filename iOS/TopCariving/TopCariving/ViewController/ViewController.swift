//
//  ViewController.swift
//  TopCariving
//
//  Created by Eunno An on 2023/08/01.
//

import Combine
import UIKit

class ViewController: BaseMyCarViewController {
    // MARK: - Properties
    var bag = Set<AnyCancellable>()
    var myView: UIView = {
        var view: UIView = UIView(frame: .init(x: 100, y: 150, width: 200, height: 200))
        view.backgroundColor = .red
        return view
    }()
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)

        view.backgroundColor = .white
        myView.tapPublisher().sink { _ in
            let summary = SummaryViewController()
            summary.modalPresentationStyle = .pageSheet
            self.present(summary, animated: true)
        }.store(in: &bag)
    }
}
