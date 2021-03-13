//
//  UIView+Helpers.swift
//  Airbnb Home
//
//  Created by Dillon McElhinney on 2/27/21.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { view in addSubview(view) }
    }
    
    func setBackgroundAlpha(_ alpha: CGFloat) {
        backgroundColor = backgroundColor?.withAlphaComponent(alpha)
    }
}
