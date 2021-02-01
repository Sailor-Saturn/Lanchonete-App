//
//  SandwichCell.swift
//  Lanchonete
//
//  Created by vera.dias on 1/20/21.
//

import UIKit

class SandwichCell: UITableViewCell, SandwichView {
    
    @IBOutlet weak var sandwichLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func display(sandwich: String) {
        sandwichLabel.text = sandwich
    }
    
    func display(price: String){
        priceLabel.text = price + "€"
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
