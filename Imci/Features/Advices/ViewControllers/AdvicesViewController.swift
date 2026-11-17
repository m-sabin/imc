//
//  Advices.swift
//  Imci
//
//  Created by sabin  on 11/11/26.
//

import UIKit

final class AdvicesViewController: UIViewController {
    
    private var expandeRow: Int? = nil
    private let categories = [
        "Alimentação",
        "Atividade Física",
        "Hidratação",
        "Sono",
        "Saúde Emocional",
        "Acompanhamento",
    ]

    private let subtitles = [
        "Hábitos alimentares saudáveis",
        "Movimento e qualidade de vida",
        "A importância do consumo de água",
        "Descanso e recuperação do corpo",
        "Equilíbrio entre corpo e mente",
        "Cuidados e orientação profissional",
    ]
    
    private let icons = [
        "carrot.fill",
        "figure.run",
        "drop.fill",
        "moon.fill",
        "brain.head.profile",
        "cross.case.fill",
   
    ]
    
    private let advices = [
        // Alimentação
        "Priorize alimentos naturais, como frutas, verduras, grãos integrais e proteínas magras. Reduza o consumo de ultraprocessados e mantenha uma alimentação equilibrada, evitando dietas muito restritivas.",

        // Atividade Física
        "Pratique pelo menos 150 minutos semanais de atividade física moderada, como caminhada, dança ou ciclismo, conforme suas condições. Movimentar o corpo regularmente melhora a disposição e fortalece a saúde cardiovascular.",

        // Hidratação
        "Beba água regularmente ao longo do dia e prefira água a bebidas açucaradas. Uma boa hidratação contribui para o funcionamento do organismo e ajuda a regular a temperatura corporal.",

        // Sono
        "Procure dormir entre 7 e 9 horas por noite, mantendo horários regulares. Um sono de qualidade favorece a recuperação do corpo, a concentração e o equilíbrio emocional.",

        // Saúde Emocional
        "Reserve momentos para relaxar, pratique atividades prazerosas e procure reconhecer situações de estresse. Cuide da sua relação com a alimentação e com o próprio corpo, evitando cobranças excessivas.",

        // Acompanhamento
        "Consulte profissionais de saúde, como médicos, nutricionistas e educadores físicos, conforme suas necessidades. O acompanhamento profissional ajuda a estabelecer objetivos realistas e cuidados adequados à sua saúde."
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
        adviceTable.backgroundColor = .black
        adviceTable.separatorStyle = .singleLine
        adviceTable.rowHeight = UITableView.automaticDimension
        adviceTable.translatesAutoresizingMaskIntoConstraints = false

        return adviceTable
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black

        setupViews()
        setupConstraints()
        setupTableView()
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
                constant: 14
            ),

            adviceTableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -14
            ),

            adviceTableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),

        ])
    }

    private func setupTableView() {
        adviceTableView.dataSource = self
        adviceTableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "AdviceCell"
        )
        adviceTableView.delegate = self

    }
}

extension AdvicesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        categories.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "AdviceCell",
            for: indexPath
        )
        
        let arrow = UIImageView()
        
        if expandeRow == indexPath.row {
            
            arrow.image = UIImage(systemName: "chevron.up")
            
        } else {
            arrow.image = UIImage(systemName: "chevron.down")
        }
        

        arrow.tintColor = .systemGray
        arrow.contentMode = .scaleAspectFit
        arrow.frame = CGRect(x: 0, y: 0, width: 20, height: 10)

        cell.accessoryView = arrow

        var content = cell.defaultContentConfiguration()
        cell.backgroundColor = .black

        content.text = categories[indexPath.row]
        content.textProperties.color = .primary
        
        if expandeRow == indexPath.row {
            content.secondaryText = advices[indexPath.row]
            content.secondaryTextProperties.numberOfLines = 0
        } else {
            content.secondaryText = subtitles[indexPath.row]
        }
        content.secondaryTextProperties.color = .white
        content.image = UIImage(systemName: icons[indexPath.row])
        content.imageProperties.tintColor = .primary

        cell.contentConfiguration = content
        
       

        return cell

    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        print(categories[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let previousExpandedRow = expandeRow
        
        if expandeRow == indexPath.row {
            expandeRow = nil
        } else {
           expandeRow = indexPath.row
        }
        
        var rowsToReload: [IndexPath] = [indexPath]
        
        if let previous = previousExpandedRow,
           previous != indexPath.row {
            rowsToReload.append(
                IndexPath(row: previous, section: 0)
            )
        }

        
        tableView.reloadRows(at: rowsToReload, with: .automatic)
            
    }

}

#Preview() {
    AdvicesViewController()
}
