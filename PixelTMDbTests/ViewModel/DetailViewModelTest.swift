//
//  DetailViewModelTest.swift
//  PixelTMDbTests
//
//  Created by Lucas Henrique Machado da Silva on 23/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import RxSwift
import XCTest
@testable import PixelTMDb

class DetailViewModelTest: XCTestCase {
    // MARK: - Constants
    let disposeBag = DisposeBag()
    let movieId = 454640
    let timeout = 30.0
    
    // MARK: - Variables
    var viewModel: DetailViewModel?
    
    // MARK: - Test Lifecycle
    override func setUp() {
        super.setUp()
        viewModel = DetailViewModel(movieId: movieId)
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testDetailViewModel() {
        let loadingExpectation = XCTestExpectation(description: "Detail loading working.")
        let movieExpectation = XCTestExpectation(description: "Movie details loaded.")
        
        viewModel?.isLoading.map { _ in
            loadingExpectation.fulfill()
        }.subscribe().disposed(by: disposeBag)
        
        viewModel?.errorMessage.map {
            errorMessage in
            XCTFail("Error: \(errorMessage)")
        }.subscribe().disposed(by: disposeBag)
        
        viewModel?.movie.map { _ in
            movieExpectation.fulfill()
        }.subscribe().disposed(by: disposeBag)
        
        viewModel?.fetchMovie()
        
        wait(for: [loadingExpectation, movieExpectation], timeout: self.timeout)
    }
}
