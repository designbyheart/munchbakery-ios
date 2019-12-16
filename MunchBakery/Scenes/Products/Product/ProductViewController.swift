//
//  ProductViewController.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 8/25/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var productCollectionView: ProductsCollectionView!
    @IBOutlet weak var headerView: UIView!
    
    var category: CategoryEntity?
    var productRepo: ProductRepository?
    
    // MARK: - Properties
    
    var productDataItems = [ProductEntity]()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productCollectionView.title = ""
        self.productRepo = ProductRepository()
        self.productCollectionView.parentVC = self
        self.productCollectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.productCollectionView.productDataItems = self.productDataItems
        self.productRepo?.loadFromApi(category, completion: { (products, error) in
            self.productCollectionView.productDataItems = products
            self.productDataItems = products
        })
        NotificationCenter.default.addObserver(self, selector: #selector(self.goBack), name: Notification.Name.openCategories, object: nil)
        self.productCollectionView.cellHeight = 200
    }    
    
}

extension ProductViewController: ProductsCollectionViewDelegate {
    
    func productSelected(_ product: ProductEntity) {
        self.performSegue(withIdentifier: ProductDetailsViewController.name, sender: product)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            segue.identifier == ProductDetailsViewController.name,
            let product = sender as? ProductEntity,
            let vc = segue.destination as? ProductDetailsViewController {
            vc.product = product
        }
    }
    
}
