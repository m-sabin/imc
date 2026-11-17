//
//  HeightInfoView.swift
//  Imci
//
//  Created by sabin  on 11/11/26.
//


import UIKit

final class HeightDetailViewController: UIViewController {
    private let contentView = HeightDetailView()
    private var selectedHeight = 175.0

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        updateHeight()
    }

    private func setupActions() {
        contentView.heightSlider.addAction(
            UIAction { [weak self] _ in
                self?.updateHeight()
            },
            for: .valueChanged
        )

        contentView.continueButton.addAction(
            UIAction { [weak self] _ in
                self?.showWeightScreen()
            },
            for: .touchUpInside
        )
    }

    private func updateHeight() {
        selectedHeight = Double(contentView.heightSlider.value.rounded())
        contentView.updateHeight(selectedHeight)
    }

    private func showWeightScreen() {
        let controller = WeightDetailViewController(receiveHeight: selectedHeight)
        navigationController?.pushViewController(controller, animated: true)
    }
}

#Preview() {
    HeightDetailViewController()
}
