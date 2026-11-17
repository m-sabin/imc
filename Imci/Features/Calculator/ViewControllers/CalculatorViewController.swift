import UIKit

final class CalculatorViewController: UIViewController {
    private let contentView = CalculatorView()

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }

    private func setupActions() {
        contentView.startButton.addAction(
            UIAction { [weak self] _ in
                self?.navigateToHeight()
            },
            for: .touchUpInside
        )
    }

    private func navigateToHeight() {
        let heightDetails = HeightDetailViewController()
        navigationController?.pushViewController(heightDetails, animated: true)
    }
}

#Preview {
    CalculatorViewController()
}
