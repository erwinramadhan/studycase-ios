//
//  HistoryTransactionViewController.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import UIKit

class HistoryTransactionViewController: UIViewController {

    var presenter: HistoryTransactionViewToPresenterProtocol?
    
    var tableView: UITableView!
    var label: UILabel!
    let cellIdentifier = "cellIdentifier"
    let userDefault = UserDefaults.standard
    
    var historyTransactions = [HistoryTransaction]() {
        didSet {
            historyTransactionsHasChanged()
        }
    }
    
    func historyTransactionsHasChanged() {
        if historyTransactions.isEmpty {
            label.isHidden = false
            tableView.isHidden = true
        } else {
            label.isHidden = true
            tableView.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let storedData = UserDefaults.standard.data(forKey: "historyTransactions") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([HistoryTransaction].self, from: storedData) {
                historyTransactions.append(contentsOf: decoded)
            }
        }
    }
    
    override func loadView() {
        super.loadView()
        
        label = {
            let lbl = UILabel()
            lbl.text = "Ups, riwayat transaksi anda kosong"
            lbl.textColor = .black
            lbl.font = UIFont.boldSystemFont(ofSize: 16)
            lbl.translatesAutoresizingMaskIntoConstraints = false

            return lbl
        }()

        view.backgroundColor = .white
        
        view.addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        tableView.backgroundColor = .white
        
        view.addSubview(tableView)
        historyTransactionsHasChanged()
    }

}

extension HistoryTransactionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HistoryTransactionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyTransactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TransactionTableViewCell
        let data = historyTransactions[indexPath.row]
        cell.amountLabel.text = (data.type == .credit ? "+ " : "- ") + (data.amount.formatToRupiah() ?? "")
        cell.merchantLabel.text = "ke \(data.merchantName)"
        cell.transactionTypeLabel.text = data.type == .credit ? "Kredit" : "Debit"
        cell.transactionIdLabel.text = data.transactionId
        cell.dateLabel.text = data.date.toString(format: "d MMM, yyyy - HH:mm")
        return cell
    }
}

extension HistoryTransactionViewController: HistoryTransactionPresenterToViewProtocol {
    
}
