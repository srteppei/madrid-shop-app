//
//  ShopCell.swift
//  MadridShops
//
//  Created by yisus on 08/09/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit

class ShopCell: UICollectionViewCell {
    var shop: ShopOrActivity?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    func refresh(shop: ShopOrActivity) {
        self.shop = shop
        
        self.label.text = shop.name
        self.shop?.logo.loadImage(into: imageView)
        imageView.clipsToBounds = true
        UIView.animate(withDuration: 1.0) {
            self.imageView.layer.cornerRadius = 30
        }
    }
}
