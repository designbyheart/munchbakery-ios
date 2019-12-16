//
//  UIViewController.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 9/8/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static var name: String {
        return String(describing: self)
    }
    
    func viewController<T: UIViewController>(_ named: String, _ vcClass: T.Type, storyboard: String? = nil) -> UIViewController? {
        if let storyboardName = storyboard {
            let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: named) as? T else {
                print("UIViewController Extension Error: missing view controller with name: ", named)
                return nil
            }
            return vc
        }
        
        let vc = vcClass.init(nibName: vcClass.name, bundle: nil)
        return vc
    }
    
    func navigateTo(_ destination: UIViewController) {
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    @objc func goBack(){
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @objc func dismissAmountPicker() {
        NotificationCenter.default.post(name: .dismissPicker, object: nil)
    }
}
