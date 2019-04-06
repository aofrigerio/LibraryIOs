//
//  UIViewController+Async.swift
//  LibraryDemo
//
//  Created by FIBBAURU on 06/04/19.
//  Copyright © 2019 FIB. All rights reserved.
//

import Foundation
import MBProgressHUD

extension UIViewController {
    func ld_performAsnc(
        action: (@escaping (Error?) -> Void) -> Void
        ) {
        MBProgressHUD.showAdded(to: view, animated: true)
        action { [weak self] error in
            
            if let strongSelf = self {
                MBProgressHUD.hide(
                    for: strongSelf.view,
                    animated: true
                )
                
            if let error = error {
                let alertController = UIAlertController(title: "Error"
                , message: "Deu erro, parça"
                , preferredStyle: .alert
            )
            
            alertController.addAction(UIAlertAction(
                title: "Ok"
                , style: .default
                , handler: nil)
            )
                
                strongSelf.present(alertController,animated:  true, completion: nil)
            }
            }
        }
    }
}
