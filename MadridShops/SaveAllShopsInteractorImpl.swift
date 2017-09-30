//
//  SaveAllShopsInteractorImpl.swift
//  MadridShops
//
//  Created by Diego Freniche Brito on 15/09/2017.
//  Copyright © 2017 KC. All rights reserved.
//

import CoreData

class SaveAllShopsInteractorImpl: SaveAllShopsInteractor {
    func execute(shops: Shops, context: NSManagedObjectContext, action: @escaping (NSManagedObjectContext, Shop) -> NSManagedObject, onSuccess: @escaping (Shops) -> Void, onError: errorClosure) {
        for i in 0 ..< shops.count() {
            let shop = shops.get(index: i)
            
            let _ = action(context,shop)
        }
        
        do {
            try context.save()
            onSuccess(shops)
        } catch {
            // onError(nil)
        }
    }
    
    func execute(shops: Shops, context: NSManagedObjectContext, action: @escaping (NSManagedObjectContext, Shop) -> NSManagedObject, onSuccess: @escaping (Shops) -> Void) {
        execute(shops: shops, context: context,action: action, onSuccess: onSuccess, onError: nil)
    }
    
}
