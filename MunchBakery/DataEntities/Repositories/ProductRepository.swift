//
//  ProductRepository.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 11/28/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

struct ProductRepository {
    
    func loadFromApi(_ category: CategoryEntity?, completion: @escaping ([ProductEntity], String?) -> Void) {
        guard
            let category = category else
        {
            completion([ProductEntity](), "Invalid category ID")
            return
        }
        let catID = category.categoryId
        let req = ProductsListRequest(String(catID))
        
        ApiManager.shared.sendRequest(req) { (result) in
            switch result {
            case .success(let data):
                do {
                    if let productsArray = data["responseData"] as? [AnyObject] {
                        let products = self.parseData(productData: productsArray, category)
                        completion(products, nil)
                        return
                    }
                    completion([ProductEntity](), "error loading products")
                } catch {
                    DispatchQueue.main.async {
                        completion([ProductEntity](), error.localizedDescription)
                    }
                }
            case .error(let error):
                completion([ProductEntity](), error)
                
            case .errorWithDictionary(let errorDictionary):
                print(errorDictionary)
                completion([ProductEntity](), "error")
            }
        }
    }
    
    func parseData(productData: [AnyObject], _ category: CategoryEntity) -> [ProductEntity] {
        var products = [ProductEntity]()
        
        ((try? RealmService.shared.realm?.safeWrite {
            for item in productData {
                let product = ProductEntity()
                product.id = item["Id"] as? Int ?? 0
                product.title = item["Name"] as? String ?? ""
                product.productDescription = item["Description"] as? String ?? ""
                
                if  let item = item as? [String: AnyObject],
                    let imagesData = item["lstPictures"] as? [AnyObject] {
                    for imageData in imagesData {
                        let image = ImageEntity()
                        image.displayOrder = imageData["DisplayOrder"] as? Int ?? 0
                        image.name = imageData["PictureName"] as? String ?? ""
                        image.alt = imageData["PictureAlt"] as? String ?? ""
                        image.title = imageData["PictureTitle"] as? String ?? ""
                        image.path = imageData["PicturePath"] as? String ?? ""
                        
                        product.images.append(image)
                    }
                }
                product.price = item["Price"]  as? Double ?? 0
//                product.category = category
                product.displayOrder = item["DisplayOrder"] as? Int ?? 0
                
                products.append(product)
            }}) as ()??)
        
        return products
    }
}
