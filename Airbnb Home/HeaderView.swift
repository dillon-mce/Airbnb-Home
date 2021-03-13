//
//  HeaderView.swift
//  Airbnb Home
//
//  Created by Dillon McElhinney on 2/27/21.
//

import Anchorage
import UIKit

protocol HeaderViewDelegate: AnyObject {
    func updateStatusBarStyle(to style: UIStatusBarStyle)
}

class HeaderView: ProgrammaticView {

    // MARK: - Public Properties

    weak var delegate: HeaderViewDelegate?

    private var statusBarStyle: UIStatusBarStyle = .lightContent {
        didSet { delegate?.updateStatusBarStyle(to: statusBarStyle) }
    }

    private lazy var minHeight: CGFloat = { 44 + 12 + 12 + safeAreaInsets.top }()
    private let maxHeight: CGFloat = 600
    private var heightConstraint = NSLayoutConstraint()
    private var maxTopSpace: CGFloat = 40
    private var topSpaceConstraint = NSLayoutConstraint()

    private let card = UIView()
    private let imageView = UIImageView()
    private let searchContainer = UIView()
    private let searchBar = UIButton(type: .roundedRect)
    private let titleLabel = UITextView()
    private let button = UIButton(type: .roundedRect)
    private let separator = UIView()

    override func configure() {
        backgroundColor = .black

        card.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        card.layer.cornerRadius = 20
        card.layer.masksToBounds = true

        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "background")

        searchContainer.backgroundColor = .systemBackground
        searchContainer.setBackgroundAlpha(0)

        searchBar.backgroundColor = .secondarySystemBackground
        searchBar.layer.cornerRadius = 22
        searchBar.setTitle("Where are you going?", for: .normal)
        searchBar.setTitleColor(.label, for: .normal)
        searchBar.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchBar.tintColor = .systemPink
        searchBar.titleLabel?.font = .custom(style: .button)
        searchBar.imageView?.contentMode = .scaleAspectFit
        searchBar.imageEdgeInsets = .init(top: 14, left: 0, bottom: 14, right: 4)

        titleLabel.text = "Go\nNear"
        titleLabel.textColor = .white
        titleLabel.font = .custom(style: .largeTitle)
        titleLabel.setLineHeightMultiple(to: 0.7)
        titleLabel.isScrollEnabled = false
        titleLabel.isEditable = false
        titleLabel.isSelectable = false
        titleLabel.backgroundColor = .clear

        button.backgroundColor = .secondarySystemBackground
        button.layer.cornerRadius = 6
        button.setTitle("Explore nearby stays", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = .custom(style: .button)
        button.contentEdgeInsets = .init(top: 8, left: 8, bottom: 8, right: 8)

        separator.backgroundColor = .quaternaryLabel
    }

    override func constrain() {
        addSubviews(card, titleLabel, button, separator)
        card.addSubviews(imageView, searchContainer)
        searchContainer.addSubview(searchBar)

        heightConstraint = heightAnchor == maxHeight

        topSpaceConstraint = card.topAnchor == topAnchor + maxTopSpace
        card.horizontalAnchors == horizontalAnchors
        card.bottomAnchor == bottomAnchor

        imageView.edgeAnchors == card.edgeAnchors

        searchContainer.topAnchor == card.topAnchor
        searchContainer.horizontalAnchors == card.horizontalAnchors
        searchContainer.heightAnchor >= 60

        searchBar.heightAnchor == 44
        searchBar.topAnchor >= searchContainer.topAnchor + 24
        searchBar.topAnchor >= safeAreaLayoutGuide.topAnchor + 12
        searchBar.horizontalAnchors == searchContainer.horizontalAnchors + 24
        searchBar.bottomAnchor == searchContainer.bottomAnchor - 12

        titleLabel.topAnchor == safeAreaLayoutGuide.topAnchor + 160
        titleLabel.leadingAnchor == leadingAnchor + 24

        button.topAnchor == titleLabel.bottomAnchor
        button.leadingAnchor == titleLabel.leadingAnchor

        separator.heightAnchor == 1
        separator.horizontalAnchors == horizontalAnchors
        separator.bottomAnchor == bottomAnchor
    }

    override func safeAreaInsetsDidChange() {
        maxTopSpace = 40 + safeAreaInsets.top
        topSpaceConstraint.constant = maxTopSpace
    }
}

// MARK: - Animation

extension HeaderView {

    private var currentOffset: CGFloat {
        get { heightConstraint.constant }
        set { animate(to: newValue) }
    }

    func updateHeader(newY: CGFloat, oldY: CGFloat) -> CGFloat {
        let delta = newY - oldY

        let isMovingUp = delta > 0
        let isInContent = newY > 0
        let hasRoomToCollapse = currentOffset > minHeight
        let shouldCollapse = isMovingUp && isInContent && hasRoomToCollapse

        let isMovingDown = delta < 0
        let isBeyondContent = newY < 0
        let hasRoomToExpand = currentOffset < maxHeight
        let shouldExpand = isMovingDown && isBeyondContent && hasRoomToExpand

        if shouldCollapse || shouldExpand {
            currentOffset -= delta
            return newY - delta
        }

        return newY
    }

    private func animate(to value: CGFloat) {
        let clamped = max(min(value, maxHeight), minHeight)
        heightConstraint.constant = clamped
        let normalized = (value - minHeight) / (maxHeight - minHeight)
        switch normalized {
        case ..<0.5:
            animateToFifty(normalized)
        default:
            animateToOneHundred(normalized)
        }
    }

    private func animateToFifty(_ normalized: CGFloat) {
        let newTop = normalized * 2 * maxTopSpace
        topSpaceConstraint.constant = newTop
        searchContainer.setBackgroundAlpha(1 - normalized * 2)
        if newTop < 24 && statusBarStyle != .darkContent {
            statusBarStyle = .darkContent
        } else if newTop > 24 && statusBarStyle != .lightContent {
            statusBarStyle = .lightContent
        }
    }

    private func animateToOneHundred(_ normalized: CGFloat) {
        topSpaceConstraint.constant = maxTopSpace
        searchContainer.setBackgroundAlpha(0)
    }
}
