//
//  ViewController.swift
//  MadridShops
//
//  Created by yisus on 07/09/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import MapKit

class ViewController: UIViewController {

    var context: NSManagedObjectContext!
    var type: String!
    @IBOutlet weak var shopsCollectionView: UICollectionView!
    
    @IBOutlet weak var map: MKMapView!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.map.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
                
        self.shopsCollectionView.delegate = self
        self.shopsCollectionView.dataSource = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.map.showsUserLocation = true
        
        let madridLocation = CLLocation(latitude:  40.416775, longitude: -3.703790)
        let madridRegion = MKCoordinateRegion(center: madridLocation.coordinate, span:
            MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        
        self.map.setRegion(madridRegion, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let shop: ShopOrActivityCD = self.fetchedResultsController.object(at: indexPath)
        self.performSegue(withIdentifier: "ShowShopDetailSegue", sender: shop)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopDetailSegue" {
            let vc = segue.destination as! ShopDetailViewController

            let shopCD: ShopOrActivityCD = sender as! ShopOrActivityCD
            vc.shop = mapShopOrActivityCDIntoShopOrActivity(shopOrActivityCD: shopCD)
        }
    }

    // MARK: - Fetched results controller
    var _fetchedResultsController: NSFetchedResultsController<ShopOrActivityCD>? = nil

    var fetchedResultsController: NSFetchedResultsController<ShopOrActivityCD> {
        if (_fetchedResultsController != nil) {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<ShopOrActivityCD> = ShopOrActivityCD.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        fetchRequest.predicate = NSPredicate(format: "typeRelationship.type == %@", self.type)
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        // fetchRequest == SELECT * FROM EVENT ORDER BY TIMESTAMP DESC
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "ShopsCacheFile")
        // aFetchedResultsController.delegate = self
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        self.map.setCenter(location.coordinate, animated: true)
    }
    

}

