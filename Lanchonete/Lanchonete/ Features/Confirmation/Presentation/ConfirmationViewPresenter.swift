//
//  ConfirmationViewPresenter.swift
//  Lanchonete
//
//  Created by vera.dias on 1/29/21.
//

import Foundation
public protocol ConfirmationViewDelegate: AnyObject {
    func confirmationViewDidEnd(with sandwichCount: Int)
}

public class ConfirmationViewPresenter {
    let sandwichManager: SandwichManager
    let shoppingCartManager: ShoppingCartManager
    weak var view: ConfirmationViewController?
    weak var delegate: ConfirmationViewDelegate?
    
    var quantity: Int = 1
    
    func viewDidLoad() {
        view?.displaySandwich()
    }
    
    init(sandwichManager: SandwichManager, shoppingCartManager: ShoppingCartManager) {
        self.sandwichManager = sandwichManager
        self.shoppingCartManager = shoppingCartManager
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
    
    func getSandwichIngredients() -> [Ingredient] {
        return sandwichManager.getIngredients()
    }
    
    func addToShoppingCart() {
        let sandwich: SandwichType = sandwichManager.sandwichType!
        shoppingCartManager.addSandwichWithQuantity(sandwich: sandwich, quantity: quantity, price: sandwichManager.getPrice())
        delegate?.confirmationViewDidEnd(with: shoppingCartManager.getSnackCount())
    }
    
    func updateIngredientList(ingredients: [Ingredient]){
        sandwichManager.update(with: ingredients)
        view?.displaySandwich()
    }
}
