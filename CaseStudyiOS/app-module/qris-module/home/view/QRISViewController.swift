//
//  QRISViewController.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 09/08/23.
//

import UIKit
import AVFoundation



class QRISViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var presenter: QRISViewToPresenterProtocol?
    
    let defaults = UserDefaults.standard
    
    var amountUser = 0
    
    var amountLabel: UILabel!
    var stackView: UIStackView!
    var addButton: UIButton!
    var historyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = "QRIS"
        navigationController?.navigationBar.topItem?.titleView?.tintColor = .black
        navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        navigationController?.navigationBar.layer.shadowOpacity = 0.8
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        navigationController?.navigationBar.layer.shadowRadius = 1.5
        
        if defaults.bool(forKey: "firstLaunch") == true {
            
        } else {
            defaults.set(true, forKey: "firstLaunch")
            defaults.set(10000000, forKey: "amountUser")
        }
        amountUser = defaults.integer(forKey: "amountUser")
        amountLabel.text = amountUser.formatToRupiah() ?? ""
        
        self.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        amountUser = defaults.integer(forKey: "amountUser")
        amountLabel.text = amountUser.formatToRupiah() ?? ""
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = "QRIS"
        navigationController?.navigationBar.topItem?.titleView?.tintColor = .black
        navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        navigationController?.navigationBar.layer.shadowOpacity = 0.8
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        navigationController?.navigationBar.layer.shadowRadius = 1.5
    }
    
    override func loadView() {
        super.loadView()
        
        amountLabel = {
            let lbl = UILabel()
            lbl.textColor = .black
            lbl.font = .boldSystemFont(ofSize: 16)
            lbl.textAlignment = .center
            lbl.translatesAutoresizingMaskIntoConstraints = false
            return lbl
        }()
        
        let amountInfoLabel = {
            let lbl = UILabel()
            lbl.text = "Saldo: "
            lbl.textColor = .black
            lbl.textAlignment = .center
            lbl.translatesAutoresizingMaskIntoConstraints = false
            
            return lbl
        }()
        
        stackView = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.spacing = 20
            return sv
        }()
        
        addButton = {
            let btn = UIButton(type: .system)
            btn.setTitle("Scan QR", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            btn.backgroundColor = UIColor(named: "Orange")
            btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
            btn.layer.cornerRadius = 25
            btn.layer.masksToBounds = true
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            
            return btn
        }()
        
        historyButton = {
            let btn = UIButton(type: .system)
            btn.setTitle("Riwayat Transaksi", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            btn.backgroundColor = UIColor(named: "Orange")
            btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
            btn.layer.cornerRadius = 25
            btn.layer.masksToBounds = true
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.addTarget(self, action: #selector(buttonHistoryTapped(_:)), for: .touchUpInside)
            
            return btn
        }()
        
        stackView.addArrangedSubview(amountInfoLabel)
        stackView.addArrangedSubview(amountLabel)
        stackView.addArrangedSubview(addButton)
        stackView.addArrangedSubview(historyButton)
        
        self.view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let vc = ScanQRISRouter.createModule()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func buttonHistoryTapped(_ sender: UIButton) {
        let vc = HistoryTransactionRouter.createModule()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension QRISViewController: QRISPresenterToViewProtocol {
    
}
