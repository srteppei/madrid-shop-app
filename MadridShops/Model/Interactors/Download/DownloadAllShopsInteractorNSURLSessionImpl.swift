//
//  DownloadAllShopsInteractorNSURLSessionImpl.swift
//  MadridShops
//
//  Created by yisus on 12/09/2017.
//  Copyright © 2017 yisus. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorNSURLSessionImpl: DownloadAllShopsInteractor {
    
    let url: String
    
    init(url: String) {
        self.url = url;
    }
    
    func execute(type: String,onSuccess: @escaping (ShopsOrActivities) -> Void, onError: errorClosure) {
        
        let session = URLSession.shared
        if let url = URL(string: self.url) {
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in

                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main)

                    if error == nil {
                        // OK
                        let shops = parseShopsOrActivities(data: data!,type: type)
                        onSuccess(shops)
                    } else {
                        // Error
                        if let myError = onError {
                            myError(error!)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func execute(type: String,onSuccess: @escaping (ShopsOrActivities) -> Void) {
        execute(type: type,onSuccess: onSuccess, onError: nil)
    }
    
    
}
