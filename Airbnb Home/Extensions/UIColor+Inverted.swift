//
//  UIColor+Inverted.swift
//  Airbnb Home
//
//  Created by Dillon McElhinney on 3/6/21.
//

import UIKit

extension UIColor {
    static let invertedBackground: UIColor = .init { traits in
        systemBackground.resolvedColor(with: traits.invertedStyle())
    }

    static let invertedLabel: UIColor = .init { traits in
        label.resolvedColor(with: traits.invertedStyle())
    }
}

enum ColorStyle {
    case standard, inverted
}
