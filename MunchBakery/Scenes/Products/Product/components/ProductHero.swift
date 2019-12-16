//
//  ProductHero.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 12/4/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class ProductHero: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    var product: ProductEntity?
    
    @IBOutlet private var contentView: UIView!
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    // MARK: - Customize init
    
    private func commonInit() {
        Bundle.main.loadNibNamed(ProductHero.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func setProduct(_ product: ProductEntity?) {
        self.product = product
        self.priceLbl.text = String(product?.price ?? 0) + " SAR"
        self.titleLbl.text = product?.title
        
        product?.loadImage(self.productImage)
    }
}
