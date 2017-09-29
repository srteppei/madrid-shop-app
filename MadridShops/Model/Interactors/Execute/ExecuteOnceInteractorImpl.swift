//
//  ExecuteOnceInteractorImpl.swift
//  MadridShops
//
//  Created by yisus on 18/09/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import Foundation

class ExecuteOnceInteractorImpl: ExecuteOnceInteractor {
    func execute(closure: () -> Void) {
        let defaults = UserDefaults.standard
        
        if let _ = defaults.string(forKey: "once") {
            // already saved
        } else {    // first time
            closure()
        }
    }
}
