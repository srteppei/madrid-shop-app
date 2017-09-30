//
//  DownloadAllShopsInteractor.swift
//  MadridShops
//
//  Created by yisus on 07/09/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import Foundation

protocol DownloadAllShopsInteractor {
    // execute: downloads all shops. Return on the main thread
    func execute(type: String,onSuccess: @escaping (ShopsOrActivities) -> Void, onError: errorClosure)
    func execute(type: String,onSuccess: @escaping (ShopsOrActivities) -> Void)
}
