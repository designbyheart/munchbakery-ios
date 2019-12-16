//
//  AmountPicker.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 11/30/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

protocol AmountPickerDelegate: class {
    func onAddToCart(_ amount: Int)
}

class AmountPicker: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var pickerContainer: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    weak var delegate: AmountPickerDelegate?
    
    let amountArray = Array(1...100)
    var selectedRow: Int = 1
    
    var addedToCart: (() -> Void)?
    
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
    
    static func initPicker(_ parentVC: UIViewController) {
        let amountPicker = AmountPicker.init(frame: parentVC.view.bounds)
        amountPicker.commonInit()
        amountPicker.backgroundColor = .red
        amountPicker.contentView.isHidden = true
        parentVC.view.addSubview(amountPicker.contentView)
        amountPicker.contentView.frame = parentVC.view.bounds
        UIView.animate(withDuration: 0.3, delay: 0, options: .transitionCrossDissolve, animations: {
            amountPicker.contentView.isHidden = false
        }, completion: nil)
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(AmountPicker.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    // MARK: - Actions
    
    @IBAction func dismissPicker(_ sender: Any) {
        self.isHidden = true
    }
    
    @IBAction func onAddToCart(_ sender: Any) {
        self.delegate?.onAddToCart(selectedRow)
    }
    
}

extension AmountPicker: UIPickerViewDataSource, UIPickerViewDelegate {
    
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
        customLabel.font = UIFont.openSansBold(selectedRow == 0 && row == 0 ? 30 : 26)
        customLabel.textColor = selectedRow == 0 && row == 0 ? UIColor.pink : UIColor.black
        return customLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let customLabel = pickerView.view(forRow: row, forComponent: 0) as? UILabel ?? UILabel()
        customLabel.text = "\(amountArray[row])"
        customLabel.textAlignment = .center
        customLabel.font = UIFont.openSansBold(26)
        customLabel.textColor = UIColor.pink
        selectedRow = row + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
}
