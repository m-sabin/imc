//
//  Advices.swift
//  Imci
//
//  Created by sabin  on 11/11/26.
//

import UIKit

final class AdvicesViewController: UIViewController {

    private let categories = [
        "Alimentação",
        "Atividade Física",
        "Hidratação",
        "Sono",
        "Saúde Emocional",
        "Acompanhamento",
    ]

    private let titleLabel: UILabel = {
        let label = UILabel()

        label.text = "Dicas de Bem Estar"
        label.textColor = .white
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let adviceTableView: UITableView = {
        let adviceTable = UITableView()
        adviceTable.backgroundColor = .systemGray
        adviceTable.separatorStyle = .singleLine
        adviceTable.rowHeight = UITableView.automaticDimension
        adviceTable.translatesAutoresizingMaskIntoConstraints = false

        return adviceTable
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
       // adviceTableView.dataSource = self

        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(adviceTableView)
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

            adviceTableView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 24
            ),

            adviceTableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 24
            ),

            adviceTableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -24
            ),

            adviceTableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),

        ])
    }
}

//extension AdvicesViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        categories.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    
//}

#Preview() {
    AdvicesViewController()
}
