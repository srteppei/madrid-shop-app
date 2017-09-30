//
//  ExecuteOnce.swift
//  MadridShops
//
//  Created by yisus on 18/09/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import Foundation

protocol ExecuteOnceInteractor {
    func execute(closure: () -> Void)
}
