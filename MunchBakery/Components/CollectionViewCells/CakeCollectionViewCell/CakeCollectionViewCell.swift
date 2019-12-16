//
//  CakeCollectionViewCell.swift
//  MunchBakery
//
//  Created by Luka's Macbook on 31.08.19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class CakeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var cakeImage: UIImageView!
    @IBOutlet weak var cakeNameLabel: UILabel!
    @IBOutlet weak var cakePriceLabel: UILabel!
    @IBOutlet weak var addToCartButtonOutlet: BorderButton!
    
    // MARK: - Properties
    
    var didSelectProduct: ((ProductEntity) -> Void)?
    var didDismissPicker: (() -> Void)?
    
    var product: ProductEntity?
    
    // MARK: - Lifecycle methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupViews()
    }
    
    func updateProduct(_ product: ProductEntity) {
        self.product = product
        self.cakeNameLabel.text = product.title
        self.cakePriceLabel.text = "\(product.price) SAR"
        product.loadImage(self.cakeImage)
        
    }
    
    // MARK: - Actions
    
    @IBAction func addToCartButtonTapped(_ sender: UIButton) {
        if let product = self.product {
            didSelectProduct?(product)
        }
    }
    
    @IBAction func didDismissed() {
        didDismissPicker?()
    }
    
}

// MARK: - UIStyling methods
extension CakeCollectionViewCell: UIStyling {
    
    func setupViews() {
        addToCartButtonOutlet.layer.cornerRadius = 10
        cakeImage.layer.cornerRadius = cakeImage.frame.height / 2
    }
    
    func setupConstraints() {
        
    }
    
}
