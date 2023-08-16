//
//  SummaryViewController.swift
//  TopCariving
//
//  Created by cho seungki on 2023/08/15.
//

import UIKit

class SummaryViewController: UIViewController {
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
        collectionView.register(SummaryHeaderView.self,
                                forSupplementaryViewOfKind: "header",
                                withReuseIdentifier: SummaryHeaderView.identifier)
        return collectionView
    }()
    private let collectionViewLayout: UICollectionViewLayout = {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .absolute(22)))
        let headerAnchor = NSCollectionLayoutAnchor(edges: [.top])
        
        let header = NSCollectionLayoutSupplementaryItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1),
                              heightDimension: .absolute(42)),
            elementKind: "header",
            containerAnchor: headerAnchor
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(widthDimension: .fractionalWidth(1),
                              heightDimension: .fractionalHeight(1)),
            subitems: [item]
        )
        group.interItemSpacing = .fixed(8)
        group.supplementaryItems = [header]
        
        return UICollectionViewCompositionalLayout(section: .init(group: group))
    }()
    // MARK: - Property
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    // MARK: - Helper
    private func setUI() {
        view.backgroundColor = .blue
        [titleLabel, collectionView].forEach {
            view.addSubview($0)
        }
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    private func setLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension SummaryViewController: UICollectionViewDelegate {
    
}

extension SummaryViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: "header",
            withReuseIdentifier: SummaryHeaderView.identifier,
            for: indexPath
        ) as? SummaryHeaderView else { return UICollectionReusableView() }
        
        header.setup(with: "총 견적 금액")
        
        return header
    }
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SummaryCell.identifier,
            for: indexPath
        ) as? SummaryCell else { return UICollectionViewCell() }
        return cell
    }
}
