//
//  CategoryCollectionView.swift
//  MunchBakery
//
//  Created by Luka's Macbook on 09.09.19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

protocol CategoryCollectionViewDelegate: class {
    func didSelect(_ categoryData: CategoryEntity)
}

class CategoryCollectionView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var missingItemsLbl: UILabel!
    
    var isLoading = false {
        didSet{
            if(isLoading == false) {
                self.missingItemsLbl.text = UserDefaults.lang() == "1" ? "There is no data to display." : "لا توجد بيانات لعرضها."
            }
        }
    }
    var showEmptyData = false {
        didSet {
            self.missingItemsLbl.isHidden = !self.showEmptyData
        }
    }
    
    // MARK: - Properties
    
    private var contentViewInitialized = false
    var categoryDataItems = [CategoryEntity]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.showEmptyData = false
            }
        }
    }
    weak var delegate: CategoryCollectionViewDelegate?
    
    // MARK: - Lifecycle methods
    
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
        if contentViewInitialized {
            return
        }
        Bundle.main.loadNibNamed(CategoryCollectionView.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.backgroundColor = .clear
        self.registerCell()
        contentViewInitialized = true
        
        self.missingItemsLbl.text = ""
    }
    
    private func registerCell() {
        collectionView.register(UINib(nibName: CategoryCollectionViewCell.name, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.name)
    }
    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout methods

extension CategoryCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryDataItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.name, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        categoryCell.updateCategory(categoryDataItems[indexPath.row])
        return categoryCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        delegate?.didSelect(categoryDataItems[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 5, height: 180)
    }
    
}
