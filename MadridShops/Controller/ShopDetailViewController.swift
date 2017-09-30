//
//  ShopDetailViewController.swift
//  MadridShops
//
//  Created by yisus on 12/09/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import UIKit

class ShopDetailViewController: UIViewController {

    var shop: ShopOrActivity!
    
    @IBOutlet weak var shopDetailDescription: UITextView!
    
    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var shopAdress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.shop.name
        self.shopDetailDescription.text = self.shop.description
        self.shopAdress.text = self.shop.address
        mapsImageUrl(latitud: self.shop.latitude!, longitude: self.shop.longitude!).loadImage(into: shopImage)
        
    }

}
