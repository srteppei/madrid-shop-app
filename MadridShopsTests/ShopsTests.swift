//
//  ShopsTests.swift
//  MadridShopsTests
//
//  Created by yisus on 07/09/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import XCTest
import MadridShops

class ShopsTests: XCTestCase {
    
    func testGivenEmptyShopsNumberShopsIsZero() {
        let sut = ShopsOrActivities()
        XCTAssertEqual(0, sut.count())
    }
    
    func testGivenShopsWithOneElementNumberShopsIsOne() {
        let sut = ShopsOrActivities()
        sut.add(shop: ShopOrActivity(name: "Shop",type: "shop"))
        XCTAssertEqual(1, sut.count())
    }
}
