//
//  SandwichManager.swift
//  Lanchonete
//
//  Created by vera.dias on 1/13/21.
//

import Foundation

public class SandwichManager {
    var sandwichType: SandwichType?
    var ingredients: [Ingredient] = []
    
    init(with sandwichType: SandwichType? = nil) {
        guard let sandwich = sandwichType else {
            return
        }
        self.sandwichType = sandwich
        self.ingredients = sandwich.ingredientsInSandwich
    }
    
    func getSandwichTypes () -> [SandwichType] {
        return SandwichType.allCases
    }
    
    func getSandwichName(type: SandwichType) -> String {
        return type.rawValue
    }
    
    func getSandwichPrice(type: SandwichType) -> Double {
        return Sandwich(type: type).price()
    }
    
    func addIngredient(_ ingredient: Ingredient){
        ingredients.append(ingredient)
    }
    
    func getPrice() -> Double{
        var price = 0.0
        
        for ingredient in ingredients {
            price += ingredient.price
        }
        
        return price
    }
    
    func getIngredients() -> [Ingredient]{
        return ingredients
    }
    
    func removeIngredient(_ ingredient: Ingredient){
        guard let index = ingredients.firstIndex(of: ingredient) else {
            return 
        }
        ingredients.remove(at: index)
    }
}
