//
//  MapShops.swift
//  MadridShops
//
//  Created by yisus on 18/09/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import CoreData

func mapShopOrActivityCDIntoShopOrActivity(shopOrActivityCD: ShopOrActivityCD) -> ShopOrActivity {
    let shop = ShopOrActivity(name: shopOrActivityCD.name ?? "Empty",type: shopOrActivityCD.typeRelationship?.type ?? "")
    shop.address = shopOrActivityCD.address ?? ""
    shop.image = shopOrActivityCD.image ?? ""
    shop.logo = shopOrActivityCD.logo ?? ""
    
    shop.latitude = shopOrActivityCD.latitude
    shop.longitude = shopOrActivityCD.longitude
    
    shop.description = shopOrActivityCD.description_en ?? ""
    shop.openingHours = shopOrActivityCD.openingHours ?? ""
    
    return shop
}

func mapShopOrActivityIntoShopOrActivityCD(context: NSManagedObjectContext, shop: ShopOrActivity, type: TypeCD) -> ShopOrActivityCD {
    // mapping shop into ShopCD
    let shopOrActivityCD = ShopOrActivityCD(context: context)
    shopOrActivityCD.name = shop.name
    shopOrActivityCD.typeRelationship = type
    
    shopOrActivityCD.address = shop.address
    shopOrActivityCD.image = shop.image
    shopOrActivityCD.logo = shop.logo
    
    shopOrActivityCD.latitude = shop.latitude ?? 0.0
    shopOrActivityCD.longitude = shop.longitude ?? 0.0
    shopOrActivityCD.description_en = shop.description
    shopOrActivityCD.openingHours = shop.openingHours
    
    return shopOrActivityCD
}

