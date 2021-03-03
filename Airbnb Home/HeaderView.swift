//
//  HeaderView.swift
//  Airbnb Home
//
//  Created by Dillon McElhinney on 2/27/21.
//

import Anchorage
import UIKit

class HeaderView: ProgrammaticView {
    override func configure() {
        backgroundColor = .systemTeal
    }

    override func constrain() {
        heightAnchor == 100
    }
}
