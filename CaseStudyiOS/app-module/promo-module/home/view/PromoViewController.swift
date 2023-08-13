//
//  PromoViewController.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 09/08/23.
//

import UIKit

class PromoViewController: UIViewController {
    var presenter: PromoViewToPresenterProtocol?
    
    var collectionView: UICollectionView!
    let refreshControl = UIRefreshControl()
    
    var activityIndicator: UIActivityIndicatorView?
    
    var promoList: [PromoResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initCollectionView()
        initLoadingUI()
        presenter?.getPromo()
        
    }
    
    override func loadView() {
        super.loadView()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: view.bounds.width - 20, height: 140)
        layout.scrollDirection = .vertical

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white

        self.view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor =  UIColor(named: "Black800")
        navigationController?.navigationBar.topItem?.title = "Promo"
        navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        navigationController?.navigationBar.layer.shadowOpacity = 0.8
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        navigationController?.navigationBar.layer.shadowRadius = 1.5
        navigationController?.navigationBar.isHidden = false
    }
    
    func initCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PromoCell.self, forCellWithReuseIdentifier: PromoCell.identifier)
        collectionView.alwaysBounceVertical = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        collectionView.addSubview(refreshControl)
    }
    
    func initLoadingUI() {
        activityIndicator = {
            let ai = UIActivityIndicatorView()
            ai.translatesAutoresizingMaskIntoConstraints = false
            ai.color = .black
            return ai
        }()
        
        view.addSubview(activityIndicator!)
        NSLayoutConstraint.activate([
            activityIndicator!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator!.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func startLoading() {
        activityIndicator?.startAnimating()
        activityIndicator?.isHidden = false
        collectionView.isHidden = true
    }
    
    func endLoading() {
        activityIndicator?.stopAnimating()
        activityIndicator?.isHidden = true
        collectionView.isHidden = false
    }
    
    @objc private func refresh(_ sender: UIRefreshControl) {
        presenter?.getPromo()
        
        sender.endRefreshing()
    }
    
}

extension PromoViewController: UICollectionViewDelegate {
    
}

extension PromoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailPromoData = promoList[indexPath.item]
        let detailPromoId = detailPromoData.id
        let detailPromoVC = DetailPromoRouter.createModule(detailPromoId: detailPromoId)
        detailPromoVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailPromoVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoCell.identifier, for: indexPath) as! PromoCell
        let data = promoList[indexPath.item]
        cell.data = data
        
        return cell
    }
}

extension PromoViewController: PromoPresenterToViewProtocol {
    func loadingStateHasChanged(isLoading: Bool) {
        if isLoading {
            startLoading()
            return
        }
        endLoading()
    }
    
    func showPromo(promos: [PromoResponse]) {
        self.promoList = promos
        collectionView.reloadData()
    }
    
    func showError() {
        
    }
}
