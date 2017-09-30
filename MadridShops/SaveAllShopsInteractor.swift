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
    func execute(shops: Shops, context: NSManagedObjectContext, action: @escaping (NSManagedObjectContext,Shop) -> NSManagedObject ,onSuccess: @escaping (Shops) -> Void, onError: errorClosure)
    func execute(shops: Shops, context: NSManagedObjectContext, action: @escaping (NSManagedObjectContext,Shop) -> NSManagedObject , onSuccess: @escaping (Shops) -> Void)
}
