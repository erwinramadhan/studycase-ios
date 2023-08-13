//
//  TransactionTableViewCell.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation
import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    let merchantLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        return label
    }()
    
    let transactionIdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        return label
    }()
    
    let transactionTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    let verticalStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
    
    let parentStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .equalSpacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        verticalStackView.addArrangedSubview(transactionTypeLabel)
        verticalStackView.addArrangedSubview(merchantLabel)
        verticalStackView.addArrangedSubview(transactionIdLabel)
        verticalStackView.addArrangedSubview(dateLabel)
        
        parentStackView.addArrangedSubview(verticalStackView)
        parentStackView.addArrangedSubview(amountLabel)
        contentView.addSubview(parentStackView)
        
        NSLayoutConstraint.activate([
            parentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            parentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            parentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            parentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
