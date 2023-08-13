//
//  PromoProtocols.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 09/08/23.
//

import UIKit

protocol PromoPresenterToViewProtocol: AnyObject {
    func showPromo(promos: [PromoResponse])
    func showError()
    func loadingStateHasChanged(isLoading: Bool)
}

protocol PromoPresenterToInteractorProtocol: AnyObject {
    var presenter: PromoInteractorToPresenterProtocol? { get set }
    
    func fetchPromo()
}

protocol PromoViewToPresenterProtocol: AnyObject {
    var view: PromoPresenterToViewProtocol? { get set }
    var interactor: PromoPresenterToInteractorProtocol? { get set }
    var router: PromoPresenterToRouterProtocol? { get set }
    
    var isLoading: Bool { get set }
    
    func getPromo()
}

protocol PromoInteractorToPresenterProtocol: AnyObject {
    func promoFetchedSuccess(promos: [PromoResponse])
    func promoFetchFailed()
}

protocol PromoPresenterToRouterProtocol: AnyObject {
    static func createModule() -> PromoViewController
}
