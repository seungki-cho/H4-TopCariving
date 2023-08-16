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
    private let colorSelectionView = ColorSelectionView()
    
    // MARK: - Lifecycles
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
    
    private func testOptionDescription() {
        optionDescription.setUp(with: OptionDescriptionViewModel(index: 0, maxIndex: 6, title: "헤드업 디스플레이",
                                                                 optionDescription: "주요 주행 정보를 전면 윈드실드에 표시하며, 밝기가 최적화되어 주간에도 시인성이 뛰어납니다."))
    }
    
    private func testOptionDescriptionCollection() {
        optionDescriptionCollection.refresh(by: (0..<6).map {
            OptionDescriptionViewModel(index: $0, maxIndex: 6,
                                       title: "헤드업 디스플레이",
                                       optionDescription: "동승석의 시트 포지션을 조정하여 동승자의 체형에 맞는 편안한 자세를 유지할 수 있도록 돕는 기능입니다. 8방향(시트백 기울기, 시트 앞/뒤 이동,  앞/뒤 높이 조절)으로 조절이 기능하고 운전자 및 뒷좌석(2열) 승객이 동승석 시트 위치를 조절할 수 있는 워크인 디바이스를 적용하여 실내 공간 활용 편의성을 높였습니다.")
        })
    }
    
    private func testOptionSelectView() {
        optionSelectView.tapAddButtonSubject.sink(receiveValue: { _ in
            self.reviewView.refresh(by: ["어린이👶", "이것만 있으면 나도 주차고수🚘", "대형견도 문제 없어요🐶", "큰 짐도 OK🧳", ["A", "B", "C", "D"].randomElement()!].shuffled(), with: "컴포트 II")
        }).store(in: &bag)
    }
    
    // data는 OptionSelectViewDataSource를 위한 데이터 소스 입니다.
    var data = (0..<6).map { OptionCardViewModel.init(image: "TopArchivingButton", name: "컴포트 \($0)", price: 400000, isAdded: false) }
}

extension ViewController: OptionSelectViewDataSource {
    func numberOfOption(_ optionSelectView: OptionSelectView) -> Int {
        5
    }
    func optionSelectViewModel(_ optionSelectView: OptionSelectView, at indexPath: IndexPath) -> OptionCardViewModel {
        data[indexPath.row]
    }
    
}
