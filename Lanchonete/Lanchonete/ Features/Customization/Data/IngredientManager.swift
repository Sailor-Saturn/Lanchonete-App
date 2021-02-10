//
//  IngredientInManager.swift
//  Lanchonete
//
//  Created by vera.dias on 1/13/21.
//

import Foundation

public class IngredientManager {
    var ingredients: [Ingredient]?
    
    init(with ingredients: [Ingredient]? = nil){
        guard let ingredientsFinal = ingredients else {
            return
        }
        self.ingredients = ingredientsFinal
        return
    }
    
    public func containsIngredient(ingredient: Ingredient) -> Bool {
        if let ingredientsFinal = self.ingredients {
            return ingredientsFinal.contains(ingredient)
        }
        return false
    }
}
