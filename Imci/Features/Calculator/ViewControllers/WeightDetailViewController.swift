//
//  weightInfoView.swift
//  Imci
//
//  Created by sabin  on 11/11/26.
//

import UIKit

final class WeightDetailViewController: UIViewController {

    private let receiveHeight: Double

    private var selectedWeight: Double = 70

    init(receiveHeight: Double) {
        self.receiveHeight = Double(receiveHeight)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder: ) nao foi bem implementado")
    }

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Qual é seu peso?"
        label.textColor = .white
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let desciptionLabel: UILabel = {
        let label = UILabel()

        label.text =
            "Conhecer o seu peso nos ajuda a personalizar os treinos e a acompanhar melhor o progresso."
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let weightLabel: UILabel = {
        let label = UILabel()

        label.text = "70.0 kg"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        let text = NSMutableAttributedString(
            string: "70.0 kg",
            attributes: [
                .foregroundColor: UIColor.white
            ]
        )

        text.addAttribute(
            .foregroundColor,
            value: UIColor.primary,
            range: NSRange(location: 0, length: 4)
        )

        text.addAttribute(
            .font,
            value: UIFont.systemFont(ofSize: 55, weight: .bold),
            range: NSRange(location: 0, length: 4)
        )

        label.attributedText = text

        return label
    }()

    private let weightStepper: UIStepper = {
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

    private let weightButton: UIButton = {
        let button = UIButton(type: .system)

        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        button.backgroundColor = .primary
        button.tintColor = .black
        button.layer.cornerRadius = 18
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let cardResult: UIView = {
        let card = UIView(frame: CGRect(x: 50, y: 100, width: 200, height: 100))

        card.translatesAutoresizingMaskIntoConstraints = false
        card.cornerConfiguration = .corners(radius: 20)
        card.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.1)

        return card
    }()

    private let resultLabel: UILabel = {
        let label = UILabel()

        label.text = "Seu IMC:"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label

    }()

    private let resultClassification: UILabel = {
        let label = UILabel()

        label.text = "(normal)"
        label.textColor = .primary
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label

    }()
    
    private let alertButton : UIButton = {
        let alert = UIButton(type: .system)
        
        var config = UIButton.Configuration.filled()
        
        config.image = UIImage(systemName: "info.circle.fill")
        config.imagePlacement = .trailing
        config.baseBackgroundColor = .clear
        config.baseForegroundColor = .primary
  
        alert.configuration = config
        alert.translatesAutoresizingMaskIntoConstraints = false
        
        
        return alert
    }()

    private let resultValue: UILabel = {
        let value = UILabel()

        value.text = "22.5"
        value.textColor = .primary
        value.font = .systemFont(ofSize: 24, weight: .bold)
        value.translatesAutoresizingMaskIntoConstraints = false

        return value
    }()

    private let resultDescription: UILabel = {
        let description = UILabel()

        description.text =
            "Seu IMC está dentro da faixa considerada adequada para adultos! Continue cuidando da sua saúde com uma alimentação equilibrada, atividades físicas e hábitos saudáveis."
        description.textColor = .white
        description.font = .systemFont(ofSize: 10, weight: .light)
        description.numberOfLines = 0
        description.textAlignment = .justified
        description.translatesAutoresizingMaskIntoConstraints = false

        return description
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        setupViews()
        setupConstraints()
        setupActions()
        cardResult.isHidden = true
        updateWeight()

        //        print(receiveHeight)
        //        print(selectedWeight)
        //        print(calculateWeight(height: receiveHeight, weight: selectedWeight))

    }

    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(desciptionLabel)
        view.addSubview(weightLabel)
        view.addSubview(weightStepper)

        view.addSubview(cardResult)

        cardResult.addSubview(resultLabel)
        cardResult.addSubview(alertButton)
        cardResult.addSubview(resultValue)
        cardResult.addSubview(resultDescription)
        cardResult.addSubview(resultClassification)
        //
        //        view.addSubview(resultLabel)
        //        view.addSubview(resultValue)
        //        view.addSubview(resultDescription)
        //        view.addSubview(resultClassification)

        view.addSubview(weightButton)

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

            weightLabel.topAnchor.constraint(
                equalTo: desciptionLabel.bottomAnchor,
                constant: 55
            ),
            weightLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),

            weightStepper.topAnchor.constraint(
                equalTo: weightLabel.bottomAnchor,
                constant: 20
            ),
            weightStepper.centerXAnchor.constraint(
                equalTo: weightLabel.centerXAnchor
            ),

            cardResult.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 24
            ),
            cardResult.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -24
            ),
            cardResult.heightAnchor.constraint(equalToConstant: 120),
            cardResult.centerYAnchor.constraint(
                equalTo: view.centerYAnchor,
                constant: 100
            ),

            resultLabel.topAnchor.constraint(
                equalTo: cardResult.topAnchor,
                constant: 13
            ),
            resultLabel.leadingAnchor.constraint(
                equalTo: cardResult.leadingAnchor,
                constant: 13
            ),
            
            alertButton.topAnchor.constraint(equalTo: cardResult.topAnchor, constant: 10),
            alertButton.trailingAnchor.constraint(equalTo: cardResult.trailingAnchor),

            

            resultClassification.topAnchor.constraint(
                equalTo: resultLabel.topAnchor
            ),

            resultClassification.leadingAnchor.constraint(
                equalTo: resultLabel.leadingAnchor,
                constant: 75
            ),

            resultValue.leadingAnchor.constraint(
                equalTo: cardResult.leadingAnchor,
                constant: 20
            ),
            resultValue.centerYAnchor.constraint(
                equalTo: cardResult.centerYAnchor,
                constant: 10
            ),

            resultDescription.centerYAnchor.constraint(
                equalTo: cardResult.centerYAnchor,
                constant: 15
            ),
            resultDescription.leadingAnchor.constraint(
                equalTo: cardResult.leadingAnchor,
                constant: 90
            ),
            resultDescription.trailingAnchor.constraint(
                equalTo: cardResult.trailingAnchor,
                constant: -20
            ),

            weightButton.widthAnchor.constraint(equalToConstant: 250),
            weightButton.heightAnchor.constraint(equalToConstant: 42),
            weightButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weightButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -45
            ),
        ])

    }

    private func setupActions() {

        weightStepper.addAction(
            UIAction { [weak self] _ in
                self?.updateWeight()
            },
            for: .valueChanged
        )

 

        weightButton.addAction(
            UIAction { [weak self] _ in
                guard let self = self else { return }

                let result = self.calculateWeight(
                    height: self.receiveHeight,
                    weight: self.selectedWeight
                )

                self.updateResult(imc: result)

            },
            for: .touchUpInside
        )
        
        alertButton.addAction(
            
            UIAction { [weak self] _ in
            self?.showAlert()
        },
            for: .touchUpInside)
    }

    private func updateWeight() {
        selectedWeight = weightStepper.value
        let number = "\(selectedWeight)"

        weightLabel.text = String(
            format: "%.1f kg",
            selectedWeight
        )

        let text = NSMutableAttributedString(
            string: "\(number) kg",
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

        weightLabel.attributedText = text

    }

    @objc private func navigateToAdvices() {
        let adviceDetails = AdvicesViewController()

        navigationController?.pushViewController(adviceDetails, animated: true)

    }

    private func updateResult(imc: Double) {
        let status = IMCStatus.from(imc: imc)

        resultValue.text = String(format: "%.1f", imc)
        resultClassification.text = status.title
        resultClassification.textColor = status.displayColor
        resultDescription.text = status.description

        cardResult.isHidden = false
    }

    private func calculateWeight(height: Double, weight: Double) -> Double {

        let heightInMeters = height / 100
        let imc = weight / (heightInMeters * heightInMeters)

        return imc

    }

    private func showAlert() {
        let alert = UIAlertController(
            title: "Dicas de Bem Estar?",
            message:
                "Aprender mais sobre cuidado e como preservar e manter sua saúde",
            preferredStyle: .alert
        )

        let cancelAction = UIAlertAction(
            title: "Cancelar",
            style: .cancel
        )
        
        

        let confirmAction = UIAlertAction(title: "Ver Dicas", style: .default){ [weak self] _ in
            
            self?.navigateToAdvices()
            
        }
        
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        
        
        present(alert, animated: true)
    }
}

#Preview() {
    WeightDetailViewController(receiveHeight: 175)
}
