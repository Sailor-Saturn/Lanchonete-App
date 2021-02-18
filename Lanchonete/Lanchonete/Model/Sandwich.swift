//
//  Sandwich.swift
//  Lanchonete
//
//  Created by vera.dias on 1/6/21.
//

import Foundation

public enum SandwichType:  String, CaseIterable, Equatable {
    
    case xBacon = "X-Bacon"
    case xEgg = "X-Egg"
    case xBurger = "X-Burger"
    case xEggBacon = "X-EggBacon"
    
    var ingredientsInSandwich: [Ingredient] {
        switch self {
        case .xBacon:
            return [.hamburger,.cheese,.bacon]
        case .xBurger:
            return [.hamburger,.cheese]
        case .xEgg:
            return [.hamburger,.cheese,.egg]
        case .xEggBacon:
            return [.hamburger,.cheese,.egg,.bacon]
        }
    }
    
    var name: String {
        switch self {
        case .xBacon:
            return "X-Bacon"
        case .xBurger:
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
        case .xBurger:
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
