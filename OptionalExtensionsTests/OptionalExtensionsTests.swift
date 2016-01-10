//
//  OptionalExtensionsTests.swift
//  OptionalExtensionsTests
//
//  Created by Alan Skipp on 30/12/2015.
//  Copyright © 2015 Rui Peres. All rights reserved.
//

import XCTest
import OptionalExtensions

class OptionalExtensionsTests: XCTestCase {
    
    func testFilter() {
        let number: Int? = 3
        
        let biggerThan2 = number.filter { $0 > 2 }
        let biggerThan3 = number.filter { $0 > 3 }
        
        XCTAssertTrue(biggerThan2 == .Some(3))
        XCTAssertTrue(biggerThan3 == .None)
    }
    
    func testReplaceNil() {
        let number: Int? = 3
        let opt3 = number.replaceNil(with: 2)
        XCTAssertTrue(opt3 == .Some(3))
        
        let nilledNumber: Int? = nil
        let opt2 = nilledNumber.replaceNil(with: 2)
        XCTAssertTrue(opt2 == .Some(2))
    }
    
    func testApply() {
        var testInt = 0

        let nilledNumber: Int? = nil
        nilledNumber.then { testInt = $0 }
        XCTAssertTrue(testInt == 0)

        let number: Int? = 3
        number.then { testInt = $0 }
        XCTAssertTrue(testInt == 3)
    }
    
    func testOnSome() {
        var testInt = 0
        
        let nilledNumber: Int? = nil
        let sameNilledNumber = nilledNumber.onSome { print($0) }
        XCTAssertTrue(testInt == 0)
        XCTAssertTrue(sameNilledNumber == .None)

        let number: Int? = 3
        let sameNumber = number.onSome { testInt = $0 }
        XCTAssertTrue(testInt == 3)
        XCTAssertTrue(sameNumber == .Some(3))
    }
    
    func testOnNone() {
        var testInt = 0
        
        let number: Int? = 3
        let sameNumber = number.onNone { testInt = 99 }
        XCTAssertTrue(testInt == 0)
        XCTAssertTrue(sameNumber == .Some(3))
        
        let nilledNumber: Int? = nil
        let sameNilledNumber = nilledNumber.onNone { testInt = 99 }
        XCTAssertTrue(testInt == 99)
        XCTAssertTrue(sameNilledNumber == .None)
    }
    
    func testIsSome() {
        let number: Int? = 3
        XCTAssertTrue(number.isSome)
        
        let nilledNumber: Int? = nil
        XCTAssertFalse(nilledNumber.isSome)
    }
    
    func testIsNone() {
        let number: Int? = 3
        XCTAssertFalse(number.isNone)
        
        let nilledNumber: Int? = nil
        XCTAssertTrue(nilledNumber.isNone)
    }
    
    func testIsEqutable() {
        
        let number: Int? = 3
        XCTAssert(number == 3)
        
        let nilledNumber: Int? = nil
        XCTAssert(nilledNumber != 3)
    }
}
