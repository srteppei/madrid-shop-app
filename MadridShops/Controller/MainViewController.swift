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

    var context: NSManagedObjectContext!
    @IBOutlet weak var redRectangle: UIView!
    var myLoader: WavesLoader?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! ViewController
        vc.context = self.context
        
    }
    

}
