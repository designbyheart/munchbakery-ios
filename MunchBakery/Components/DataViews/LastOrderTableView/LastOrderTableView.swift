//
//  LastOrderTableView.swift
//  MunchBakery
//
//  Created by Kostic on 9/30/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class LastOrderTableView: UIView {

    // MARK: - Outlets

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private var contentViewInitialized = false
    var lastOrderUI: LastOrderUI?
    let orderStates = ["Your order is received.",
                       "Waiting branch confirmation",
                       "On the way",
                       "Delivered"]
    
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
        Bundle.main.loadNibNamed(LastOrderTableView.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.backgroundColor = .clear
        setupViews()
        registerCells()
        contentViewInitialized = true
    }
    
    // MARK: - Private methods

    private func registerCells() {
        tableView.register(UINib(nibName: LastOrderBasicTableViewCell.name, bundle: nil), forCellReuseIdentifier: LastOrderBasicTableViewCell.name)
        tableView.register(UINib(nibName: StartStateTableViewCell.name, bundle: nil), forCellReuseIdentifier: StartStateTableViewCell.name)
        tableView.register(UINib(nibName: MiddleStateTableViewCell.name, bundle: nil), forCellReuseIdentifier: MiddleStateTableViewCell.name)
        tableView.register(UINib(nibName: EndStateTableViewCell.name, bundle: nil), forCellReuseIdentifier: EndStateTableViewCell.name)
    }
    
}

// MARK: - UIStyling methods

extension LastOrderTableView: UIStyling {
    
    func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        self.lastOrderUI = LastOrderUI.init(self)
    }
    
    func setupConstraints() {
        
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate methods

extension LastOrderTableView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return orderStates.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        
        switch indexPath.section {
        case 0:
            cell = lastOrderUI?.lastOrderBasicCell(tableView, indexPath)
        default:
            switch indexPath.row {
            case 0:
                cell = lastOrderUI?.startStateCell(tableView, indexPath)
            case orderStates.count - 1:
                cell = lastOrderUI?.endStateCell(tableView, indexPath)
            default:
                cell = lastOrderUI?.middleStateCell(tableView, indexPath)
            }
        }
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view = LastOrderTableHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 218))
            return view
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 218
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1 {
            let view = LastOrderTableFooterView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 133))
            return view
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 {
            return 133
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
