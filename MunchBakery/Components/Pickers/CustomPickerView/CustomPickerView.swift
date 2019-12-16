//
//  CustomPickerView.swift
//  MunchBakery
//
//  Created by Luka's Macbook on 23.09.19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class CustomPickerView: UIView {

    // MARK: - Outlets
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var addToCartButtonOutlet: BorderButton!
    
    // MARK: - Properties
    
    let amountArray = Array(0...100)
    var selectedRow: Int?
    private var contentViewInitialized = false
    var popupDismissed: (() -> Void)?
    
    // MARK: - Lifecycle methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: - Customize init
    
    private func commonInit() {
        if contentViewInitialized {
            return
        }
        Bundle.main.loadNibNamed(CustomPickerView.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        pickerView.delegate = self
        pickerView.dataSource = self
        
        addToCartButtonOutlet.layer.cornerRadius = 10
        contentView.layer.cornerRadius = 25
        contentView.dropShadow(color: .black, opacity: 0.2, offSet: .zero, radius: 20, scale: false)
        contentViewInitialized = true
    }
    
    // MARK: - Actions
    
    @IBAction func addToCartButtonTapped(_ sender: UIButton) {
        self.removeFromSuperview()
        popupDismissed?()
    }
    
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource methods

extension CustomPickerView: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        pickerView.subviews.forEach({
            $0.isHidden = $0.frame.height < 1.0
        })
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return amountArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let customLabel = view as? UILabel ?? UILabel()
        customLabel.text = "\(amountArray[row])"
        customLabel.textAlignment = .center
        customLabel.font = UIFont.openSansBold(selectedRow == nil && row == 0 ? 30 : 26)
        customLabel.textColor = selectedRow == nil && row == 0 ? UIColor.pink : UIColor.black
        return customLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let customLabel = pickerView.view(forRow: row, forComponent: 0) as? UILabel ?? UILabel()
        customLabel.text = "\(amountArray[row])"
        customLabel.textAlignment = .center
        customLabel.font = UIFont.openSansBold(26)
        customLabel.textColor = UIColor.pink
        selectedRow = row
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
}
