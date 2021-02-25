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
    case xCustom = "X-Custom"
    
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
        case .xCustom:
            return []
        }
    }
    
    var name: String {
        return self.rawValue
    }
    
    var code: String {
        return self.rawValue
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
