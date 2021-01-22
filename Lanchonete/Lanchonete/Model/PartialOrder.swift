//
//  PartialOrder.swift
//  Lanchonete
//
//  Created by vera.dias on 1/8/21.
//

import Foundation

struct PartialOrder {
    
    let sandwich: Sandwich
    let quantity: Int
    
    func total() -> Double {
        return sandwich.price() * (Double)(quantity)
    }
}
