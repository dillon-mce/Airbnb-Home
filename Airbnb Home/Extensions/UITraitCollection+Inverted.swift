//
//  UITraitCollection+Inverted.swift
//  Airbnb Home
//
//  Created by Dillon McElhinney on 3/6/21.
//

import UIKit

extension UITraitCollection {
    private static let lightStyle: UITraitCollection = .init(userInterfaceStyle: .light)
    private static let darkStyle: UITraitCollection = .init(userInterfaceStyle: .dark)

    func invertedStyle() -> UITraitCollection {
        switch userInterfaceStyle {
        case .dark:
            return UITraitCollection.init(traitsFrom: [self, Self.lightStyle])
        case .light, .unspecified:
            return UITraitCollection.init(traitsFrom: [self, Self.darkStyle])
        @unknown default:
            return self
        }
    }
}
