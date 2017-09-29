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
    var myLoader: WavesLoader?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ExecuteOnceInteractorImpl().execute {
            initializeData()
        }
        
    }
    
    func initializeData() {
        let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImpl(url:"https://madrid-shops.com/json_new/getShops.php")
        let downloadActivitiesInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImpl(url:"https://madrid-shops.com/json_new/getActivities.php")
        
        downloadShopsInteractor.execute { (shops: Shops) in
            // todo OK
            print("Name: " + shops.get(index: 0).name)
            
            let cacheInteractor = SaveAllShopsInteractorImpl()
            cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in
                SetExecutedOnceInteractorImpl().execute()
                self.shopButton.isEnabled = true
                self.activitiesButton.isEnabled = true
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! ViewController
        vc.context = self.context
        
    }
    

}
