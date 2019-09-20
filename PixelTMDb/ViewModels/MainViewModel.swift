//
//  MainViewModel.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado Da Silva on 19/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import RxSwift

class MainViewModel {
    // MARK: - Private Constants & Variables
    private let disposeBag = DisposeBag()
    private let loadInProgress = Variable(false)
    private let movies = Variable([Movie]())
    private var currentPage = 0
    
    
    // MARK: - Public Constants & Variables
    let onShowError = PublishSubject<String>()
    
    var displayMovies: Observable<[Movie]> {
        return movies.asObservable()
    }
    
    var isLoading: Observable<Bool> {
        return loadInProgress.asObservable().distinctUntilChanged()
    }
    
    // MARK: - Public Functions
    func fetchUpcomingMovies() {
        loadInProgress.value = true
        MoviesNetworkManager.shared.getUpcoming(page: currentPage).subscribe(onSuccess: {
            [weak self] upcomingResponse in
            guard let `self` = self else { return }
            self.loadInProgress.value = false
            self.movies.value.append(contentsOf: upcomingResponse.results)
        }, onError: {
            [weak self] error in
            guard let `self` = self else { return }
            self.loadInProgress.value = false
            // TODO: Set error
        }).disposed(by: disposeBag)
    }
}
