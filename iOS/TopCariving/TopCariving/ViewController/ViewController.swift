//
//  ViewController.swift
//  TopCariving
//
//  Created by Eunno An on 2023/08/01.
//

import Combine
import UIKit

class ViewController: BaseMyCarViewController {
    // MARK: - UI properties
    let optionSelectView = OptionSelectView()
    private let separatorView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .hyundaiLightSand
        return view
    }()
    let reviewView = MyCarTagReviewView()
    let optionDescriptionCollection = OptionDescriptionCollectionView()
    let optionDescription = OptionDescriptionView()
    
    // MARK: - Properties
    var bag: Set<AnyCancellable> = .init()
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        
        injectMock()
        optionSelectView.refresh()
    }
    
    // MARK: - Helpers
    private func setUI() {
        view.backgroundColor = .white
        optionSelectView.datasource = self
        [optionSelectView, separatorView, reviewView, optionDescriptionCollection, optionDescription].forEach {
            view.addSubview($0)
        }
    }
    private func setLayout() {
        NSLayoutConstraint.activate([
            optionSelectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            optionSelectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            optionSelectView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            optionSelectView.heightAnchor.constraint(equalTo: optionSelectView.widthAnchor, multiplier: 0.65),
            
            separatorView.topAnchor.constraint(equalTo: optionSelectView.bottomAnchor, constant: 0),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 6),
            
            reviewView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 20),
            reviewView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            reviewView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            optionDescriptionCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -151),
            optionDescriptionCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            optionDescriptionCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            optionDescriptionCollection.heightAnchor.constraint(equalToConstant: 131),
            
            optionDescription.topAnchor.constraint(equalTo: optionDescriptionCollection.bottomAnchor, constant: 5),
            optionDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            optionDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

    private func injectMock() {
        reviewViewMock()
        optionDescriptionMock()
        optionDescriptionCollectionMock()
        optionSelectViewMock()
    }
    // swiftlint: disable line_length
    private func reviewViewMock() {
        reviewView.refresh(by: ["어린이👶", "이것만 있으면 나도 주차고수🚘", "대형견도 문제 없어요🐶", "큰 짐도 OK🧳"], with: "컴포트 II")
    }
    
    private func optionDescriptionMock() {
        optionDescription.setup(with: OptionDescriptionViewModel(index: 0, maxIndex: 6, title: "헤드업 디스플레이",
                                                                 optionDescription: "주요 주행 정보를 전면 윈드실드에 표시하며, 밝기가 최적화되어 주간에도 시인성이 뛰어납니다."))
    }
    
    private func optionDescriptionCollectionMock() {
        optionDescriptionCollection.refresh(by: (0..<6).map {
            OptionDescriptionViewModel(index: $0, maxIndex: 6,
                                       title: "헤드업 디스플레이",
                                       optionDescription: "동승석의 시트 포지션을 조정하여 동승자의 체형에 맞는 편안한 자세를 유지할 수 있도록 돕는 기능입니다. 8방향(시트백 기울기, 시트 앞/뒤 이동,  앞/뒤 높이 조절)으로 조절이 기능하고 운전자 및 뒷좌석(2열) 승객이 동승석 시트 위치를 조절할 수 있는 워크인 디바이스를 적용하여 실내 공간 활용 편의성을 높였습니다.")
        })
    }
    
    private func optionSelectViewMock() {
        optionSelectView.tapAddButtonSubject.sink(receiveValue: {
            self.data[$0.row].isAdded.toggle()
            self.reviewView.refresh(by: ["어린이👶", "이것만 있으면 나도 주차고수🚘", "대형견도 문제 없어요🐶", "큰 짐도 OK🧳", ["A", "B", "C", "D"].randomElement()!].shuffled(), with: "컴포트 II")
        }).store(in: &bag)
    }
    
    // data는 OptionSelectViewDataSource를 위한 데이터 소스 입니다.
    var data = (0..<6).map { OptionCardViewModel.init(image: "asdf", name: "컴포트 \($0)", price: 400000, isAdded: false) }
}

extension ViewController: OptionSelectViewDataSource {
    func numberOfOption(_ optionSelectView: OptionSelectView) -> Int {
        5
    }
    func optionSelectViewModel(_ optionSelectView: OptionSelectView, at indexPath: IndexPath) -> OptionCardViewModel {
        data[indexPath.row]
    }
}
