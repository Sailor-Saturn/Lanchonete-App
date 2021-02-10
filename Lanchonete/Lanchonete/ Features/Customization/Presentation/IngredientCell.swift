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
    var ingredientQuantity: Int = 0
    
    func display(ingredient: String) {
        ingredientNameLabel.text = ingredient
    }
    
    func display(price: String) {
        priceLabel.text = price + "€"
    }
    
    func display(quantityValue: String) {
        quantity.text = quantityValue
        ingredientQuantity = Int (quantityValue) ?? 0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    @IBAction func decreaseQuantity(_ sender: UIButton) {
        if(ingredientQuantity != 0) {
            ingredientQuantity -= 1
        }
        display(quantityValue: String (ingredientQuantity))
    }
    
    
    @IBAction func incrementQuantity(_ sender: UIButton) {
        ingredientQuantity += 1
        display(quantityValue: String (ingredientQuantity))
    }
}
