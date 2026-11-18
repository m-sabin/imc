//
//  HeightDetailView.swift
//  Imci
//
//  Created by sabin on 17/11/26.
//

import UIKit

final class HeightDetailView: UIView {
    let heightSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 100
        slider.maximumValue = 220
        slider.minimumTrackTintColor = .primary
        slider.maximumTrackTintColor = .white
        slider.value = 175
        slider.isContinuous = true
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()

    let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continuar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        button.backgroundColor = .primary
        button.tintColor = .black
        button.layer.cornerRadius = 18
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Qual é sua altura?"
        label.textColor = .white
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "A altura ajuda a personalizar e a acompanhar o progresso no condicionamento físico com precisão."
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let heightLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let minHeightLabel: UILabel = {
        let label = UILabel()
        label.text = "100 cm"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()

    private let maxHeightLabel: UILabel = {
        let label = UILabel()
        label.text = "220 cm"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()

    private lazy var heightRangeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            minHeightLabel,
            maxHeightLabel
        ])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        updateHeight(Double(heightSlider.value))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateHeight(_ height: Double) {
        let number = String(Int(height))
        let text = NSMutableAttributedString(
            string: "\(number) cm",
            attributes: [
                .foregroundColor: UIColor.white
            ]
        )

        let numberRange = NSRange(location: 0, length: number.count)
        text.addAttribute(
            .foregroundColor,
            value: UIColor.primary,
            range: numberRange
        )
        text.addAttribute(
            .font,
            value: UIFont.systemFont(ofSize: 55, weight: .bold),
            range: numberRange
        )

        heightLabel.attributedText = text
    }

    private func setupView() {
        backgroundColor = .black

        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(heightLabel)
        addSubview(heightSlider)
        addSubview(heightRangeStackView)
        addSubview(continueButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 32
            ),
            titleLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 24
            ),
            titleLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -24
            ),

            descriptionLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 18
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 24
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -24
            ),

            heightLabel.bottomAnchor.constraint(
                equalTo: heightSlider.topAnchor,
                constant: -16
            ),
            heightLabel.centerXAnchor.constraint(
                equalTo: heightSlider.centerXAnchor
            ),

            heightSlider.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 24
            ),
            heightSlider.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -24
            ),
            heightSlider.centerYAnchor.constraint(equalTo: centerYAnchor),

            heightRangeStackView.topAnchor.constraint(
                equalTo: heightSlider.bottomAnchor,
                constant: -10
            ),
            heightRangeStackView.leadingAnchor.constraint(
                equalTo: heightSlider.leadingAnchor
            ),
            heightRangeStackView.trailingAnchor.constraint(
                equalTo: heightSlider.trailingAnchor
            ),

            continueButton.widthAnchor.constraint(equalToConstant: 250),
            continueButton.heightAnchor.constraint(equalToConstant: 42),
            continueButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            continueButton.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor,
                constant: -45
            )
        ])
    }
}


#Preview{
    HeightDetailView()
}
