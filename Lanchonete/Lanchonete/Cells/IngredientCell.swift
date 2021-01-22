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
    
    func display(ingredient: String) {
        ingredientNameLabel.text = ingredient
    }
    
    func display(price: String) {
        priceLabel.text = price + "€"
    }
    
    func display(quantity: String) {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
