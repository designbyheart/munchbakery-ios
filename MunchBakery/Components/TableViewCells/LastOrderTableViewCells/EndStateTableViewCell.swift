//
//  EndStateTableViewCell.swift
//  MunchBakery
//
//  Created by Kostic on 9/30/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class EndStateTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    
    // MARK: - Lifecycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: - Public methods
    
    static func initCell(_ tableView: UITableView, _ indexPath: IndexPath) -> EndStateTableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: EndStateTableViewCell.name, for: indexPath) as? EndStateTableViewCell {
            
            return cell
        }
        return UITableViewCell() as! EndStateTableViewCell
    }
    
    func updateUI(orderStatus: Int) {
        statusView.setBorder(with: orderStatus == 2 ? .black : .customLightGray, width: orderStatus == 2 ? 2 : 1)
        statusView.backgroundColor = orderStatus == 2 ? .pink : .white
        titleLabel.alpha = orderStatus == 2 ? 1.0 : 0.5
    }
    
}

// MARK: - UIStyling methods

extension EndStateTableViewCell: UIStyling {
    
    func setupConstraints() {
        
    }
    
    func setupViews() {
        statusView.layer.cornerRadius = statusView.frame.height / 2
    }
    
}
