//
//  ShoppingCartPresenter.swift
//  Lanchonete
//
//  Created by vera.dias on 2/10/21.
//

import Foundation

public protocol ShoppingCartView: class{
    func reloadData()
}
public class ShoppingCartPresenter {
    let shoppingCartManager: ShoppingCartManager
    
    public var view: ShoppingCartView?
    
    init(shoppingCartManager: ShoppingCartManager) {
        self.shoppingCartManager = shoppingCartManager
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func titleForSection() -> String {
        return "Shopping Invoice"
    }
    
    func numberOfRowsInSection() -> Int {
        
        return shoppingCartManager.sandwichSelection.count
    }
    
    //MARK: Cell Configuration
    func configureShoppingCartView(_ view: ShoppingCartCellView, forIndex index: Int){
        let sandwich:Item = self.shoppingCartManager.sandwichSelection[index]
        view.display(name: sandwich.sandwichType.name)
        view.display(price: String (sandwich.price))
        view.display(quantity: sandwich.quantity)
        
    }
    
    func getTotal() -> String {
        return String (shoppingCartManager.getFinalPrice()) + "€"
    }
}
