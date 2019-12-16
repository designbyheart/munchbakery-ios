//
//  ProductsCollectionView.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 9/3/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

protocol ProductsCollectionViewDelegate: class {
    
    func productSelected(_ product: ProductEntity)

}

class ProductsCollectionView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var missingItemsLbl: UILabel!
    weak var delegate: ProductsCollectionViewDelegate?
    
    // MARK: - Properties
    
    var cellHeight: CGFloat = 50.0 {
        didSet {
            self.currentCellHeight = self.cellHeight
        }
    }
    var parentVC: UIViewController?
    var currentCellHeight: CGFloat = 50
    
    var title = "Reccommended for you" {
        didSet {
            self.titleLbl.text = self.title
        }
    }
    var productDataItems = [ProductEntity]() {
        didSet {
            self.collectionView.reloadData()
            self.missingItemsLbl.isHidden = self.productDataItems.count > 0
        }
    }
    var isHorizontal = true {
        didSet {
            self.updateScrollDirection()
        }
    }
    
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
        Bundle.main.loadNibNamed(ProductsCollectionView.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.registerCell()
        self.contentView.frame = CGRect(origin: CGPoint.zero, size: self.frame.size)
        self.missingItemsLbl.text = UserDefaults.lang() == "1" ? "There is no data to display." : "لا توجد بيانات لعرضها."
        self.cellHeight = self.collectionView.frame.size.height
    }
    
    private func registerCell() {
        collectionView.register(UINib(nibName: CakeCollectionViewCell.name, bundle: nil), forCellWithReuseIdentifier: CakeCollectionViewCell.name)
    }
    
    private func updateScrollDirection() {
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = isHorizontal ? UICollectionView.ScrollDirection.horizontal : UICollectionView.ScrollDirection.vertical
        }
    }
    
}

extension ProductsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.productDataItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cakeCell = collectionView.dequeueReusableCell(withReuseIdentifier: CakeCollectionViewCell.name, for: indexPath) as? CakeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cakeCell.updateProduct(self.productDataItems[indexPath.row])
        cakeCell.didSelectProduct = { product in
        
            self.delegate?.productSelected(self.productDataItems[indexPath.row])
        }
        return cakeCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        self.delegate?.productSelected(self.productDataItems[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 5, height: self.cellHeight)
    }
    
}
