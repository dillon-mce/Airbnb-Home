//
//  LargeSquareCell.swift
//  Airbnb Home
//
//  Created by Dillon McElhinney on 3/2/21.
//

import Anchorage
import UIKit

typealias LargeSquareCell = ContentCell<LargeSquareView>

class LargeSquareView: ProgrammaticView, ContentConfiguringView {

    private lazy var style: ColorStyle = provideStyle()
    private let mainStack = UIStackView()
    private let imageView = UIImageView()
    private let labelStack = UIStackView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()

    override func configure() {
        mainStack.axis = .vertical
        mainStack.spacing = 10

        imageView.backgroundColor = .secondarySystemFill
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true

        labelStack.axis = .vertical
        labelStack.spacing = 2

        let textColor: UIColor = style == .inverted ? .invertedLabel : .label
        titleLabel.font = .custom(style: .headline)
        titleLabel.textColor = textColor
        subtitleLabel.font = .custom(style: .subheadline)
        subtitleLabel.textColor = textColor
    }

    override func constrain() {
        addSubviews(mainStack)
        mainStack.addArrangedSubviews(imageView, labelStack)
        labelStack.addArrangedSubviews(titleLabel, subtitleLabel)

        mainStack.edgeAnchors == edgeAnchors

        imageView.widthAnchor == imageView.heightAnchor
    }

    func configure(with content: Content?) {
        titleLabel.text = content?.title
        subtitleLabel.text = content?.subtitle
        imageView.image = UIImage(named: content?.image)
    }

    func provideStyle() -> ColorStyle { .standard }
}

typealias InvertedLargeSquareCell = ContentCell<InvertedLargeSquareView>

class InvertedLargeSquareView: LargeSquareView {
    override func provideStyle() -> ColorStyle { .inverted }
}
