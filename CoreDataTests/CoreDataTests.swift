//
//  CoreDataTests.swift
//  CoreDataTests
//
//  Created by Greg Alton on 8/17/19.
//  Copyright © 2019 Greg Alton. All rights reserved.
//

import XCTest
import CoreData
@testable import ToDo3

class CoreDataTests: XCTestCase {
    
    let moContext = PersistentService.context
    var items = [ListItem]()
    
    // Test managed object context is not nil
    func testContext() {
        //let moContext = PersistentService.context
        
        XCTAssertNotNil(moContext)
    }
    
    // Test core data stack initialization
    func testCoreDataStackInitialization() {
        let container = PersistentService.persistentContainer
        
        XCTAssertNotNil(container)
    }

}
