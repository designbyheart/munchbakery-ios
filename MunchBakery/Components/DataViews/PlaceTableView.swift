//
//  PlaceTableView.swift
//  MunchBakery
//
//  Created by Luka's Macbook on 06.09.19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class PlaceTableView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private let placeCellHeight: CGFloat = 65
    private let cellSpacing: CGFloat = 10
    private var contentViewInitialized = false
    var placeItems = [PlaceEntity]() {
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
        Bundle.main.loadNibNamed(PlaceTableView.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.backgroundColor = .clear
        self.registerCell()
        contentViewInitialized = true
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: PlaceTableViewCell.name, bundle: nil), forCellReuseIdentifier: PlaceTableViewCell.name)
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource methods

extension PlaceTableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return placeItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let placeCell = tableView.dequeueReusableCell(withIdentifier: PlaceTableViewCell.name, for: indexPath) as? PlaceTableViewCell else {
                return UITableViewCell()
        }
        placeCell.contentView.backgroundColor = .clear
        placeCell.setupUI(row: indexPath.section)
        placeCell.updatePlace(placeItems[indexPath.section])
        return placeCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return placeCellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
}
