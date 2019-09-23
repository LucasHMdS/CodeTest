//
//  MainViewModel.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado Da Silva on 19/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import RxSwift
import RxCocoa

class MainViewModel {
    // MARK: - Private Constants & Variables
    private let disposeBag = DisposeBag()
    private var movieCount = 0
    private var currentPage = 1
    private var totalPages = Int.max
    
    // MARK: - Public Constants & Variables
    let errorMessage: PublishSubject<String> = PublishSubject()
    let informationMessage: PublishSubject<String> = PublishSubject()
    let isLoading: PublishSubject<Bool> = PublishSubject()
    let movies: BehaviorRelay<[Movie]> = BehaviorRelay(value: [])
    let searchFilter: PublishSubject<String> = PublishSubject()
    
    // MARK: - Public Functions
    func fetchUpcomingMovies() {
        isLoading.onNext(true)
        guard (currentPage < totalPages) else {
            self.isLoading.onNext(false)
            self.informationMessage.onNext(R.string.main.noMoreMoviesToLoad())
            return
        }
        
        MoviesNetworkManager.shared.getUpcoming(page: currentPage).subscribe(onSuccess: {
            [weak self] upcomingResponse in
            guard let `self` = self else { return }
            self.isLoading.onNext(false)
            self.totalPages = upcomingResponse.totalPages
            
            let upcomingCount = upcomingResponse.results.count
            if (upcomingCount > 0) {
                self.movieCount += upcomingCount
                self.movies.accept(upcomingResponse.results)
            } else {
                self.informationMessage.onNext(R.string.main.noMoreMoviesToLoad())
            }
            
            self.currentPage += 1
        }, onError: {
            [weak self] error in
            guard let `self` = self else { return }
            self.isLoading.onNext(false)
            self.errorMessage.onNext(error.localizedDescription)
        }).disposed(by: disposeBag)
    }
    
    func loadedMovie(index: Int) {
        guard (index > (movieCount - 3)) else { return }
        self.fetchUpcomingMovies()
    }
    
    func searchMovie(title: String) {
        print(title)
        self.searchFilter.onNext(title)
    }
}
