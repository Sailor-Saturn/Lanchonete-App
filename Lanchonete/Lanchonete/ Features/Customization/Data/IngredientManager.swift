//
//  IngredientInManager.swift
//  Lanchonete
//
//  Created by vera.dias on 1/13/21.
//

import Foundation

public class IngredientManager {
    private var ingredients: [Ingredient] = []
    
    init(with ingredients: [Ingredient]? = nil){
        guard let ingredientsFinal = ingredients else {
            return
        }
        self.ingredients = ingredientsFinal
    }
    
    public func containsIngredient(ingredient: Ingredient) -> Bool {
        return ingredients.contains(ingredient)
    }
    
    public func getQuantity(for ingredient: Ingredient) -> Int {
        var quantity = 0
        
        for item in ingredients {
            if item == ingredient {
                quantity += 1
            }
        }
        
        return quantity
    }
    
    func addIngredient(_ ingredient: Ingredient){
        ingredients.append(ingredient)
    }
    
    func removeIngredient(_ ingredient: Ingredient) -> Bool{
        guard let index = ingredients.firstIndex(of: ingredient) else {
            return false
        }
        ingredients.remove(at: index)
        if ingredients.isEmpty {
            return false
        }
        return true
    }
    
    func getAllIngredients() -> [Ingredient]{
        return ingredients
    }
}
