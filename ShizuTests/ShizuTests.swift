//
//  ShizuTests.swift
//  ShizuTests
//
//  Created by Ahmet Ozen on 9.02.2024.
//

import XCTest
@testable import Shizu

final class ShizuTests: XCTestCase {


    func testMax() throws {
        // Setup data
        let data1 = (x:3,y:11,z:7)
        
        // Expected values
       let expectedValue1 = 11
        
        
        
        
        // Test
        XCTAssertEqual(expectedValue1, myMax(x: data1.x, y: data1.y, z: data1.z))
        
    }
}
