//
//  DetailPromoViewController.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 11/08/23.
//

import UIKit

class DetailPromoViewController: UIViewController {
    
    var presenter: DetailPromoViewToPresenterProtocol?
    
    var activityIndicator: UIActivityIndicatorView!
    var stackViewContainer: UIStackView!
    var image: UIImageView!
    var nameLabel: UILabel!
    var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchDetailPromo()
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        initLoadingUI()
        initDetailPromoUI()
    }
    
    func initLoadingUI() {
        activityIndicator = {
            let ai = UIActivityIndicatorView()
            ai.translatesAutoresizingMaskIntoConstraints = false
            return ai
        }()
        
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func initDetailPromoUI() {
        stackViewContainer = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.spacing = 12
            sv.translatesAutoresizingMaskIntoConstraints = false
            return sv
        }()
        
        let cardContainerView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .white
            view.layer.cornerRadius = 15
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0.2
            view.layer.shadowOffset = CGSize(width: 0, height: 2)
            view.layer.shadowRadius = 4
            view.heightAnchor.constraint(equalToConstant: 140).isActive = true
            return view
        }()
        
        image = {
            let iv = UIImageView()

            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.contentMode = .scaleToFill
            iv.clipsToBounds = true
            iv.layer.cornerRadius = 12
            
            return iv
        }()
        
        nameLabel = {
            let lbl = UILabel()
            lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            lbl.textColor = .black
            lbl.translatesAutoresizingMaskIntoConstraints = false
            
            return lbl
        }()
        
        descriptionLabel = {
            let lbl = UILabel()
            lbl.font = UIFont.systemFont(ofSize: 14)
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.lineBreakMode = .byWordWrapping
            lbl.numberOfLines = 0
            lbl.textColor = .black
            
            return lbl
        }()
        
        cardContainerView.addSubview(image)
        stackViewContainer.addArrangedSubview(cardContainerView)
        stackViewContainer.addArrangedSubview(nameLabel)
        stackViewContainer.addArrangedSubview(descriptionLabel)
        
        self.view.addSubview(stackViewContainer)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: cardContainerView.topAnchor),
            image.bottomAnchor.constraint(equalTo: cardContainerView.bottomAnchor),
            image.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor),
            stackViewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackViewContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackViewContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    func startLoading() {
        activityIndicator?.startAnimating()
        activityIndicator?.isHidden = false
        stackViewContainer.isHidden = true
    }
    
    func endLoading() {
        activityIndicator?.stopAnimating()
        activityIndicator?.isHidden = true
        stackViewContainer.isHidden = false
    }

}

extension DetailPromoViewController: DetailPromoPresenterToViewProtocol {
    func showDetailPromo(promo: PromoResponse) {
        if let url = URL(string: promo.image?.url ?? "") {
            image.load(url: url)
        }
        nameLabel.text = promo.name ?? ""
        descriptionLabel.text = promo.description ?? ""
    }
    
    func showError() {
        
    }
    
    func loadingStateHasChanged(isLoading: Bool) {
        if isLoading {
            startLoading()
            return
        }
        endLoading()
    }
}
