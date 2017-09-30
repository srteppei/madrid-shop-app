//
//  MapkitViewController.swift
//  MadridShops
//
//  Created by yisus on 30/09/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class CustomPointAnnotation: MKPointAnnotation {
    var shopOrActivityCD: ShopOrActivityCD?
}

extension ViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    
    func mapViewDidFinishRenderingMap (_ mapView: MKMapView, fullyRendered: Bool) {
        if let shopsOrActivitiesCD = self.fetchedResultsController.fetchedObjects {
            for shopOrActivityCD in shopsOrActivitiesCD {
                createPin(shopOrActivityCD: shopOrActivityCD)
            }
        }
    }
    
    func createPin(shopOrActivityCD: ShopOrActivityCD) {
        let shopLocation = CLLocationCoordinate2D(
                                        latitude: CLLocationDegrees(shopOrActivityCD.latitude),
                                        longitude: CLLocationDegrees(shopOrActivityCD.longitude))
        
        let annotation = CustomPointAnnotation()
        annotation.coordinate = shopLocation
        annotation.subtitle = shopOrActivityCD.openingHours!
        annotation.shopOrActivityCD = shopOrActivityCD
        
        self.map.addAnnotation(annotation)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        let pinIdent = "Pin";
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: pinIdent)
        
        if pinView == nil {
            
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: pinIdent);
            pinView?.canShowCallout = true
            
            let shopOrActivityCD: ShopOrActivityCD = (annotation as! CustomPointAnnotation).shopOrActivityCD!
            
            let image = UIImageView()
            shopOrActivityCD.logo?.loadImage(into: image)
            
            pinView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            pinView?.leftCalloutAccessoryView = image
            
        } else {
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if let annotation = view.annotation as? CustomPointAnnotation {
            let shopOrActivityCD = annotation.shopOrActivityCD
            performSegue(withIdentifier: "ShowShopDetailSegue", sender: shopOrActivityCD)
        }
    }
}
