//
//  Movie.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado Da Silva on 19/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var backdropPath: String?
    var budget: Int?
    var genres: [Genre]?
    var id: Int
    var overview: String
    var posterPath: String?
    var releaseDate: String
    var revenue: Int?
    var runtime: Int?
    var title: String
    var voteAverage: Float
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case budget
        case genres
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case title
        case voteAverage = "vote_average"
    }
}
