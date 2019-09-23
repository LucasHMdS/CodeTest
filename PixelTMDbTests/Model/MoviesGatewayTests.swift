//
//  MoviesGatewayTests.swift
//  PixelTMDbTests
//
//  Created by Lucas Henrique Machado da Silva on 23/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import RxSwift
import XCTest
@testable import PixelTMDb

class MoviesGatewayTests: XCTestCase {
    // MARK: - Constants
    let disposeBag = DisposeBag()
    let timeout = 30.0
    
    // MARK: - Test Lifecycle
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Gateway Tests
    func testUpcomingMovies() {
        let page = 1
        let expectation = XCTestExpectation(description: "Get TMDb upcoming movies.")
        
        MoviesNetworkManager.shared.getUpcoming(page: page).subscribe(onSuccess: {
            upcomingResponse in
            expectation.fulfill()
        }, onError: {
            error in
            XCTFail("Error: \(error.localizedDescription)")
        }).disposed(by: disposeBag)
        
        wait(for: [expectation], timeout: self.timeout)
    }
    
    func testMovieDetails() {
        let movieId = 454640
        let expectation = XCTestExpectation(description: "Get TMDb movie details.")
        
        MoviesNetworkManager.shared.getMovie(id: movieId).subscribe(onSuccess: {
            movie in
            expectation.fulfill()
        }, onError: {
            error in
            XCTFail("Error: \(error.localizedDescription)")
        }).disposed(by: disposeBag)
        
        wait(for: [expectation], timeout: self.timeout)
    }
}
