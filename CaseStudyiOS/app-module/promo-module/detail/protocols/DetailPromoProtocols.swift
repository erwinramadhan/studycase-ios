//
//  DetailPromoProtocols.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 11/08/23.
//

import Foundation

protocol DetailPromoPresenterToViewProtocol: AnyObject {
    func showDetailPromo(promo: PromoResponse)
    func showError()
    func loadingStateHasChanged(isLoading: Bool)
}

protocol DetailPromoPresenterToInteractorProtocol: AnyObject {
    var presenter: DetailPromoInteractorToPresenterProtocol? { get set }
    
    func fetchDetailPromo(id: Int)
}

protocol DetailPromoViewToPresenterProtocol: AnyObject {
    var view: DetailPromoPresenterToViewProtocol? { get set }
    var interactor: DetailPromoPresenterToInteractorProtocol? { get set }
    var router: DetailPromoPresenterToRouterProtocol? { get set }
    
    var isLoading: Bool { get set }
    var detailPromoId: Int? { get set }
    
    func fetchDetailPromo()
}

protocol DetailPromoInteractorToPresenterProtocol: AnyObject {
    func detailPromoFetchedSuccess(promo: PromoResponse)
    func detailPromoFetchFailed()
}

protocol DetailPromoPresenterToRouterProtocol: AnyObject {
    static func createModule(detailPromoId: Int?) -> DetailPromoViewController
}
