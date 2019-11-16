//
//  MainViewModelTest.swift
//  PixelTMDbTests
//
//  Created by Lucas Henrique Machado da Silva on 23/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import RxSwift
import XCTest
@testable import PixelTMDb

class MainViewModelTest: XCTestCase {
    // MARK: - Constants
    let disposeBag = DisposeBag()
    let timeout = 60.0
    
    // MARK: - Variables
    var viewModel: MainViewModel?
    
    // MARK: - Test Lifecycle
    override func setUp() {
        super.setUp()
        viewModel = MainViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testMainViewModel() {
        let loadingExpectation = XCTestExpectation(description: "Detail loading working.")
        let informationExpectation = XCTestExpectation(description: "Detail loading working.")
        let listExpectation = XCTestExpectation(description: "Upcoming movies loaded.")
        
        var informationTested = false
        
        viewModel?.isLoading.map { _ in
            loadingExpectation.fulfill()
        }.subscribe().disposed(by: disposeBag)
        
        viewModel?.informationMessage.map { _ in
            informationTested = true
            informationExpectation.fulfill()
        }.subscribe().disposed(by: disposeBag)
        
        viewModel?.errorMessage.map {
            errorMessage in
            XCTFail("Error: \(errorMessage)")
        }.subscribe().disposed(by: disposeBag)
        
        viewModel?.movies.map {
            [weak self] _ in
            guard let `self` = self else { return }
            listExpectation.fulfill()
            
            if (!informationTested) {
                self.viewModel?.fetchUpcomingMovies()
            }
        }.subscribe().disposed(by: disposeBag)
        
        viewModel?.fetchUpcomingMovies()
        
        wait(for: [loadingExpectation, informationExpectation, listExpectation], timeout: self.timeout)
    }
}
