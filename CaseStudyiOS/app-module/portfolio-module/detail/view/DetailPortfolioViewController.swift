//
//  DetailPortfolioViewController.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 14/08/23.
//

import UIKit

class DetailPortfolioViewController: UIViewController {
    
    var presenter: DetailPortfolioViewToPresenterProtocol?
    
    var tableView: UITableView!
    let cellIdentifier = "cellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        guard let dataChart = presenter?.dataDonut else { return }
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        tableView.backgroundColor = .white
        
        view.addSubview(tableView)
    }

}

extension DetailPortfolioViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension DetailPortfolioViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.dataDonut?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TransactionTableViewCell
        guard let dataChart = presenter?.dataDonut else { return cell }
        let data = dataChart.data[indexPath.row]
        cell.amountLabel.text = "- " + (data.nominal.formatToRupiah() ?? "")
        cell.merchantLabel.isHidden = true
        cell.transactionTypeLabel.text = "Debit"
        cell.transactionIdLabel.isHidden = true
        cell.dateLabel.text = data.transactionDate
        return cell
    }
}

extension DetailPortfolioViewController: DetailPortfolioPresenterToViewProtocol {
    
}
