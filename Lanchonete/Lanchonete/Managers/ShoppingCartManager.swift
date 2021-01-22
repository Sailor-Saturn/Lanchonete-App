//
//  ShoppingCartManager.swift
//  Lanchonete
//
//  Created by vera.dias on 1/13/21.
//

import Foundation
public class ShoppingCartManager {
    var sandwichList: [Sandwich] = []
    
    public func getSnackCount() -> Int{
        return sandwichList.count
    }
    
    public func getSandwichCount(type: SandwichType) -> Int{
        return sandwichList.filter{ $0 == Sandwich(type: type)}.count
    }
    
    public func getFinalPrice() -> Double {
        var total = 0.0
        
        for sandwich in sandwichList {
            total += sandwich.price()
        }
        
        return total
    }
    
    func addSandwich(type: SandwichType) {
        sandwichList.append(Sandwich(type: type))
    }
    
    func removeSandwich(type: SandwichType){
        if let index = sandwichList.firstIndex(of: Sandwich(type: type)) {
            sandwichList.remove(at: index)
        }
    }
    
    
    
}
