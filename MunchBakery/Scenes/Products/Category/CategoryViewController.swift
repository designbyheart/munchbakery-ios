//
//  CategoryViewController.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 8/25/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var categoriesCollectionView: CategoryCollectionView!
    
    // MARK: - Properties
    
    var categoryRepo = CategoryRepository()
    var categoryDataItems = [CategoryEntity]()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoriesCollectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.categoriesCollectionView.showEmptyData = true
        self.categoriesCollectionView.isLoading = true
        categoryRepo.loadFromAPI(completion: { (categories, error) in
            if let error = error {
                print(error)
            }
            self.categoriesCollectionView?.categoryDataItems = categories
            self.categoriesCollectionView.isLoading = true
        })
    }
}

// MARK: - CategoryCollectionViewDelegate method

extension CategoryViewController: CategoryCollectionViewDelegate {
    
    func didSelect(_ categoryData: CategoryEntity) {
        guard let vc = UIStoryboard.init(name: "Products", bundle: nil).instantiateViewController(withIdentifier: ProductViewController.name) as? ProductViewController else {
            return
        }
        vc.category = categoryData
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
