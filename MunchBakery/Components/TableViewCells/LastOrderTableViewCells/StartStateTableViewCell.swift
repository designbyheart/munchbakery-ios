//
//  StartStateTableViewCell.swift
//  MunchBakery
//
//  Created by Kostic on 9/28/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class StartStateTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    
    // MARK: - Lifecycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: - Public methods

    static func initCell(_ tableView: UITableView, _ indexPath: IndexPath) -> StartStateTableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: StartStateTableViewCell.name, for: indexPath) as? StartStateTableViewCell {
            
            return cell
        }
        return UITableViewCell() as! StartStateTableViewCell
    }
    
    func updateUI(orderStatus: Int) {
        statusView.setBorder(with: orderStatus == 0 ? .black : .customLightGray, width: orderStatus == 0 ? 2 : 1)
        statusView.backgroundColor = orderStatus == 0 ? .pink : .white
        titleLabel.alpha = orderStatus == 0 ? 1.0 : 0.5
    }
    
}

// MARK: - UIStyling methods

extension StartStateTableViewCell: UIStyling {
    
    func setupConstraints() {
        
    }
    
    func setupViews() {
        statusView.layer.cornerRadius = statusView.frame.height / 2
    }
    
}

