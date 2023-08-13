//
//  DetailPaymentQRISViewController.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import UIKit

class DetailPaymentQRISViewController: UIViewController {

    var presenter: DetailPaymentQRISViewToPresenterProtocol?
    
    let defaults = UserDefaults.standard
    
    var titleHeaderLabel: UILabel!
    var bankNameLabel: UILabel!
    var transactionIdLabel: UILabel!
    var merchantNameLabel: UILabel!
    var payAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = .white
        
        titleHeaderLabel = {
            let lbl = UILabel()
            lbl.text = "Review Pembayaran"
            lbl.textColor = .black
            lbl.font = .boldSystemFont(ofSize: 16)
            lbl.translatesAutoresizingMaskIntoConstraints = false
            
            return lbl
        }()
        
        let totalPaymentLabel = {
            let lbl = UILabel()
            lbl.text = "Total Pembayaran"
            lbl.textColor = .gray
            lbl.font = .boldSystemFont(ofSize: 16)
            lbl.translatesAutoresizingMaskIntoConstraints = false
            
            return lbl
        }()
        
        bankNameLabel = {
            let lbl = UILabel()
            lbl.text = "Bank: " + (presenter?.qrisData?.bankName ?? "")
            lbl.textColor = .black
            lbl.translatesAutoresizingMaskIntoConstraints = false
            
            return lbl
        }()
        
        transactionIdLabel = {
            let lbl = UILabel()
            lbl.text = "Transaksi ID: " + (presenter?.qrisData?.transactionId ?? "")
            lbl.textColor = .black
            lbl.translatesAutoresizingMaskIntoConstraints = false
            
            return lbl
        }()
        
        merchantNameLabel = {
            let lbl = UILabel()
            lbl.text = "Merchant Name: " + (presenter?.qrisData?.merchantName ?? "")
            lbl.textColor = .black
            lbl.translatesAutoresizingMaskIntoConstraints = false
            
            return lbl
        }()
        
        payAmountLabel = {
            let lbl = UILabel()
            lbl.text = presenter?.qrisData?.payAmount.formatToRupiah() ?? ""
            lbl.textColor = .black
            lbl.font = .boldSystemFont(ofSize: 24)
            lbl.translatesAutoresizingMaskIntoConstraints = false
            
            return lbl
        }()
        
        let stackView: UIStackView = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.spacing = 16
            
            return sv
        }()
        
        let totalStackView: UIStackView = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.spacing = 4
            sv.translatesAutoresizingMaskIntoConstraints = false
            
            return sv
        }()
        
        let detailStackView: UIStackView = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.spacing = 4
            sv.translatesAutoresizingMaskIntoConstraints = false
            
            return sv
        }()
        
        let buttonPay: UIButton = {
            let btn = UIButton(type: .system)
            btn.setTitle("Konfirmasi Bayar", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            btn.backgroundColor = UIColor(named: "Orange")
            btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
            btn.layer.cornerRadius = 25
            btn.layer.masksToBounds = true
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.addTarget(self, action: #selector(buttonPayTapped(_:)), for: .touchUpInside)

            
            return btn
        }()
        
        totalStackView.addArrangedSubview(totalPaymentLabel)
        totalStackView.addArrangedSubview(payAmountLabel)
        
        detailStackView.addArrangedSubview(bankNameLabel)
        detailStackView.addArrangedSubview(transactionIdLabel)
        detailStackView.addArrangedSubview(merchantNameLabel)
        
        stackView.addArrangedSubview(titleHeaderLabel)
        stackView.addArrangedSubview(totalStackView)
        stackView.addArrangedSubview(detailStackView)
        
        self.view.addSubview(stackView)
        self.view.addSubview(buttonPay)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonPay.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            buttonPay.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonPay.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    @objc func buttonPayTapped(_ sender: UIButton) {
        let alertController = UIAlertController(
            title: "Konfirmasi Bayar",
            message: "Apakah anda yakin ingin mengkonfirmasi pembayaran ini?",
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { _ in
                if let qrisData = self.presenter?.qrisData {
                    let successPaymentVC = PaymentSuccessQRISRouter.createModule(qrisData: qrisData)
                    
                    let amountUser = self.defaults.integer(forKey: "amountUser")
                    let currentAmount = amountUser - qrisData.payAmount
                    self.defaults.set(currentAmount, forKey: "amountUser")
                    
                    let newHistoryTransaction = HistoryTransaction(
                        type: .debit,
                        bankName: qrisData.bankName,
                        transactionId: qrisData.transactionId,
                        merchantName: qrisData.merchantName,
                        amount: qrisData.payAmount,
                        date: Date()
                    )
                    
                    var historyTransactions = [HistoryTransaction]()
                    if let storedData = UserDefaults.standard.data(forKey: "historyTransactions") {
                        let decoder = JSONDecoder()
                        if let decoded = try? decoder.decode([HistoryTransaction].self, from: storedData) {
                            historyTransactions.append(contentsOf: decoded)
                        }
                    }
                    historyTransactions.insert(newHistoryTransaction, at: 0)
                    
                    print("historyTransactions", historyTransactions)
                    
                    let encoder = JSONEncoder()
                    if let encoded = try? encoder.encode(historyTransactions) {
                        // Store the Data in UserDefaults
                        print("encoded", encoded)
                        UserDefaults.standard.set(encoded, forKey: "historyTransactions")
                        
                        // Retrieve the Data from UserDefaults
                        if let storedData = UserDefaults.standard.data(forKey: "historyTransactions") {
                            let decoder = JSONDecoder()
                            if let decoded = try? decoder.decode([HistoryTransaction].self, from: storedData) {
                                print("decoded", decoded)
                            }
                        }
                    }
                    
                    self.navigationController?.pushViewController(successPaymentVC, animated: true)
                }
            }
        )
        
        let checkAgainAction = UIAlertAction(
            title: "Cek Ulang",
            style: .destructive,
            handler: { _ in
                
            }
        )
        
        alertController.addAction(checkAgainAction)
        alertController.addAction(okAction)
        
        
        present(alertController, animated: true, completion: nil)
    }
}

extension DetailPaymentQRISViewController: DetailPaymentQRISPresenterToViewProtocol {
    
}
