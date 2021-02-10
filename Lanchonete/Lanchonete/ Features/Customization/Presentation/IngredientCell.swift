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
    
    let ingredientCellManager = IngredientCellManager()
    
    func display(ingredient: String) {
        ingredientNameLabel.text = ingredient
    }
    
    func display(price: String) {
        priceLabel.text = price + "€"
    }
    
    func display(quantityValue: String) {
        quantity.text = quantityValue
        ingredientCellManager.setQuantity(value: quantityValue)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    @IBAction func decreaseQuantity(_ sender: UIButton) {
        ingredientCellManager.decreaseQuantity()
        display(quantityValue: ingredientCellManager.getQuantity())
    }
    
    
    @IBAction func incrementQuantity(_ sender: UIButton) {
        ingredientCellManager.incrementQuantity()
        display(quantityValue: ingredientCellManager.getQuantity())
    }
}
