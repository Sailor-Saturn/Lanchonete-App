//
//  ConfirmationViewPresenter.swift
//  Lanchonete
//
//  Created by vera.dias on 1/29/21.
//

import Foundation

class ConfirmationViewPresenter {
    let sandwichManager: SandwichManager
    
    var quantity: Int = 1 
    
    init(sandwichManager: SandwichManager) {
        self.sandwichManager = sandwichManager
    }
    
    func getSandwichName() -> String {
        sandwichManager.getSandwichName()
    }
    
    func getIngredientList() -> String {
        sandwichManager.getSandwichIngredientListString()
    }
    
    func incrementQuantity() -> String {
        quantity += 1
        return String (quantity)
    }
    
    func decrementQuantity() -> String{
        if(quantity != 0){
            quantity -= 1
        }
        return String (quantity)
    }
    
    func getSandwichCode() -> String {
        return sandwichManager.getSandwichCode()
    }
}
