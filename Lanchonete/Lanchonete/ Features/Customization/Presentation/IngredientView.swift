//
//  IngredientView.swift
//  Lanchonete
//
//  Created by vera.dias on 1/21/21.
//

import Foundation
public protocol IngredientView: class {
    
    func populate(ingredient: String, price: Double, quantity: Int, index: Int)
}
