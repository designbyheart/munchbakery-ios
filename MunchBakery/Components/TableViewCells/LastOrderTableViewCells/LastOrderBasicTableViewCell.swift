//
//  LastOrderBasicTableViewCell.swift
//  MunchBakery
//
//  Created by Kostic on 9/30/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class LastOrderBasicTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var orderNumberLabel: UILabel!
    @IBOutlet weak var orderStatusButtonOutlet: OrderSwitchButton!
    @IBOutlet weak var orderSummaryButtonOutlet: OrderSwitchButton!
    @IBOutlet weak var buttonContainer: UIView!
    
    
    // MARK: - Lifecycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: - Actions

    @IBAction func orderButtonTapped(_ sender: UIButton) {
        orderStatusButtonOutlet.isActive = sender == orderStatusButtonOutlet
        orderSummaryButtonOutlet.isActive = sender == orderSummaryButtonOutlet
    }
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    
    static func initCell(_ tableView: UITableView, _ indexPath: IndexPath) -> LastOrderBasicTableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: LastOrderBasicTableViewCell.name, for: indexPath) as? LastOrderBasicTableViewCell {
            
            return cell
        }
        return UITableViewCell() as! LastOrderBasicTableViewCell
    }

}

// MARK: - UIStyling methods

extension LastOrderBasicTableViewCell: UIStyling {
    
    func setupViews() {
        
        DispatchQueue.main.async {
            self.buttonContainer.layer.cornerRadius = 10
            self.buttonContainer.setBorder(with: .black, width: 2)
//            self.orderStatusButtonOutlet.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10)
//            self.orderSummaryButtonOutlet.roundCorners(corners: [.topRight, .bottomRight], radius: 10)
//            self.orderSummaryButtonOutlet.setBorder(with: .black, width: 2)
//            self.orderStatusButtonOutlet.setBorder(with: .black, width: 2)
//            self.orderSummaryButtonOutlet.clipsToBounds = true
//            self.orderStatusButtonOutlet.layer.masksToBounds = true
//            self.orderStatusButtonOutlet.backgroundColor = .red
//            self.orderStatusButtonOutlet.layer.cornerRadius = 15
        }
        
    }
    
    func setupConstraints() {
        
    }
    
}
