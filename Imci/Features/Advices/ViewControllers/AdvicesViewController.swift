import UIKit

final class AdvicesViewController: UIViewController {
    private let contentView = AdvicesView()
    private let advices = Advice.all
    private var expandedRow: Int?

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "AdviceCell"
        )
    }
}

extension AdvicesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        advices.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "AdviceCell",
            for: indexPath
        )

        let advice = advices[indexPath.row]
        let isExpanded = expandedRow == indexPath.row
        let arrow = UIImageView(
            image: UIImage(systemName: isExpanded ? "chevron.up" : "chevron.down")
        )
        arrow.tintColor = .systemGray
        arrow.contentMode = .scaleAspectFit
        arrow.frame = CGRect(x: 0, y: 0, width: 20, height: 10)

        cell.accessoryView = arrow
        cell.backgroundColor = .black

        var content = cell.defaultContentConfiguration()
        content.text = advice.title
        content.textProperties.color = .primary
        content.secondaryText = isExpanded
            ? advice.description
            : advice.subtitle
        content.secondaryTextProperties.color = .white
        content.secondaryTextProperties.numberOfLines = isExpanded ? 0 : 1
        content.image = UIImage(systemName: advice.systemImageName)
        content.imageProperties.tintColor = .primary
        cell.contentConfiguration = content

        return cell
    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)

        let previousExpandedRow = expandedRow
        expandedRow = expandedRow == indexPath.row ? nil : indexPath.row

        var rowsToReload = [indexPath]
        if let previousExpandedRow,
           previousExpandedRow != indexPath.row {
            rowsToReload.append(
                IndexPath(row: previousExpandedRow, section: 0)
            )
        }

        tableView.reloadRows(at: rowsToReload, with: .automatic)
    }
}

#Preview {
    AdvicesViewController()
}
