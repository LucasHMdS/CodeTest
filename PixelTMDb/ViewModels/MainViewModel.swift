//
//  MainViewModel.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado Da Silva on 19/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import RxSwift

class MainViewModel {
    func fetchUpcomingMovies() {
        MoviesNetworkManager.shared.getUpcoming(page: 1).subscribe(onSuccess: {
            upcomingResponse in
            
            print(upcomingResponse)
        }, onError: {
            error in
            
            print(error)
        })
    }
}
