//
//  ProductTableViewCell.swift
//  MoneyChallenge
//
//  Created by Juan López Bosch on 15/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    static let reuseId = "productCell"
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var planValueLabel: UILabel!
    @IBOutlet weak var moneyboxLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.roundCorners(radius: 16)
    }
    
    func configureCell(with product: Product?) {
        nameLabel.text = product?.name
        planValueLabel.text = "Plan Value: £\(product?.planValue ?? .zero)"
        moneyboxLabel.text = "Moneybox: £\(product?.moneybox ?? .zero)"
    }
}
