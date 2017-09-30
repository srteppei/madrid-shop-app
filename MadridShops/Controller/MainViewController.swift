//
//  MainViewController.swift
//  MadridShops
//
//  Created by yisus on 11/09/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit
import FillableLoaders
import CoreData

class MainViewController: UIViewController {

    @IBOutlet weak var shopButton: UIButton!
    @IBOutlet weak var activitiesButton: UIButton!
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ExecuteOnceInteractorImpl().execute {
            self.shopButton.isEnabled = false
            self.activitiesButton.isEnabled = false
            initializeData()
        }
        
    }
    
    func initializeData() {
        let shopType: TypeCD = TypeCD(context: self.context)
        let activityType: TypeCD = TypeCD(context: self.context)
        
        shopType.type = "shop"
        activityType.type = "activity"      
            
        let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImpl(url:"https://madrid-shops.com/json_new/getShops.php")
        let downloadActivitiesInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImpl(url:"https://madrid-shops.com/json_new/getActivities.php")
        
        downloadShopsInteractor.execute (type: "shop") {(shops: ShopsOrActivities) in
            let cacheInteractor = SaveAllShopsInteractorImpl()
            cacheInteractor.execute(shops: shops, context: self.context,type: shopType,action: mapShopOrActivityIntoShopOrActivityCD, onSuccess: { (shops: ShopsOrActivities) in
                self.shopButton.isEnabled = true
                downloadActivitiesInteractor.execute (type: "activity") { (shops: ShopsOrActivities) in
                    cacheInteractor.execute(shops: shops, context: self.context,type: activityType,action: mapShopOrActivityIntoShopOrActivityCD, onSuccess: { (shops: ShopsOrActivities) in
                        self.activitiesButton.isEnabled = true
                        SetExecutedOnceInteractorImpl().execute()
                    })
                }
            })
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! ViewController
        vc.context = self.context
        
    }
    

}
