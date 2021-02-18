//
//  ShoppingCartManager.swift
//  Lanchonete
//
//  Created by vera.dias on 1/13/21.
//

import Foundation
public struct Item: Equatable {
    let quantity: Int
    let price: Double
    let sandwichType: SandwichType
}

public class ShoppingCartManager {
    var sandwichSelection: [Item] = []
    
    public func getSnackCount() -> Int{
        return sandwichSelection.reduce(0) { (result, item) -> Int in
            return result + item.quantity
        }
    }
    
    init(items: [Item]? = nil) {
        guard let itemsFinal = items else {
            return
        }
        self.sandwichSelection = itemsFinal
    }

    public func getFinalPrice() -> Double {
        return sandwichSelection.reduce(0) { (total, item) -> Double in
            return total + (Double(item.quantity) * item.price)
        }
    }
    
    func removeSandwich(type: SandwichType){
        if let item = sandwichSelection.filter({ $0.sandwichType == type }).first {
            removeItemAtIndex(item: item)
            
            if item.quantity > 1 {
                let newQuantity = item.quantity - 1
                
                addItemInSelection(quantity: newQuantity, price: item.price, sandwichType: item.sandwichType)
            }
        }
    }
    
    func addSandwichWithQuantity(sandwich: SandwichType, quantity: Int, price: Double){
        if let item = sandwichSelection.filter({ $0.sandwichType == sandwich }).first {
            removeItemAtIndex(item: item)
            let newQuantity = item.quantity + quantity
            
            addItemInSelection(quantity: newQuantity, price: item.price, sandwichType: item.sandwichType)
        }else {
            addItemInSelection(quantity: quantity, price: price, sandwichType: sandwich)
        }
    }
    
    func removeItemAtIndex(item: Item){
        if let index = sandwichSelection.firstIndex(of: item) {
            sandwichSelection.remove(at: index)
        }
    }
    
    func addItemInSelection(quantity: Int, price: Double, sandwichType: SandwichType) {
        sandwichSelection.append(Item(quantity: quantity, price: price, sandwichType: sandwichType))
    }
}
