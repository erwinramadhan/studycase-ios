//
//  DetailPromoPresenter.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 11/08/23.
//

import Foundation

class DetailPromoPresenter: DetailPromoViewToPresenterProtocol {
    var view: DetailPromoPresenterToViewProtocol?
    var interactor: DetailPromoPresenterToInteractorProtocol?
    var router: DetailPromoPresenterToRouterProtocol?
    
    var isLoading: Bool = false {
        didSet {
            view?.loadingStateHasChanged(isLoading: isLoading)
        }
    }
    
    var detailPromoId: Int?
    
    func fetchDetailPromo() {
        guard let id = detailPromoId else { return }
        isLoading = true
        interactor?.fetchDetailPromo(id: id)
    }
}

extension DetailPromoPresenter: DetailPromoInteractorToPresenterProtocol {
    func detailPromoFetchedSuccess(promo: PromoResponse) {
        isLoading = false
        view?.showDetailPromo(promo: promo)
    }
    
    func detailPromoFetchFailed() {
        isLoading = false
        view?.showError()
    }
}
