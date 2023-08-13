//
//  HistoryTransactionProtocols.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import Foundation

protocol HistoryTransactionViewToPresenterProtocol: AnyObject {
    var view: HistoryTransactionPresenterToViewProtocol? { get set }
    var interactor: HistoryTransactionPresenterToInteractorProtocol? { get set }
    var router: HistoryTransactionPresenterToRouterProtocol? { get set }
}

protocol HistoryTransactionPresenterToViewProtocol: AnyObject {
    
}

protocol HistoryTransactionPresenterToInteractorProtocol: AnyObject {
    var presenter: HistoryTransactionInteractorToPresenterProtocolProtocol? { get set }
}

protocol HistoryTransactionInteractorToPresenterProtocolProtocol: AnyObject {
    
}

protocol HistoryTransactionPresenterToRouterProtocol: AnyObject {
    static func createModule() -> HistoryTransactionViewController
}

