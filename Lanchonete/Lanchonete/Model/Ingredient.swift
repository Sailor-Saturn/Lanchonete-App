//
//  Ingredient.swift
//  Lanchonete
//
//  Created by vera.dias on 1/6/21.
//

import Foundation

public enum Ingredient: String, CaseIterable {
    case hamburguer = "Hamburguer"
    case egg = "Egg"
    case cheese = "Cheese"
    case bacon = "Bacon"
    
    var price: Double {
        switch self {
        case .hamburguer: return 3.0
        case .egg: return 2.0
        case .cheese: return 1.5
        case .bacon: return 2.5
        }
    }
}
