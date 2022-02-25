//
//  MovieModel.swift
//  MovieApp
//
//  Created by Chu Yu Min on 2022/02/24.
//

import Foundation

struct MovieModel: Codable {
    
    let resultCount: Int?
    let results: [Result]?
}

struct Result: Codable {
    let trackName: String? //movie title
    let previewUrl: String? //movie url
    let image: String? //movie image
    let shortDescription: String?
    let longDescription: String?
    let trackPrice: Float?
    let currency: String?
    
    enum CodingKeys: String, CodingKey {
        case image = "artworkUrl100"
        case trackName = "trackName"
        case previewUrl
        case shortDescription
        case longDescription
        case trackPrice
        case currency
    }
}
