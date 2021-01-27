//
//  Ingredient.swift
//  Lanchonete
//
//  Created by vera.dias on 1/6/21.
//

import Foundation

public enum Ingredient: CaseIterable {
    case hamburguer
    case egg
    case cheese
    case bacon
    
    var price: Double {
        switch self {
        case .hamburguer: return 3.0
        case .egg: return 2.0
        case .cheese: return 1.5
        case .bacon: return 2.5
        }
    }
    
    var name: String {
        switch self {
        case .hamburguer: return "Hamburguer"
        case .egg: return "Egg"
        case .cheese: return "Cheese"
        case .bacon: return "Bacon"
        }
    }
}

