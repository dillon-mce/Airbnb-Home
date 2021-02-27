//
//  HomeViewController.swift
//  Airbnb Home
//
//  Created by Dillon McElhinney on 2/27/21.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var contentView: HomeView = .init()

    override func loadView() {
        view = contentView
    }
}

