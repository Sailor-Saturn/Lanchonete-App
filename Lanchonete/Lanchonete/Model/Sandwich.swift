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
    
    var ingredientsInSandwich: [Ingredient] {
        switch self {
        case .xBacon:
            return [.hamburguer,.cheese,.bacon]
        case .xBurguer:
            return [.hamburguer,.cheese]
        case .xEgg:
            return [.hamburguer,.cheese,.egg]
        case .xEggBacon:
            return [.hamburguer,.cheese,.egg,.bacon]
        }
    }
    
    var name: String {
        switch self {
        case .xBacon:
            return "X-Bacon"
        case .xBurguer:
            return "X-Burguer"
        case .xEgg:
            return "X-Egg"
        case .xEggBacon:
            return "X-EggBacon"
        }
    }
    
    var code: String {
        switch self {
        case .xBacon:
            return "X-Bacon"
        case .xEgg:
            return "X-Egg"
        case .xBurguer:
            return "X-Burguer"
        case .xEggBacon:
            return "X-EggBacon"
        }
    }
    
}

public struct Sandwich: Equatable {
    let type: SandwichType
    
    
    func price() -> Double {
        var total:Double = 0.0
        
        for ingredient in type.ingredientsInSandwich {
            total += ingredient.price
        }
        
        return total
    }
}
