//
//  DetailPortfolioProtocols.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 14/08/23.
//

import Foundation

protocol DetailPortfolioViewToPresenterProtocol: AnyObject {
    var view: DetailPortfolioPresenterToViewProtocol? { get set }
    var interactor: DetailPortfolioPresenterToInteractorProtocol? { get set }
    var router: DetailPortfolioPresenterToRouterProtocol? { get set }
    
    var dataDonut: DataDonut? { get set }
}

protocol DetailPortfolioPresenterToViewProtocol: AnyObject {
    
}

protocol DetailPortfolioPresenterToInteractorProtocol: AnyObject {
    var presenter: DetailPortfolioInteractorToPresenter? { get set }
}

protocol DetailPortfolioInteractorToPresenter: AnyObject {
    
}

protocol DetailPortfolioPresenterToRouterProtocol: AnyObject {
    static func createModule(dataDonut: DataDonut) -> DetailPortfolioViewController
}
