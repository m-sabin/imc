import UIKit

final class CalculatorView: UIView {
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Começar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        button.backgroundColor = .primary
        button.tintColor = .black
        button.layer.cornerRadius = 18
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

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

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Descubra seu Índice de Massa Corporal (IMC) de forma simples e rápida. Acompanhe seus resultados e dê mais um passo para entender sua saúde e seu bem-estar."
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .black
        addSubview(titleLabel)
        addSubview(homeImageView)
        addSubview(descriptionLabel)
        addSubview(startButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),

            homeImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 80),
            homeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            homeImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            homeImageView.heightAnchor.constraint(equalToConstant: 200),

            descriptionLabel.topAnchor.constraint(equalTo: homeImageView.bottomAnchor, constant: 100),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),

            startButton.widthAnchor.constraint(equalToConstant: 250),
            startButton.heightAnchor.constraint(equalToConstant: 42),
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -45)
        ])
    }
}

#Preview{
    CalculatorView()
}
