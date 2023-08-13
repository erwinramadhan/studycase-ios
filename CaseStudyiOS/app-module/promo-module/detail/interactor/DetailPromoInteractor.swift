//
//  DetailPromoInteractor.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 11/08/23.
//

import Foundation
import Alamofire

class DetailPromoInteractor: DetailPromoPresenterToInteractorProtocol {
    var presenter: DetailPromoInteractorToPresenterProtocol?
    
    func fetchDetailPromo(id: Int) {
        let url = API_PROMO_LIST + "/" + "\(id)"
        AF.request(url).responseDecodable(of: PromoResponse.self) { response in
            switch response.result {
                case .success(let value):
                    self.presenter?.detailPromoFetchedSuccess(promo: value)
                case .failure:
                    self.presenter?.detailPromoFetchFailed()
            }
        }
    }
}
