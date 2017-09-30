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

    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var shopButton: UIButton!
    @IBOutlet weak var activitiesButton: UIButton!
    var context: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()

        if (Network().isConnected()) {
            ExecuteOnceInteractorImpl().execute {
                loader.isHidden = false
                loader.startAnimating()
                self.shopButton.isEnabled = false
                self.activitiesButton.isEnabled = false
                initializeData()
            }
        } else {
            let alert = UIAlertController(title: "Alert", message: "There is not connection to internet", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
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
                        self.loader.stopAnimating()
                        self.loader.isHidden = true
                        SetExecutedOnceInteractorImpl().execute()
                    })
                }
            })
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! ViewController
        
        switch segue.identifier! {
        case "shopView":
                vc.title = "Shop"
                vc.type = "shop"
        case "activitiesView":
                vc.title = "Actividades"
                vc.type = "activity"
        default:
            print("")
        }
        
        vc.context = self.context
        
    }
    

}
