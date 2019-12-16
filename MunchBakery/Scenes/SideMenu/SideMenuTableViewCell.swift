//
//  SideMenuTableViewCell.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 8/30/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

    var title: String? {
        didSet {
            self.titleLbl.text = title
        }
    }
    @IBOutlet private weak var titleLbl: UILabel!
    
    // MARK: - Init methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.customize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customize()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customize()
    }
    
    // MARK: = Custom init
    
    func customize() {
        if self.titleLbl == nil {
            return
        }
        self.titleLbl.font = UIFont.museo(18)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.backgroundColor = .white
            self.backgroundColor = .white
            self.titleLbl.textColor = selected ? UIColor.pink : .black
        })
    }
    
}
