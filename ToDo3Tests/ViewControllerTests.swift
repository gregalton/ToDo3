//
//  ViewControllerTests.swift
//  ToDo3Tests
//
//  Created by Greg Alton on 8/18/19.
//  Copyright © 2019 Greg Alton. All rights reserved.
//

import XCTest
import CoreData
@testable import ToDo3

class ViewControllerTests: XCTestCase {

    var controller: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        controller = vc
        _ = controller.view
    }
    
    func testTableView() {
        XCTAssertNotNil(controller.tableView, "TableView is missing")
    }

}
