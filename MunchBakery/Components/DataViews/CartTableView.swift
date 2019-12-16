//
//  CartTableView.swift
//  MunchBakery
//
//  Created by Kostic on 10/9/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class CartTableView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    var items = [OrderItemEntity]() {
        didSet{
            self.tableView.reloadData()
            self.emptyLabel.isHighlighted = items.count > 0
        }
    }
    
    // MARK: - Properties
    
    private var contentViewInitialized = false
    
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
        Bundle.main.loadNibNamed(CartTableView.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        registerCell()
        contentViewInitialized = true
        self.tableView.contentInset =  UIEdgeInsets.init(top: 0, left: 0, bottom: 160, right: 0)
    }
    
    // MARK: - Private methods
    
    private func registerCell() {
        tableView.register(UINib(nibName: CartProductTableViewCell.name, bundle: nil), forCellReuseIdentifier: CartProductTableViewCell.name)
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate methods

extension CartTableView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartProductTableViewCell.name, for: indexPath) as? CartProductTableViewCell else {
            return UITableViewCell()
        }
        cell.updateProduct(self.items[indexPath.row])
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
