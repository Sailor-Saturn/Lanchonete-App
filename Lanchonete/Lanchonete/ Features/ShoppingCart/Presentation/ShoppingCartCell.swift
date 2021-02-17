//
//  ShoppingCartCell.swift
//  Lanchonete
//
//  Created by vera.dias on 2/11/21.
//

import UIKit

class ShoppingCartCell: UITableViewCell, ShoppingCartCellView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    func display(name: String) {
        nameLabel.text = name
    }
    
    func display(price: String) {
        priceLabel.text = price
    }
    
    func display(quantity: Int) {
        quantityLabel.text = String (quantity)
    }
    

}
