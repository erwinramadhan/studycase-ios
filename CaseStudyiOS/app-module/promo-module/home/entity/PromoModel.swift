//
//  PromoModel.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 09/08/23.
//

import Foundation

struct PromoImage: Codable {
    var id: Int
    var name: String
    var url: String
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case url
    }
}

struct PromoResponse: Codable {
    var id: Int
    var name: String?
    var description: String?
    var latitude: String?
    var longitude: String?
    var location: String?
    var count: Int?
    var image: PromoImage?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nama"
        case description = "desc"
        case latitude
        case longitude
        case location = "lokasi"
        case count
        case image = "img"
    }
}

