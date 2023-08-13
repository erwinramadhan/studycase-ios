//
//  PromoInteractor.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 09/08/23.
//

import Foundation
import Alamofire

let API_PROMO_LIST: String = "https://content.digi46.id/promos"

class PromoInteractor: PromoPresenterToInteractorProtocol {
    var presenter: PromoInteractorToPresenterProtocol?
    
    func fetchPromo() {
        AF.request(API_PROMO_LIST).responseDecodable(of: [PromoResponse].self) { response in
            switch response.result {
                case .success(let value):
                    self.presenter?.promoFetchedSuccess(promos: value)
                case .failure:
                    self.presenter?.promoFetchFailed()
            }
        }
    }
}
