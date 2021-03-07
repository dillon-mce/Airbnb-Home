//
//  BackgroundView.swift
//  Airbnb Home
//
//  Created by Dillon McElhinney on 3/6/21.
//

import UIKit

enum BackgroundStyle: String, CaseIterable {
    case inverted

    var elementKind: String { "background.\(rawValue)" }

    var viewClass: AnyClass {
        switch self {
        case .inverted: return InvertedBackgroundView.self
        }
    }
}

class BackgroundView: UICollectionReusableView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = provideBackgroundColor()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = provideBackgroundColor()
    }

    func provideBackgroundColor() -> UIColor? {
        return nil
    }
}

final class InvertedBackgroundView: BackgroundView {
    override func provideBackgroundColor() -> UIColor? {
        .invertedBackground
    }
}

// MARK: - Helpers

extension UICollectionViewLayout {
    func registerBackgrounds() {
        BackgroundStyle.allCases.forEach {
            register($0.viewClass, forDecorationViewOfKind: $0.elementKind)
        }
    }
}

extension NSCollectionLayoutSection {
    func addBackground(style: BackgroundStyle) {
        decorationItems.append(.background(elementKind: style.elementKind))
    }
}
