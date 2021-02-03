//
//  SandwichManager.swift
//  Lanchonete
//
//  Created by vera.dias on 1/13/21.
//

import UIKit

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
    
    func getSandwichName() -> String {
        if let sandwichName = sandwichType?.name {
            return sandwichName
        }else {
            return "X-Custom"
        }
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
    
    func getSandwichIngredientListString() -> String{
        let joinedIngredients = ingredients.map{$0.name}.joined(separator: ", ")
        
        if(joinedIngredients.isEmpty){
            return "No Ingredients yet! 😳"
        }
        
        return "Ingredients: " + joinedIngredients + "."
    }
    
    func getSandwichCode() -> String {
        if let sandwichImage = sandwichType?.code {
            return sandwichImage
        }else {
            return "X-Custom"
        }
    }
    
    func removeAll(){
        ingredients.removeAll()
    }
}
