//
//  LocationRepository.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 12/1/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

struct LocationRepository {
    
    func loadFromApi(completion: @escaping ([CityEntity], String?) -> Void) {
        let cityReq = CitiesRequest()
        
        ApiManager.shared.sendRequest(cityReq) { (result) in
            switch result {
            case .success(let data):
                print(data)
                if let cityArray = data["responseData"] as? [AnyObject] {
                    let cities = self.parseData(cityArray)
                    completion(cities, nil)
                    return
                }
                completion([CityEntity](), "error loading cities")
            case .error(let error):
                completion([CityEntity](), error)
                
            case .errorWithDictionary(let errorDictionary):
                print(errorDictionary)
                completion([CityEntity](), "error")
            }
        }
    }
    
    func parseData(_ locationData: [AnyObject]) -> [CityEntity] {
        var cities = [CityEntity]()
        do{
            try RealmService.shared.realm?.safeWrite {
                for item in locationData {
                    guard
                        let name = item["Name"] as? String,
                        let displayOrder = item["DisplayOrder"] as? Int,
                        let id = item["Id"] as? Int
                        else {
                            return
                    }
                    let city = CityEntity.initCity(name, id, displayOrder)
                    cities.append(city)
                }
            }
            
        } catch(let error) {
            print(error.localizedDescription)
        }
        
        return cities
    }
    
}
