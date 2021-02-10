//
//  IngredientCellManager.swift
//  Lanchonete
//
//  Created by vera.dias on 2/10/21.
//

import Foundation

public class IngredientCellManager {
    var ingredientQuantity: Int = 0
    
    init(with quantity: Int? = nil) {
        if let quantityFinal = quantity {
            self.ingredientQuantity = quantityFinal
        }
        self.ingredientQuantity = 0
    }
    
    func setQuantity(value: String) {
        ingredientQuantity = Int (value) ?? 0
    }
    
    func getQuantity() -> String {
        return String (ingredientQuantity)
    }
    
    func decreaseQuantity(){
        if(ingredientQuantity != 0) {
            ingredientQuantity -= 1
        }
    }
    
    func incrementQuantity() {
        ingredientQuantity += 1
    }
}
