import UIKit

final class WeightDetailViewController: UIViewController {
    private let height: Double
    private let contentView = WeightDetailView()
    private var selectedWeight = 70.0

    init(receiveHeight: Double) {
        height = receiveHeight
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        updateWeight()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem (
            image: UIImage(systemName: "info.circle"),
            style: .plain,
            target: self,
            action: #selector(navigateToAdvices)
        )
    }

    private func setupActions() {
        contentView.weightStepper.addAction(
            UIAction { [weak self] _ in
                self?.updateWeight()
            },
            for: .valueChanged
        )

        contentView.calculateButton.addAction(
            UIAction { [weak self] _ in
                self?.calculateIMC()
            },
            for: .touchUpInside
        )

        contentView.adviceButton.addAction(
            UIAction { [weak self] _ in
                self?.showAdviceAlert()
            },
            for: .touchUpInside
        )
    }

    private func updateWeight() {
        selectedWeight = contentView.weightStepper.value
        contentView.updateWeight(selectedWeight)
    }

    private func calculateIMC() {
        let heightInMeters = height / 100
        let imc = selectedWeight / (heightInMeters * heightInMeters)
        let status = IMCStatus.from(imc: imc)
        contentView.showResult(value: imc, status: status)
    }

    private func showAdviceAlert() {
        let alert = UIAlertController(
            title: "Dicas de Bem-Estar",
            message: "Aprender mais sobre cuidado, como preservar e manter sua saúde",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        alert.addAction(
            UIAlertAction(title: "Ver Dicas", style: .default) { [weak self] _ in
                self?.navigateToAdvices()
            }
        )

        present(alert, animated: true)
    }

    
    @objc private func navigateToAdvices() {
        let adviceDetails = AdvicesViewController()
        navigationController?.pushViewController(adviceDetails, animated: true)
    }
}

#Preview {
    WeightDetailViewController(receiveHeight: 175)
}
