//
//  LastOrderUI.swift
//  MunchBakery
//
//  Created by Kostic on 10/1/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

struct LastOrderUI {
    
    var orderState = 0
    weak var lastOrderTableView: LastOrderTableView?
    
    init(_ view: LastOrderTableView) {
        self.lastOrderTableView = view
    }
    
    func lastOrderBasicCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let lastOrderBasicCell = LastOrderBasicTableViewCell.initCell(tableView, indexPath)
        
        return lastOrderBasicCell
    }
    
    func startStateCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let startStateCell = StartStateTableViewCell.initCell(tableView, indexPath)
        startStateCell.updateUI(orderStatus: orderState)
        return startStateCell
    }
    
    func middleStateCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let middleStateCell = MiddleStateTableViewCell.initCell(tableView, indexPath)
        middleStateCell.updateUI(orderStatus: orderState)
        return middleStateCell
    }
    
    func endStateCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let endStateCell = EndStateTableViewCell.initCell(tableView, indexPath)
        endStateCell.updateUI(orderStatus: orderState)
        return endStateCell
    }
}
