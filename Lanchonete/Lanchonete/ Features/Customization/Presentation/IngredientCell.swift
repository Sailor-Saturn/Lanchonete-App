//
//  IngredientCell.swift
//  Lanchonete
//
//  Created by vera.dias on 1/21/21.
//

import UIKit
public protocol IngredientCellDelegate: AnyObject {
    func ingredientCellDidDecreaseQuantity(for index: Int)
    func ingredientCellDidIncrementQuantity(for index: Int)
}

class IngredientCell: UITableViewCell, IngredientView {
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ingredientNameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    weak var delegate: IngredientCellDelegate?
    private var index: Int = 0
    
    func populate(ingredient: String, price: Double, quantity: Int, index: Int){
        ingredientNameLabel.text = ingredient
        
        priceLabel.text = "\(price) €"
        
        quantityLabel.text = "\(quantity)"
        
        self.index = index
    }
    
    @IBAction func decreaseQuantity(_ sender: UIButton) {
        delegate?.ingredientCellDidDecreaseQuantity(for: index)
    }
    
    @IBAction func incrementQuantity(_ sender: UIButton) {
        delegate?.ingredientCellDidIncrementQuantity(for: index)
    }
}
