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
        
        myView.tabPublisher.sink { [weak self] _ in
            guard let self else { return }
            self.testAlert()
        }.store(in: &bag)
    }
    
    private func testAlert() {
        let text = "내 차 만들기를 그만하시겠어요?\n 만들던 차량은 아카이빙>내가 만든 차량 에\n 저장해둘게요"
        let boldText = "아카이빙>내가 만든 차량"
        showAlert(with: .makeBold(text,
                                  boldText: boldText,
                                  font: .init(name: .regular, size: ._14),
                                  boldFont: .init(name: .medium, size: ._14)),
                  acceptTitle: "내 차 만들기 종료",
                  acceptHandler: {
            print("HI")
        })
    }
}
