//
//  ShoppingCart.swift
//  Lanchonete
//
//  Created by vera.dias on 1/6/21.
//

import Foundation

struct ShoppingCart {
    var partialOrders: [PartialOrder]
    
    func total () -> Double {
        var total : Double = 0.0
        for partial in partialOrders {
            total += partial.total()
        }
        return total
    }
//    var promotions: Array<Promotion> = Array()
//    let promotionsValue: Double?
//    let finalPriceValue: Double?
//    let priceWithoutPromotions: Double?
    
    
}
