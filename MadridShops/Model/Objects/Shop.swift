//
//  Shop.swift
//  MadridShops
//
//  Created by yisus on 07/09/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import Foundation

public class Shop {
    var name: String
    var description: String = ""
    var latitude: Float? = nil
    var longitude: Float? = nil
    var image: String = ""
    var logo: String = ""
    var openingHours: String = ""
    var address: String = ""
    
    public init(name: String) {
        self.name = name
    }
}
