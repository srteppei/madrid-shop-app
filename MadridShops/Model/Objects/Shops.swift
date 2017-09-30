//
//  Shops.swift
//  MadridShops
//
//  Created by yisus on 07/09/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import Foundation

public protocol ShopsOrActivityProtocol {
    func count() -> Int
    func add(shop: ShopOrActivity)
    func get(index: Int) -> ShopOrActivity
}

public class ShopsOrActivities: ShopsOrActivityProtocol {
    private var shopsList: [ShopOrActivity]?

    public init() {
        self.shopsList = []
    }
    
    public func count() -> Int {
        return (shopsList?.count)!
    }
    
    public func add(shop: ShopOrActivity) {
        shopsList?.append(shop)
    }
    
    public func get(index: Int) -> ShopOrActivity {
        return (shopsList?[index])!
    }
}
