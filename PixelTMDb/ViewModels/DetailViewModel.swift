//
//  DetailViewModel.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado da Silva on 22/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import RxSwift
import RxCocoa

class DetailViewModel {
    // MARK: - Private Constants & Variables
    private let disposeBag = DisposeBag()
    private let movieId: Int
    
    // MARK: - Public Constants & Variables
    let isLoading: PublishSubject<Bool> = PublishSubject()
    let movie: PublishSubject<Movie> = PublishSubject()
    let errorMessage: PublishSubject<String> = PublishSubject()
    
    // MARK: - Public Functions
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    func fetchMovie() {
        isLoading.onNext(true)
        MoviesNetworkManager.shared.getMovie(id: movieId).subscribe(onSuccess: {
            [weak self] movie in
            guard let `self` = self else { return }
            self.isLoading.onNext(false)
            self.movie.onNext(movie)
        }, onError: {
            [weak self] error in
            guard let `self` = self else { return }
            self.isLoading.onNext(false)
            self.errorMessage.onNext(error.localizedDescription)
        }).disposed(by: disposeBag)
    }
}
