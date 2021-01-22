//
//  Sandwich.swift
//  Lanchonete
//
//  Created by vera.dias on 1/6/21.
//

import Foundation
public enum SandwichType:  String, CaseIterable {
    case xBacon = "X-Bacon"
    case xEgg = "X-Egg"
    case xBurguer = "X-Burguer"
    case xEggBacon = "X-EggBacon"
    
    var ingredientsInSandwich: [IngredientInSandwich] {
        switch self {
        case .xBacon:
            return [IngredientInSandwich(ingredient: .hamburguer, quantity: 1),
                    IngredientInSandwich(ingredient: .cheese, quantity: 1),
                    IngredientInSandwich(ingredient: .bacon, quantity: 1)]
        case .xBurguer:
            return [IngredientInSandwich(ingredient: .hamburguer, quantity: 1), IngredientInSandwich(ingredient: .cheese, quantity: 1)]
        case .xEgg:
            return [IngredientInSandwich(ingredient: .hamburguer, quantity:1),IngredientInSandwich(ingredient: .cheese, quantity: 1),IngredientInSandwich(ingredient: .egg, quantity: 1)]
        case .xEggBacon:
            return [IngredientInSandwich(ingredient: .egg, quantity: 1),
                    IngredientInSandwich(ingredient: .bacon, quantity: 1),
                    IngredientInSandwich(ingredient: .hamburguer, quantity: 1),
                    IngredientInSandwich(ingredient:.cheese, quantity: 1)]
        }
    }
    
}

struct Sandwich: Equatable {
    let type: SandwichType
    
    func price() -> Double {
        var total:Double = 0.0
        
        for ingredient in type.ingredientsInSandwich {
            total += ingredient.total()
        }
        
        return total
    }
    
}
