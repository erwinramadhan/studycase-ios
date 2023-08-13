//
//  PromoPresenter.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 09/08/23.
//

import Foundation

class PromoPresenter: PromoViewToPresenterProtocol {
    var view: PromoPresenterToViewProtocol?
    var interactor: PromoPresenterToInteractorProtocol?
    var router: PromoPresenterToRouterProtocol?
    
    var isLoading: Bool = false {
        didSet {
            view?.loadingStateHasChanged(isLoading: isLoading)
        }
    }
    
    func getPromo() {
        isLoading = true
        interactor?.fetchPromo()
    }
}

extension PromoPresenter: PromoInteractorToPresenterProtocol {
    func promoFetchedSuccess(promos: [PromoResponse]) {
        view?.showPromo(promos: promos)
        isLoading = false
    }
    
    func promoFetchFailed() {
        isLoading = false
        view?.showError()
    }
}
