//
//  MovieService.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado Da Silva on 19/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import Moya

enum MoviesService {
    case getUpcoming(page: Int)
    case getMovie(id: Int)
}

extension MoviesService: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/movie/")!
    }
    
    var path: String {
        
        switch (self) {
            case .getUpcoming(_):
                return "upcoming"
            
            case .getMovie(let id):
                return "movie/\(id)"
        }
    }
    
    var method: Method {
        switch (self) {
            case .getUpcoming(_):
                return .get
            
            case .getMovie(_):
                return .get
        }
    }
    
    var sampleData: Data {
        return Data() //TODO: Mock usage
    }
    
    var task: Task {
        let apiKey = "1f54bd990f1cdfb230adb312546d765d"
        let language = "pt-BR"
        let region = "BR"
        
        var params: [String: Any] = [:]
        params["api_key"] = apiKey
        params["language"] = language
        switch (self) {
            case .getUpcoming(let page):
                params["page"] = page
                params["region"] = region
                break
            case .getMovie(_):
                break
        }
        
        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
