//
//  HistoryTransactionPresenter.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation

class HistoryTransactionPresenter: HistoryTransactionViewToPresenterProtocol {
    var view: HistoryTransactionPresenterToViewProtocol?
    var interactor: HistoryTransactionPresenterToInteractorProtocol?
    var router: HistoryTransactionPresenterToRouterProtocol?
}

extension HistoryTransactionPresenter: HistoryTransactionInteractorToPresenterProtocolProtocol {
    
}
