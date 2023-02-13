//
//  HomeUseCaseTest.swift
//  testTests
//
//  Created by Cristian Contreras on 9/2/23.
//

import XCTest
import Combine
import Rswift
@testable import test

final class HomeUseCaseTest: XCTestCase {

    private var cancellables: [AnyCancellable] = []
    
    override class func setUp() {
        
    }
    
    func test_parsing_JSON() {
        
    }
    
    func test_searchHomeSucceeds() {
        // Given
        var result: LoadableState<[Home]>!
        let expectation = self.expectation(description: "movies")
        let uc = HomeUseCaseMockup()
        uc.execute().sink { state in
            result = state
            expectation.fulfill()
        }.store(in: &cancellables)

        // Then
        self.waitForExpectations(timeout: 1.0, handler: nil)
        guard case .result(_) = result! else {
            XCTFail()
            return
        }
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
