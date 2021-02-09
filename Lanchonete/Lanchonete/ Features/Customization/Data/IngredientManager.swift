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
    
    public func getIngredientList() -> [Ingredient] {
        return Ingredient.allCases
    }
    
    public func getIngredientPrice(ingredient: Ingredient) -> String{
        return String (ingredient.price)
    }
    
    public func getIngredientName(ingredient: Ingredient)-> String{
        return ingredient.name
    }
}
