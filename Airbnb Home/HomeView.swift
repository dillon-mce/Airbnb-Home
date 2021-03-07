//
//  HomeView.swift
//  Airbnb Home
//
//  Created by Dillon McElhinney on 2/27/21.
//

import Anchorage
import UIKit

class HomeView: ProgrammaticView {

    private let headerView = HeaderView()
    private lazy var collectionView = makeCollectionView()
    private lazy var dataSouce = makeDataSource()

    override func configure() {
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = dataSouce
    }

    override func constrain() {
        addSubviews(headerView, collectionView)

        headerView.topAnchor == topAnchor
        headerView.horizontalAnchors == horizontalAnchors
        headerView.bottomAnchor == collectionView.topAnchor

        collectionView.horizontalAnchors == horizontalAnchors
        collectionView.bottomAnchor == bottomAnchor
    }

    func apply(_ snapshot: NSDiffableDataSourceSnapshot<Section, Content>) {
        dataSouce.apply(snapshot)
    }
}

// MARK: - Collection View

private extension HomeView {
    func makeCollectionView() -> UICollectionView {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let section = Section.allCases[sectionIndex]
            switch section {
            case .nearby:
                return .sideScrollingTwoItem()
            case .experiences:
                return .invertedSideScrollingOneItem()
            default:
                return .sideScrollingOneItem()
            }
        }
        layout.registerBackgrounds()
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }
}

// MARK: - Data Source

private extension HomeView {
    func makeDataSource() -> UICollectionViewDiffableDataSource<Section, Content> {
        let dataSource = UICollectionViewDiffableDataSource<Section, Content>(
            collectionView: collectionView) { view, indexPath, item in
            let section = Section.allCases[indexPath.section]
            switch section {
            case .nearby:
                let registration = SmallSquareCell.registration()
                return view.dequeueConfiguredReusableCell(using: registration,
                                                          for: indexPath,
                                                          item: item)
            case .experiences:
                let registration = InvertedLargeSquareCell.registration()
                return view.dequeueConfiguredReusableCell(using: registration,
                                                          for: indexPath,
                                                          item: item)
            default:
                let registration = LargeSquareCell.registration()
                return view.dequeueConfiguredReusableCell(using: registration,
                                                          for: indexPath,
                                                          item: item)
            }
        }
        let headers = Section.allCases.map { $0.headerContent }
        let headerRegistration = SectionHeader.registration(headers: headers)
        let invertedHeaderRegistration = InvertedHeader.registration(headers: headers)
        dataSource.supplementaryViewProvider = { collectionView, string, indexPath in
            let section = Section.allCases[indexPath.section]
            switch section {
            case .experiences:
                return collectionView
                    .dequeueConfiguredReusableSupplementary(using: invertedHeaderRegistration,
                                                            for: indexPath)
            default:
                return collectionView
                    .dequeueConfiguredReusableSupplementary(using: headerRegistration,
                                                            for: indexPath)
            }
        }
        return dataSource
    }
}
