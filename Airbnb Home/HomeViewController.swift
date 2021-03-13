//
//  HomeViewController.swift
//  Airbnb Home
//
//  Created by Dillon McElhinney on 2/27/21.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var contentView: HomeView = .init()
    private var statusBarStyle: UIStatusBarStyle = .lightContent

    override var preferredStatusBarStyle: UIStatusBarStyle {
        statusBarStyle
    }

    override func loadView() {
        view = contentView
        contentView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateList()
    }

    private func updateList() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Content>()
        snapShot.appendSections(Section.allCases)
        Section.allCases.forEach {
            snapShot.appendItems($0.stubData(), toSection: $0)
        }
        contentView.apply(snapShot)
    }
}

// MARK: - Home View Delegate

extension HomeViewController: HomeViewDelegate {
    func updateStatusBarStyle(to style: UIStatusBarStyle) {
        if statusBarStyle == .lightContent && traitCollection.userInterfaceStyle == .dark {
            return
        }
        statusBarStyle = style
        UIView.animate(withDuration: 0.4) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
}

