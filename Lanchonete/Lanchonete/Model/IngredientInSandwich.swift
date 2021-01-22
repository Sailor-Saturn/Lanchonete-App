//
//  IngredientInSandwich.swift
//  Lanchonete
//
//  Created by vera.dias on 1/6/21.
//

import Foundation

struct IngredientInSandwich {
    let ingredient: Ingredient
    
    let quantity: Int
    
    func total() -> Double {
        return ingredient.price * (Double) (quantity)
    }
}
