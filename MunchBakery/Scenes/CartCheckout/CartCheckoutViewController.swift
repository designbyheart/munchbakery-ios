//
//  CartCheckoutViewController.swift
//  MunchBakery
//
//  Created by Nikola Jovanovic Simunic on 9/22/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class CartCheckoutViewController: UIViewController, ChangePayementProtocol, SelectedButtonProtocol {
    func selectedButton(tag: Int) {
        selectedBtn = tag
        tableView.reloadData()
    }
    
    func changePayement() {
        print("change payemnent button tapped")
    }
    
    //    MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topView: TopViewCartCheckout!
    
    //    MARK: - Properties
    var popUp: PaymentDetails?
    var selectedBtn = 0
    var storeData = ["Store no1",
                     "Store no2",
                     "Store no3",
                     "Store no4",
                     "Store no5",
                     "Store no6",
                     "Store no7"
    ]
    var selectedIndex: Int? = nil
    
    //    MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        topView.delegate = self
        topView.selectedBtnDelegate = self
        registerCell()
    }
    
    //    MARK: - Custom Methods
    func registerCell() {
        tableView.register(UINib(nibName: CartCheckoutDeliveryTableViewCell.name, bundle: nil), forCellReuseIdentifier: CartCheckoutDeliveryTableViewCell.name)
        tableView.register(UINib(nibName: CartCheckoutStorePickupTableViewCell.name, bundle: nil), forCellReuseIdentifier: CartCheckoutStorePickupTableViewCell.name)
    }
    
}

//    MARK: - Table View Methods
extension CartCheckoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectedBtn {
        case 0:
            return 1
        case 1:
            return storeData.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch selectedBtn {
        case 0:
            return 220
        case 1:
            return 40
        default:
            return  50
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch selectedBtn {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CartCheckoutDeliveryTableViewCell.name, for: indexPath) as? CartCheckoutDeliveryTableViewCell else {
                return UITableViewCell()
            }
            tableView.allowsSelection = false
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CartCheckoutStorePickupTableViewCell.name, for: indexPath) as? CartCheckoutStorePickupTableViewCell else {
                return UITableViewCell()
            }
            
            cell.checked.isHidden = !(selectedIndex ?? -1 == indexPath.row)
            cell.nearestLabel.isHidden = !(selectedIndex ?? -1 == indexPath.row)
            
            tableView.allowsSelection = true
            
            cell.storeName.text = storeData[indexPath.row]
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            switch selectedBtn {
            case 0:
                return 0
            case 1:
                return 40
            default:
                return 0
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            switch selectedBtn {
            case 0:
                return nil
            case 1:
                let view = CartHeader(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
                return view
            default:
                return nil
            }
            
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let oldIndex = selectedIndex
        let cell = tableView.cellForRow(at: indexPath) as! CartCheckoutStorePickupTableViewCell
        selectedIndex = indexPath.row
        tableView.reloadRows(at: [IndexPath.init(row: oldIndex ?? -1, section: 0)], with: .automatic)
        
        switch selectedBtn {
        case 1:
            cell.checked.isHidden = !(selectedIndex ?? -1 == indexPath.row)
            cell.nearestLabel.isHidden = !(selectedIndex ?? -1 == indexPath.row)
        default:
            print("/")
        }
        selectedIndex = indexPath.row
    }
    
}


