//
//  HomeViewController.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 8/25/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var onBoardingView: OnboardingView!
    @IBOutlet weak var productsCollectionView: ProductsCollectionView!
    @IBOutlet weak var amountPicker: AmountPicker!
    
    // MARK: - Properties
    var productDataItems = [ProductEntity]()
    var showPayement: PaymentDetails?
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productDataItems = [ProductEntity.initProduct(title: "Break cake", price: 6.0)]
        self.productsCollectionView.isHorizontal = true
        self.productsCollectionView.parentVC = self
        self.productsCollectionView.delegate = self
        
        let orderRepo = OrderRepository()
            orderRepo.updateOrderStatus()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.productDataItems = [
            ProductEntity.initProduct(title: "Break cake", price: 6.0),
            ProductEntity.initProduct(title: "Seasonal cake", price: 12.0),
            ProductEntity.initProduct(title: "Wedding cake", price: 6.0),
            ProductEntity.initProduct(title: "Break cake", price: 6.0),
            ProductEntity.initProduct(title: "Seasonal cake", price: 12.0),
            ProductEntity.initProduct(title: "Wedding cake", price: 6.0),
            ProductEntity.initProduct(title: "Break cake", price: 6.0),
            ProductEntity.initProduct(title: "Seasonal cake", price: 12.0),
            ProductEntity.initProduct(title: "Wedding cake", price: 6.0),
            ProductEntity.initProduct(title: "Break cake", price: 6.0),
            ProductEntity.initProduct(title: "Seasonal cake", price: 12.0),
            ProductEntity.initProduct(title: "Wedding cake", price: 6.0),
            
        ]
        self.productsCollectionView.isHorizontal = true
        self.productsCollectionView.productDataItems = self.productDataItems
        self.productsCollectionView.cellHeight = self.productsCollectionView.frame.size.height - 20
    }
    
    //    @IBAction func cartShow(_ sender: Any) {
    //        let vc = CartCheckoutViewController(nibName: CartCheckoutViewController.name, bundle: nil)
    //        navigationController?.pushViewController(vc, animated: true)
    //    }
    
}

extension HomeViewController: ProductsCollectionViewDelegate {
    
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
