//
//  HeightInfoView.swift
//  Imci
//
//  Created by sabin  on 11/11/26.
//

import UIKit

final class HeightDetailViewController: UIViewController {
    
    private var selectedHeight : Double = 175
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Qual é sua altura?"
        label.textColor = .white
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let desciptionLabel: UILabel = {
        let label = UILabel()

        label.text =
            "A altura ajuda a personalizar e a acompanhar o progresso no condicionamento físico com precisão."
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let heightSlider: UISlider = {
        let slider = UISlider()

        slider.minimumValue = 100
        slider.maximumValue = 220
        slider.minimumTrackTintColor = .primary
        slider.maximumTrackTintColor = .white
        slider.setValue(175, animated: true)
        slider.value = 175
        slider.isContinuous = true
        slider.translatesAutoresizingMaskIntoConstraints = false

        return slider
    }()

    private let heightLabel: UILabel = {
        let label = UILabel()

        label.textAlignment = .center

        let text = NSMutableAttributedString(
            string: "175 cm",
            attributes: [
                .foregroundColor: UIColor.white
            ]

        )

        text.addAttribute(
            .foregroundColor,
            value: UIColor.primary,
            range: NSRange(location: 0, length: 3)
        )

        text.addAttribute(
            .font,
            value: UIFont.systemFont(ofSize: 55, weight: .bold),
            range: NSRange(location: 0, length: 3)
        )

        label.attributedText = text

        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let minHeightLevel: UILabel = {
        let label = UILabel()

        label.text = "100 cm"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let maxHeightLevel: UILabel = {
        let label = UILabel()

        label.text = "220 cm"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var levelSlider: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            minHeightLevel,
            maxHeightLevel,

        ])

        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center

        stack.translatesAutoresizingMaskIntoConstraints = false

        return stack
    }()

    private let heightButton: UIButton = {
        let button = UIButton(type: .system)

        button.setTitle("Continuar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        button.backgroundColor = .primary
        button.tintColor = .black
        button.layer.cornerRadius = 18
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupViews()
        setupConstraint()
        setupActions()
        updateHeight()
    }

    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(desciptionLabel)
        view.addSubview(heightButton)
        view.addSubview(heightLabel)
        view.addSubview(heightSlider)
        view.addSubview(levelSlider)

    }

    private func setupConstraint() {

        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 32
            ),

            titleLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 24
            ),

            titleLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -24
            ),

        ])

        NSLayoutConstraint.activate([
            desciptionLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 18
            ),
            desciptionLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 24
            ),
            desciptionLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -24
            ),
        ])

        NSLayoutConstraint.activate([
            heightLabel.bottomAnchor.constraint(
                equalTo: heightSlider.topAnchor,
                constant: -16
            ),

            heightLabel.centerXAnchor.constraint(
                equalTo: heightSlider.centerXAnchor
            ),
            heightSlider.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                    constant: 24
            ),
            heightSlider.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -24
            ),

            heightSlider.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            levelSlider.bottomAnchor.constraint(
                equalTo: heightSlider.bottomAnchor,
                constant: 8
            ),

            levelSlider.leadingAnchor.constraint(
                equalTo: heightSlider.leadingAnchor
            ),

            levelSlider.trailingAnchor.constraint(
                equalTo: heightSlider.trailingAnchor
            ),
            
            
            heightButton.widthAnchor.constraint(equalToConstant: 250),
            heightButton.heightAnchor.constraint(equalToConstant: 42),
            heightButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heightButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -45
            ),
        ])
    }

    private func setupActions() {

        heightSlider.addAction(

            UIAction { [weak self] _ in
                self?.updateHeight()
            },
            for: .valueChanged
        )

        heightButton.addTarget(
            self,
            action: #selector(navigateToWeight),
            for: .touchUpInside
        )
    }

    private func updateHeight() {
        selectedHeight = Double(heightSlider.value.rounded())
        
        let number = "\(Int(selectedHeight))"
        

        let text = NSMutableAttributedString(
            string: "\(number) cm",
            attributes: [
                .foregroundColor: UIColor.white
            ]
        )

        text.addAttribute(
            .foregroundColor,
            value: UIColor.primary,
            range: NSRange(location: 0, length: number.count)
        )

        text.addAttribute(
            .font,
            value: UIFont.systemFont(ofSize: 55, weight: .bold),
            range: NSRange(location: 0, length: number.count)
        )

        heightLabel.attributedText = text

    }

    @objc private func navigateToWeight() {
        let weightDetails = WeightDetailViewController(receiveHeight: selectedHeight)
        
        

        navigationController?.pushViewController(weightDetails, animated: true)

    }

}

#Preview() {
    HeightDetailViewController()
}
