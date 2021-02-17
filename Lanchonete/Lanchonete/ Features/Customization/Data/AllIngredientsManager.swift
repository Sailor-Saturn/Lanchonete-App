//
//  AllIngredientsManager.swift
//  Lanchonete
//
//  Created by vera.dias on 2/10/21.
//

import Foundation

public class AllIngredientsManager {
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
