//
//  Advices.swift
//  Imci
//
//  Created by sabin  on 11/11/26.
//

import UIKit

final class AdvicesViewControllerTest: UIViewController {

    private let tableView = UITableView()

    private let data = [
        "Alimentação",
        "Atividade Física",
        "Hidratação",
        "Sono"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    private func setupTableView() {
        view.addSubview(tableView)

        tableView.dataSource = self
        tableView.delegate = self
    

        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "cell"
        )
    }
}


extension AdvicesViewControllerTest: UITableViewDataSource, UITableViewDelegate {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return data.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        )

        cell.textLabel?.text = data[indexPath.row]

        return cell
    }
}


#Preview(){
    AdvicesViewControllerTest()
}
