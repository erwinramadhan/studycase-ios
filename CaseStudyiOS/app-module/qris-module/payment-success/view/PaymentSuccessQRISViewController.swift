//
//  PaymentSuccessQRISViewController.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import UIKit

class PaymentSuccessQRISViewController: UIViewController {

    var presenter: PaymentSuccessQRISViewToPresenterProtocol?
    
    var dateRightLabel: UILabel!
    var timeRightLabel: UILabel!
    var merchantRightLabel: UILabel!
    var bankRightLabel: UILabel!
    var payAmountRightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        let stackView: UIStackView = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.spacing = 100
            sv.translatesAutoresizingMaskIntoConstraints = false
            
            return sv
        }()
        
        let headerStackView: UIStackView = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.spacing = 4
            sv.translatesAutoresizingMaskIntoConstraints = false
            
            return sv
        }()
        
        let checkImageView: UIImageView = {
            let img = UIImageView()
            img.image = UIImage(systemName: "checkmark.seal.fill")
            img.heightAnchor.constraint(equalToConstant: 40).isActive = true
            img.widthAnchor.constraint(equalToConstant: 40).isActive = true
            img.contentMode = .scaleAspectFit
            img.tintColor = UIColor(named: "BlueTeal")
            img.translatesAutoresizingMaskIntoConstraints = false
            
            return img
        }()
        
        let titleHeadLabel: UILabel = {
            let lbl = UILabel()
            lbl.text = "Pembayaran Berhasil"
            lbl.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            lbl.textColor = UIColor(named: "BlueTeal")
            lbl.textAlignment = .center
            lbl.translatesAutoresizingMaskIntoConstraints = false
            
            return lbl
        }()
        
        let payAmountHeadLabel: UILabel = {
            let lbl = UILabel()
            lbl.text = presenter?.qrisData?.payAmount.formatToRupiah() ?? ""
            lbl.font = UIFont.systemFont(ofSize: 32, weight: .bold)
            lbl.textColor = .black
            lbl.textAlignment = .center
            lbl.translatesAutoresizingMaskIntoConstraints = false
            
            return lbl
        }()
        
        let stackViewTransactionDetail: UIStackView = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.spacing = 8
            sv.translatesAutoresizingMaskIntoConstraints = false
            
            return sv
        }()
        
        let generateStackViewRow = {
            let sv = UIStackView()
            sv.axis = .horizontal
            sv.translatesAutoresizingMaskIntoConstraints = false
            
            return sv
        }
        
        let generateTitleLabel = {
            let lbl = UILabel()
            lbl.text = "Detail Transaksi"
            lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            lbl.textColor = .black
            lbl.translatesAutoresizingMaskIntoConstraints = false
            
            return lbl
        }
        
        let generateLeftLabel: (_: String) -> UILabel = { text in
            let lbl = UILabel()
            lbl.text = text
            lbl.textColor = .gray
            lbl.textAlignment = .left
            lbl.translatesAutoresizingMaskIntoConstraints = false
            
            return lbl
        }
        
        let generateRightLabel: (_: String) -> UILabel = { text in
            let lbl = UILabel()
            lbl.text = text
            lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            lbl.textColor = .black
            lbl.textAlignment = .right
            lbl.translatesAutoresizingMaskIntoConstraints = false
            
            return lbl
        }
        
        let backToHomeButton: UIButton = {
            let btn = UIButton(type: .system)
            btn.setTitle("Kembali ke Home", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            btn.backgroundColor = UIColor(named: "Orange")
            btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
            btn.layer.cornerRadius = 25
            btn.layer.masksToBounds = true
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.addTarget(self, action: #selector(buttonBackToHomeTapped(_:)), for: .touchUpInside)
            
            
            return btn
        }()
        
        headerStackView.addArrangedSubview(checkImageView)
        headerStackView.addArrangedSubview(titleHeadLabel)
        headerStackView.addArrangedSubview(payAmountHeadLabel)
        
        
        let svRow1 = generateStackViewRow()
        let svRow2 = generateStackViewRow()
        let svRow3 = generateStackViewRow()
        let svRow4 = generateStackViewRow()
        let svRow5 = generateStackViewRow()
        let svRow6 = generateStackViewRow()
        
        let titleLabel = generateTitleLabel()
        
        let dateLeftLabel = generateLeftLabel("Tanggal")
        let timeLeftLabel = generateLeftLabel("Waktu")
        let merchantLeftLabel = generateLeftLabel("Merchant")
        let bankLeftLabel = generateLeftLabel("Bank")
        let payAmountLeftLabel = generateLeftLabel("Total Pembayaran")
        
        dateRightLabel = generateRightLabel(Date().toString(format: "d MMM, yyyy"))
        timeRightLabel = generateRightLabel(Date().toString(format: "HH:mm"))
        merchantRightLabel = generateRightLabel(presenter?.qrisData?.merchantName ?? "")
        bankRightLabel = generateRightLabel(presenter?.qrisData?.bankName ?? "")
        payAmountRightLabel = generateRightLabel(presenter?.qrisData?.payAmount.formatToRupiah() ?? "")
        
        svRow1.addArrangedSubview(titleLabel)
        svRow2.addArrangedSubview(bankLeftLabel)
        svRow2.addArrangedSubview(bankRightLabel)
        svRow3.addArrangedSubview(merchantLeftLabel)
        svRow3.addArrangedSubview(merchantRightLabel)
        svRow4.addArrangedSubview(dateLeftLabel)
        svRow4.addArrangedSubview(dateRightLabel)
        svRow5.addArrangedSubview(timeLeftLabel)
        svRow5.addArrangedSubview(timeRightLabel)
        svRow6.addArrangedSubview(payAmountLeftLabel)
        svRow6.addArrangedSubview(payAmountRightLabel)
        
        stackViewTransactionDetail.addArrangedSubview(svRow1)
        stackViewTransactionDetail.addArrangedSubview(svRow2)
        stackViewTransactionDetail.addArrangedSubview(svRow3)
        stackViewTransactionDetail.addArrangedSubview(svRow4)
        stackViewTransactionDetail.addArrangedSubview(svRow5)
        stackViewTransactionDetail.addArrangedSubview(svRow6)
        
        stackView.addArrangedSubview(headerStackView)
        stackView.addArrangedSubview(stackViewTransactionDetail)
        
        view.addSubview(stackView)
        view.addSubview(backToHomeButton)
        
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -20).isActive = true
        
        backToHomeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        backToHomeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        backToHomeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    @objc func buttonBackToHomeTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }

}

extension PaymentSuccessQRISViewController: PaymentSuccessQRISPresenterToViewProtocol {
    
}
