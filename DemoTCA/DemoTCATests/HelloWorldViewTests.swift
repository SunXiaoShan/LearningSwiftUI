//
//  HelloWorldViewTests.swift
//  DemoTCATests
//
//  Created by huangphineas on 2023/3/1.
//

import XCTest
import ComposableArchitecture

final class HelloWorldViewTests: XCTestCase {

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

    func testCounterIncrement() throws {
        var state:HelloWorldState = HelloWorldState()
        let store = TestStore(
            initialState: state,
            reducer: helloWorldReducer,
            environment: .live
        )
        store.send(.increase) { state in
            state.cells = []
            state.isLoading = false
            state.count += 1
      }
    }
}
