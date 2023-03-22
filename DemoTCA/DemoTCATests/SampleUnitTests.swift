//
//  SampleUnitTests.swift
//  DemoTCATests
//
//  Created by huangphineas on 2023/3/2.
//

import XCTest
import ComposableArchitecture

final class SampleUnitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
    }

    func testCounterIncrement() throws {
        var state:SampleUnitTestState = SampleUnitTestState()
        let store = TestStore(
            initialState: state,
            reducer: sampleUnitTestReducer,
            environment: .live
        )
        store.send(.increase) {
            $0.count += 1
      }
    }
}
