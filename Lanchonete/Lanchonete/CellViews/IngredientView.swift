//
//  IngredientView.swift
//  Lanchonete
//
//  Created by vera.dias on 1/21/21.
//

import Foundation
public protocol IngredientView: class {
    
    func display(ingredient: String)
    func display(price: String)
    func display(quantity: String)
}
