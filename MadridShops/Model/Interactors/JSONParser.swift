//
//  JSONParser.swift
//  MadridShops
//
//  Created by yisus on 12/09/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import Foundation

func parseShopsOrActivities(data: Data,type: String) -> ShopsOrActivities {
    let shops = ShopsOrActivities()
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String, Any>]
        
        for shopJson in result {
            let shop = ShopOrActivity(name: shopJson["name"]! as! String, type: type)
            
            shop.address = shopJson["address"]! as! String
            shop.logo = shopJson["logo_img"] as! String
            shop.image = shopJson["img"] as! String
            shop.description = shopJson["description_en"] as! String
            
            shop.latitude = Float((shopJson["gps_lat"] as! String).replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression))
            shop.longitude = Float((shopJson["gps_lon"] as! String).replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression))
            
            shops.add(shop: shop)
        }
    } catch {
        print("Error parsing JSON")
    }
    return shops
}
