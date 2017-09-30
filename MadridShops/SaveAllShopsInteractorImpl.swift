//
//  SaveAllShopsInteractorImpl.swift
//  MadridShops
//
//  Created by Diego Freniche Brito on 15/09/2017.
//  Copyright © 2017 KC. All rights reserved.
//

import CoreData

class SaveAllShopsInteractorImpl: SaveAllShopsInteractor {
    func execute(shops: ShopsOrActivities, context: NSManagedObjectContext,type: TypeCD , action: @escaping (NSManagedObjectContext, ShopOrActivity,TypeCD) -> NSManagedObject, onSuccess: @escaping (ShopsOrActivities) -> Void, onError: errorClosure) {
        for i in 0 ..< shops.count() {
            let shop = shops.get(index: i)
            
            let _ = action(context,shop,type)
        }
        
        do {
            try context.save()
            onSuccess(shops)
        } catch  {
            //onError(error)
        }
    }
    
    func execute(shops: ShopsOrActivities, context: NSManagedObjectContext,type: TypeCD ,action: @escaping (NSManagedObjectContext, ShopOrActivity,TypeCD) -> NSManagedObject, onSuccess: @escaping (ShopsOrActivities) -> Void) {
        execute(shops: shops, context: context,type: type,action: action, onSuccess: onSuccess, onError: nil)
    }
    
}
