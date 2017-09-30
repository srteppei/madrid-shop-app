//
//  SaveAllShopsinteractor.swift
//  MadridShops
//
//  Created by yisus on 15/09/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import CoreData

protocol SaveAllShopsInteractor {
    // execute: saves all shops. Return on the main thread
    func execute(shops: ShopsOrActivities, context: NSManagedObjectContext,type: TypeCD ,action: @escaping (NSManagedObjectContext,ShopOrActivity,TypeCD) -> NSManagedObject ,onSuccess: @escaping (ShopsOrActivities) -> Void, onError: errorClosure)
    func execute(shops: ShopsOrActivities, context: NSManagedObjectContext, type: TypeCD ,action: @escaping (NSManagedObjectContext,ShopOrActivity,TypeCD) -> NSManagedObject , onSuccess: @escaping (ShopsOrActivities) -> Void)
}
