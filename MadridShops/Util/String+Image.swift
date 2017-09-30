//
//  String+Image.swift
//  MadridShops
//
//  Created by yisus on 12/09/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit

extension String {
    func loadImage(into imageView: UIImageView) {
        let queue = OperationQueue()
        queue.addOperation {
            if let url = URL(string: self),
                let data = NSData(contentsOf: url),
                let image = UIImage(data: data as Data) {
                
                OperationQueue.main.addOperation {
                    imageView.image = image
                }
            }
        }
    }
    
  
}

func mapsImageUrl (latitud: Float,longitude: Float) -> String {
    return "https://maps.googleapis.com/maps/api/staticmap?center=\(latitud),\(longitude)&zoom=17&size=320x220"
}
