//
//  DetailPortfolioPresenter.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 14/08/23.
//

import Foundation

class DetailPortfolioPresenter: DetailPortfolioViewToPresenterProtocol {
    var interactor: DetailPortfolioPresenterToInteractorProtocol?
    var router: DetailPortfolioPresenterToRouterProtocol?
    var view: DetailPortfolioPresenterToViewProtocol?
    
    var dataDonut: DataDonut?
}

extension DetailPortfolioPresenter: DetailPortfolioInteractorToPresenter {
    
}
