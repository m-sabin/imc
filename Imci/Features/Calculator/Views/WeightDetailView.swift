import UIKit

final class WeightDetailView: UIView {
    let weightStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.value = 70
        stepper.minimumValue = 30
        stepper.maximumValue = 350
        stepper.stepValue = 0.5
        stepper.autorepeat = true
        stepper.wraps = false
        stepper.backgroundColor = .primary
        stepper.layer.cornerRadius = 16
        stepper.tintColor = .primary
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        button.backgroundColor = .primary
        button.tintColor = .black
        button.layer.cornerRadius = 18
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let adviceButton: UIButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "info.circle.fill")
        configuration.imagePlacement = .trailing
        configuration.baseBackgroundColor = .clear
        configuration.baseForegroundColor = .primary
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Qual é seu peso?"
        label.textColor = .white
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Conhecer o seu peso nos ajuda a personalizar os treinos e a acompanhar melhor o progresso."
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let resultCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.cornerConfiguration = .corners(radius: 20)
        view.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.1)
        return view
    }()
    
    private let resultTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Seu IMC:"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let resultClassificationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let resultValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .primary
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let resultDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let disclaimerText: UILabel = {
        let label = UILabel()
        
        label.text = "O IMC é apenas um indicador e não representa um diagnóstico médico. Os resultados são informativos e não substituem uma avaliação profissional."
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 8, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        updateWeight(weightStepper.value)
        resultCard.isHidden = true
        disclaimerText.isHidden = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateWeight(_ weight: Double) {
        let number = String(format: "%.1f", weight)
        let text = NSMutableAttributedString(
            string: "\(number) kg",
            attributes: [.foregroundColor: UIColor.white]
        )
        let numberRange = NSRange(location: 0, length: number.count)
        text.addAttribute(.foregroundColor, value: UIColor.primary, range: numberRange)
        text.addAttribute(
            .font,
            value: UIFont.systemFont(ofSize: 55, weight: .bold),
            range: numberRange
        )
        weightLabel.attributedText = text
    }

    func showResult(value: Double, status: IMCStatus) {
        resultValueLabel.text = String(format: "%.1f", value)
        resultClassificationLabel.text = status.title
        resultClassificationLabel.textColor = status.displayColor
        resultDescriptionLabel.text = status.description
        resultCard.isHidden = false
        disclaimerText.isHidden = false
    }

    private func setupView() {
        backgroundColor = .black

        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(weightLabel)
        addSubview(weightStepper)
        addSubview(resultCard)
        addSubview(calculateButton)

        resultCard.addSubview(resultTitleLabel)
        resultCard.addSubview(resultClassificationLabel)
        resultCard.addSubview(adviceButton)
        resultCard.addSubview(resultValueLabel)
        resultCard.addSubview(resultDescriptionLabel)
        
        addSubview(disclaimerText)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),

            weightLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 55),
            weightLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            weightStepper.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 20),
            weightStepper.centerXAnchor.constraint(equalTo: weightLabel.centerXAnchor),

            resultCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            resultCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            resultCard.heightAnchor.constraint(equalToConstant: 120),
            resultCard.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 100),

            resultTitleLabel.topAnchor.constraint(equalTo: resultCard.topAnchor, constant: 13),
            resultTitleLabel.leadingAnchor.constraint(equalTo: resultCard.leadingAnchor, constant: 13),

            adviceButton.topAnchor.constraint(equalTo: resultCard.topAnchor, constant: 10),
            adviceButton.trailingAnchor.constraint(equalTo: resultCard.trailingAnchor),

            resultClassificationLabel.topAnchor.constraint(equalTo: resultTitleLabel.topAnchor),
            resultClassificationLabel.leadingAnchor.constraint(
                equalTo: resultTitleLabel.trailingAnchor,
                constant: 8
            ),

            resultValueLabel.leadingAnchor.constraint(equalTo: resultCard.leadingAnchor, constant: 20),
            resultValueLabel.centerYAnchor.constraint(equalTo: resultCard.centerYAnchor, constant: 10),

            resultDescriptionLabel.centerYAnchor.constraint(
                equalTo: resultCard.centerYAnchor,
                constant: 15
            ),
            resultDescriptionLabel.leadingAnchor.constraint(
                equalTo: resultCard.leadingAnchor,
                constant: 90
            ),
            resultDescriptionLabel.trailingAnchor.constraint(
                equalTo: resultCard.trailingAnchor,
                constant: -20
            ),
            
            disclaimerText.bottomAnchor.constraint(equalTo: resultCard.bottomAnchor, constant: 30),
            
            disclaimerText.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            disclaimerText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            
            disclaimerText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),

            calculateButton.widthAnchor.constraint(equalToConstant: 250),
            calculateButton.heightAnchor.constraint(equalToConstant: 42),
            calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            calculateButton.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor,
                constant: -45
            )
        ])
    }
}

#Preview {
    WeightDetailViewController(receiveHeight: 55)
}
