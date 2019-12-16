//
//  MiddleStateTableViewCell.swift
//  MunchBakery
//
//  Created by Kostic on 9/30/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class MiddleStateTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UIStackView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    
    // MARK: - Lifecycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    // MARK: - Public methods
    
    static func initCell(_ tableView: UITableView, _ indexPath: IndexPath) -> MiddleStateTableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MiddleStateTableViewCell.name, for: indexPath) as? MiddleStateTableViewCell {
            
            return cell
        }
        return UITableViewCell() as! MiddleStateTableViewCell
    }
    
    func updateUI(orderStatus: Int) {
        statusView.setBorder(with: orderStatus == 1 ? .black : .customLightGray, width: orderStatus == 1 ? 2 : 1)
        statusView.backgroundColor = orderStatus == 1 ? .pink : .white
        titleLabel.alpha = orderStatus == 1 ? 1.0 : 0.5
    }

}

// MARK: - UIStyling methods

extension MiddleStateTableViewCell: UIStyling {
    
    func setupConstraints() {
        
    }
    
    func setupViews() {
        statusView.layer.cornerRadius = statusView.frame.height / 2
    }
    
}
