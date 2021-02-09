//
//  IngredientCell.swift
//  Lanchonete
//
//  Created by vera.dias on 1/21/21.
//

import UIKit

class IngredientCell: UITableViewCell, IngredientView {
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ingredientNameLabel: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    let quantityVal:Int = 0
    
    func display(ingredient: String) {
        ingredientNameLabel.text = ingredient
    }
    
    func display(price: String) {
        priceLabel.text = price + "€"
    }
    
    func display(quantityString: String) {
        //quantity.text = quantityString
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
