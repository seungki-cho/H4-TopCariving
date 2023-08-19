//
//  SelectOptionViewController.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/18.
//

import Combine
import UIKit

class SelectOptionViewController: BaseMyCarViewController {
    
    // MARK: - UI properties
    private let scrollView: UIScrollView = UIScrollView()
    let optionSelectView = OptionSelectView()
    private let separatorView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .hyundaiLightSand
        return view
    }()
    let reviewView = TagReviewView()
    let optionDescriptionCollection = OptionSnapCarouselView()
    
    // MARK: - Properties
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        testInject()
        optionSelectView.refresh()
        setEvent()
    }
    
    // MARK: - Helpers
    override func setUI() {
        super.setUI()
        setProgress(to: .selectOptions)
        optionSelectView.datasource = self
        view.addSubview(scrollView)
        [optionSelectView, separatorView, reviewView, optionDescriptionCollection].forEach {
            scrollView.addSubview($0)
        }
    }
    override func setLayout() {
        super.setLayout()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: progressView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: footerView.topAnchor),
            
            optionSelectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            optionSelectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            optionSelectView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            optionSelectView.heightAnchor.constraint(equalTo: optionSelectView.widthAnchor, multiplier: 0.65),
            
            separatorView.topAnchor.constraint(equalTo: optionSelectView.bottomAnchor, constant: 0),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 6),
            
            reviewView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 20),
            reviewView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            reviewView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            optionDescriptionCollection.topAnchor.constraint(equalTo: reviewView.collectionView.bottomAnchor, constant: 10),
            optionDescriptionCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            optionDescriptionCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            optionDescriptionCollection.heightAnchor.constraint(equalToConstant: 131),
            optionDescriptionCollection.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
        ])
    }

    private func testInject() {
        testReviewView()
        testOptionDescriptionCollection()
        testOptionSelectView()
    }
    // swiftlint: disable line_length
    private func testReviewView() {
        reviewView.refresh(by: ["어린이👶", "이것만 있으면 나도 주차고수🚘", "대형견도 문제 없어요🐶", "큰 짐도 OK🧳"], with: "컴포트 II")
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
    let images = [
        "https://topcariving.s3.ap-northeast-2.amazonaws.com/selected/roa.jpeg",
        "https://topcariving.s3.ap-northeast-2.amazonaws.com/selected/pca.jpeg",
        "https://topcariving.s3.ap-northeast-2.amazonaws.com/selected/2_cooling.jpeg",
        "https://topcariving.s3.ap-northeast-2.amazonaws.com/selected/sun_roof.jpg",
        "https://topcariving.s3.ap-northeast-2.amazonaws.com/selected/cam.jpg",
        "https://topcariving.s3.ap-northeast-2.amazonaws.com/selected/smart_front_collision.jpeg"
    ]
    let names = [
        "컴포트 II",
        "주차보조 시스템 II",
        "2열 통풍 시트",
        "듀얼 와이드 선루프",
        "빌트인 캠(보조배터리 포함)",
        "현대스마트센스 I"
    ]
    let prices = [
        109000000,
        690000,
        400000,
        890000,
        690000,
        790000
    ]
    lazy var data = (0..<6).map { OptionCardViewModel.init(image: self.images[$0], name: self.names[$0], price: self.prices[$0], isAdded: false) }
    private func setEvent() {
        optionSelectView.tapIncludedSubject.sink(receiveValue: { [weak self] in
            guard let self else { return }
            let modalVC = IncludedBaseItemModalViewController()
            modalVC.modalPresentationStyle = .automatic
            self.present(modalVC, animated: true)
        })
        .store(in: &bag)
    }
}

extension SelectOptionViewController: OptionSelectViewDataSource {
    func numberOfOption(_ optionSelectView: OptionSelectView) -> Int {
        5
    }
    func optionSelectViewModel(_ optionSelectView: OptionSelectView, at indexPath: IndexPath) -> OptionCardViewModel {
        data[indexPath.row]
    }
}
