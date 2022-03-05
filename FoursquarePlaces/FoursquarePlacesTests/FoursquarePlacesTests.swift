//
//  FoursquarePlacesTests.swift
//  FoursquarePlacesTests
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import XCTest
import SwiftUIFlux
@testable import FoursquarePlaces

class FoursquarePlacesTests: XCTestCase {

    private var sut = store
    private var sutApp = AppState()
    private var mockAction:PlacesActions.SetPlaces!
    
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
    
    func testOnPlacesApiSuccess() {
        var item = Place()
        item.id = "123"
        mockAction = PlacesActions.SetPlaces(response: [item], nextPageCursor: "")
        store.dispatch(action: mockAction)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertEqual(self.sut.state.placesState.places[0].id, item.id)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}



