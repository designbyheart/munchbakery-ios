//
//  CategoryRepository.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 9/11/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

struct CategoryRepository {
    
    func loadFromAPI(completion: @escaping ([CategoryEntity], String?) -> Void) {
        ApiManager.shared.sendRequest(CategoryListRequest()) { (result) in
            switch result {
            case .success(let data):
                let categories = self.populateData(data)
                completion(categories, nil)
            case .error(let error):
                completion([CategoryEntity](), error)
                
            case .errorWithDictionary(let errorDictionary):
                print(errorDictionary)
                completion([CategoryEntity](), "error")
            }
        }
    }
    
    func populateData(_ data: [String: AnyObject]) -> [CategoryEntity] {
        var categories = [CategoryEntity]()
        guard let dataList = data["responseData"] as? [AnyObject] else {
            return categories
        }
        for catData in dataList {
            try? RealmService.shared.realm?.safeWrite {
                let category = CategoryEntity()
                category.name = catData["CatName"] as? String ?? ""
                category.categoryDescription = catData["Description"] as? String ?? ""
                category.slug = catData["Slug"] as? String ?? ""
                if let picture = catData["picture"] as? [String: AnyObject] {
                    category.imagePath = picture["PicturePath"] as? String ?? ""
                }
                
                category.categoryId = catData["Id"] as? Int ?? 0
                category.displayOrder = catData["DisplayOrder"] as? Int ?? 0
                
                categories.append(category)
            }
        }
        return categories
    }
    
    func loadStored() -> [CategoryEntity] {
        let categories = RealmService.shared.load(CategoryEntity.self) as? [CategoryEntity] ?? []
        if categories.count > 0 {
            return categories
        }
        return [CategoryEntity]()
    }
    
}

