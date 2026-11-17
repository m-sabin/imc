//
//  CalculatorViewController.swift
//  Imci
//
//  Created by sabin  on 10/11/26.
//

import UIKit

final class CalculatorViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Calcular seu IMC"
        label.textColor = .white
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let homeImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.image = UIImage(named: "img_home")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let startButton: UIButton = {
        let button = UIButton(type: .system)

        button.setTitle("Começar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        button.backgroundColor = .primary
        button.tintColor = .black
        button.layer.cornerRadius = 18
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text =
            "Descubra seu Índice de Massa Corporal (IMC) de forma simples e rápida. Acompanhe seus resultados e dê mais um passo para entender sua saúde e seu bem-estar."
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        setupViews()
        setupConstraints()
        setupActions()
        
    

    }

    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(homeImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(startButton)

    }

    private func setupConstraints() {
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
            homeImageView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 80
            ),

            homeImageView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 24
            ),

            homeImageView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -24
            ),

            homeImageView.heightAnchor.constraint(equalToConstant: 200),
        ])

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: homeImageView.bottomAnchor,
                constant: 100
            ),

            descriptionLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 24
            ),

            descriptionLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -24
            ),

        ])

        NSLayoutConstraint.activate([

            startButton.widthAnchor.constraint(equalToConstant: 250),
            startButton.heightAnchor.constraint(equalToConstant: 42),
            
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            startButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -45
            ),

        ])
    }

// a forma mais modera de navegar entre telas
    
//    private func setupActions() {
//
//        startButton.addAction(
//            UIAction { [weak self] _ in
//                self?.navigateToWeightDetails()
//            },
//            for: .touchUpInside
//        )
//
//    }
//
//    private func navigateToWeightDetails() {
//        let viewController = WeightDetailViewController()
//
//        navigationController?.pushViewController(viewController, animated: true)
//    }
    
    
    private func setupActions() {
        startButton.addTarget(
            self,
            action: #selector(navigateToHeight),
            for: .touchUpInside
        )
    }

    @objc private func navigateToHeight() {
        let heightDetails = HeightDetailViewController()

        navigationController?.pushViewController(
            heightDetails,
            animated: true
        )
    }
    
}

#Preview() {
    CalculatorViewController()
}
