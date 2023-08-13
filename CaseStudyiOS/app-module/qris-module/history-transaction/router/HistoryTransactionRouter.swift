//
//  HistoryTransactionRouter.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation

class HistoryTransactionRouter: HistoryTransactionPresenterToRouterProtocol {
    static func createModule() -> HistoryTransactionViewController {
        var view: HistoryTransactionViewController & HistoryTransactionPresenterToViewProtocol = HistoryTransactionViewController()
        var presenter: HistoryTransactionViewToPresenterProtocol & HistoryTransactionInteractorToPresenterProtocolProtocol = HistoryTransactionPresenter()
        var interactor: HistoryTransactionPresenterToInteractorProtocol = HistoryPresenterInteractor()
        var router: HistoryTransactionPresenterToRouterProtocol = HistoryTransactionRouter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        return view
    }
}
