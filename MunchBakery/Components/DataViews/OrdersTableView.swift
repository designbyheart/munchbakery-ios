//
//  OrdersTableView.swift
//  MunchBakery
//
//  Created by Luka's Macbook on 24.09.19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

protocol OrdersTableViewDelegate: class {
    func didSelect(_ orderData: OrderEntity)
}

class OrdersTableView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var missingItemsLbl: UILabel!
    var showEmptyData = false {
        didSet {
//            self.missingItemsLbl.isHidden = !self.showEmptyData
        }
    }
    
    weak var delegate: OrdersTableViewDelegate?
    
    // MARK: - Properties
    
    private var contentViewInitialized = false
    var didSelectRow: ((Int) -> Void)?
    var orderDataItems = [OrderItemEntity]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    // MARK: - Customize init
    
    private func commonInit() {
        if contentViewInitialized {
            return
        }
        Bundle.main.loadNibNamed(OrdersTableView.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.backgroundColor = .clear
        registerCell()
        tableView.tableFooterView = UIView()
        contentViewInitialized = true
         
        self.missingItemsLbl.text = UserDefaults.lang() == "1" ? "There is no data to display." : "لا توجد بيانات لعرضها."
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: OrderTableViewCell.name, bundle: nil), forCellReuseIdentifier: OrderTableViewCell.name)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource methods

extension OrdersTableView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderDataItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let orderCell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.name, for: indexPath) as? OrderTableViewCell else {
            return UITableViewCell()
        }
        
        orderCell.updateOrderItem(orderDataItems[indexPath.row])
        return orderCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        didSelectRow?(indexPath.row)
    }
    
}
