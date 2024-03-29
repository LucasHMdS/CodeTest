//
//  MoviesNetworkManager.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado Da Silva on 19/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import Moya
import RxSwift

class MoviesNetworkManager {
    // MARK: - Private Constats
    private let provider = MoyaProvider<MoviesService>() //Debug: (plugins: [NetworkLoggerPlugin(verbose: true)])
    
    // MARK: - Public Constants
    static let shared = MoviesNetworkManager()
    
    // MARK: - Private Functions
    private init() { }
    
    // MARK: - Public Functions
    func getUpcoming(page: Int) -> Single<UpcomingResponse> {
        return provider.rx
            .request(.getUpcoming(page: page))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(UpcomingResponse.self)
            .catchError {
                error in
                throw error
            }
    }
    
    func getMovie(id: Int) -> Single<Movie> {
        return provider.rx.request(.getMovie(id: id)).filterSuccessfulStatusAndRedirectCodes().map(Movie.self)
    }
    
    func getBasePosterPath() -> String {
        return "https://image.tmdb.org/t/p/w154"
    }
    
    func getBaseBackdropPath() -> String {
        return "https://image.tmdb.org/t/p/w780"
    }
}
