//
//  CategoryCollectionViewCell.swift
//  MunchBakery
//
//  Created by Luka's Macbook on 09.09.19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var cakeImage: UIImageView!
    @IBOutlet weak var categoryNameLbl: UILabel!
    @IBOutlet weak var buyNowBtnOutlet: BorderButton!
    
    var didSelectedCategory: ((Int) -> Void)?
    
    // MARK: - Lifecycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    func updateCategory(_ category: CategoryEntity) {
        self.categoryNameLbl.text = category.name ?? ""
        self.cakeImage.loadImage(category.imagePath)
    }
    
    @IBAction func onSelectCategory(_ sender: UIButton) {
        didSelectedCategory?(sender.tag)
    }
}

// MARK: - UIStyling methods
extension CategoryCollectionViewCell: UIStyling {
    
    func setupViews() {
        self.buyNowBtnOutlet.borderSize = 2
        cakeImage.layer.cornerRadius = cakeImage.frame.height / 2
    }
    
    func setupConstraints() {
        
    }
    
}
