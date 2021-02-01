//
//  MainCatalogTest.swift
//  TestQulixTests
//
//  Created by Nikita Moskalenko on 2/1/21.
//

import XCTest
@testable import TestQulix

final class MockView: UIView {
}

class MainCatalogTest: XCTestCase {
    
    var view: MockView!
    var controller: MainCatalogController!
    var model: MaiNCatalogModel!

    override func setUpWithError() throws {
        view = MockView()
        controller = MainCatalogController()
        model = MaiNCatalogModel()
    }

    override func tearDownWithError() throws {
        view = nil
        controller = nil
        model = nil
    }
    
    func testModulIsNotNil() {
        XCTAssertNotNil(view, "view is not nil")
        XCTAssertNotNil(controller, "controller is not nil")
    }
}
