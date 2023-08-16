//
//  SummaryViewController.swift
//  TopCariving
//
//  Created by cho seungki on 2023/08/15.
//

import UIKit

class SummaryViewController: UIViewController {
    enum Section: Int, CaseIterable {
        case trim
        case color
        case option
    }
    
    // MARK: - UI Property
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setFont(to: .init(name: .medium, size: ._18))
        label.text = "견적요약보기"
        return label
    }()
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SummaryCell.self, forCellWithReuseIdentifier: SummaryCell.identifier)
        collectionView.register(SummaryColorCell.self, forCellWithReuseIdentifier: SummaryColorCell.identifier)
        collectionView.register(SummaryHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SummaryHeaderView.identifier)
        collectionView.dataSource = self
        return collectionView
    }()
    private lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.minimumInteritemSpacing = 8
        layout.itemSize = .init(width: width, height: 22)
        layout.headerReferenceSize = .init(width: width, height: 42)
        layout.sectionInset = .init(top: 20, left: 0, bottom: 20, right: 0)
        layout.minimumLineSpacing = 12
        return layout
    }()
    // MARK: - Property
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.prefersGrabberVisible = true
            sheetPresentationController.detents = [.custom { _ in UIScreen.main.bounds.height * 0.8 }, .large()]
        }
    }
    
    // MARK: - Helper
    private func setUI() {
        view.backgroundColor = .white
        [titleLabel, collectionView].forEach {
            view.addSubview($0)
        }
    }
    private func setLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension SummaryViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Section.allCases.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .trim:
            return 2
        case .color:
            return 2
        case .option:
            return 5
        default:
            return 0
        }
    }
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: SummaryHeaderView.identifier,
            for: indexPath
        ) as? SummaryHeaderView else { return UICollectionReusableView() }
        
        switch Section(rawValue: indexPath.section) {
        case .trim:
            header.setup(with: "총 견적 금액", price: "47,720,000")
        case .color:
            header.setup(with: "색상")
        case .option:
            header.setup(with: "선택옵션 \(1)개")
        default:
            break
        }
        
        return header
    }
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch Section(rawValue: indexPath.section) {
        case .trim, .option:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SummaryCell.identifier,
                for: indexPath
            ) as? SummaryCell else { break }
            cell.setup(with: "펠리세이드 Le Blanc", price: "+42,420,240")
            return cell
        case .color:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SummaryColorCell.identifier,
                for: indexPath
            ) as? SummaryColorCell else { break }
            cell.setUp(with: "외장", image: "hi", name: "검정")
            return cell
        default:
            break
        }
        return UICollectionViewCell()
    }
}
