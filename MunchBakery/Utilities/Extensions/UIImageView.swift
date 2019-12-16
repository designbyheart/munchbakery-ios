//
//  UIImage.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 11/28/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit
import Nuke

extension UIImageView {
    
    func loadImage(_ url: String? = nil, placeholder: UIImage? = nil) {
        
        guard
            let url = url,
            let requestUrl = URL(string: url)
            else {
                if let placeholder = placeholder {
                    self.image = placeholder
                }
                return
        }
        Nuke.loadImage(with: requestUrl, into: self)
    }

    func cancelImage() {
        Nuke.cancelRequest(for: self)
    }
    
}
