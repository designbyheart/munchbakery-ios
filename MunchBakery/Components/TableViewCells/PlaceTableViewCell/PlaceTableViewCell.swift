//
//  PlaceTableViewCell.swift
//  MunchBakery
//
//  Created by Luka's Macbook on 06.09.19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var placeNameLbl: UILabel!
    @IBOutlet weak var workingHoursLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var distanceLbl: UILabel!
    @IBOutlet weak var closestLocationLbl: UILabel!
    
    // MARK: - Lifecycle methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.round(cornerRadius: 5)
    }
    
    func updatePlace(_ place: PlaceEntity) {
        self.placeNameLbl.text = place.name
        self.workingHoursLbl.text = place.workingHours
        self.phoneNumberLbl.text = place.phoneNumber
        self.distanceLbl.text = "\(place.distance) m"
    }
    
    func setupUI(row: Int) {
        self.contentView.backgroundColor = row == 0 ? .pink : .white
        self.placeNameLbl.textColor = row == 0 ? .white : .black
        self.workingHoursLbl.textColor = row == 0 ? .white : .black
        self.phoneNumberLbl.textColor = row == 0 ? .white : .black
        self.distanceLbl.textColor = row == 0 ? .white : .black
        self.closestLocationLbl.isHidden = row != 0
    }
    
}
