//
//  MapActivities.swift
//  MadridShops
//
//  Created by yisus on 29/09/2017.
//  Copyright © 2017 KC. All rights reserved.
//

import CoreData

func mapActivityCDIntoShop(activityCD: ActivityCD) -> Shop {
    let shop = Shop(name: activityCD.name ?? "Empty")
    shop.address = activityCD.address ?? ""
    shop.image = activityCD.image ?? ""
    shop.logo = activityCD.logo ?? ""
    
    shop.latitude = activityCD.latitude
    shop.longitude = activityCD.longitude
    
    shop.description = activityCD.description_en ?? ""
    shop.openingHours = activityCD.openingHours ?? ""
    
    return shop
}

func mapActivityIntoShopCD(context: NSManagedObjectContext, shop: Shop) -> ActivityCD {
    // mapping shop into ShopCD
    let activityCD = ActivityCD(context: context)
    activityCD.name = shop.name
    activityCD.address = shop.address
    activityCD.image = shop.image
    activityCD.logo = shop.logo
    
    activityCD.latitude = shop.latitude ?? 0.0
    activityCD.longitude = shop.longitude ?? 0.0
    activityCD.description_en = shop.description
    activityCD.openingHours = shop.openingHours
    
    return activityCD
}
