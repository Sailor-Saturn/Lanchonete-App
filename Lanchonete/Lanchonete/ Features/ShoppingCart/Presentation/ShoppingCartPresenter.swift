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
        return shoppingCartManager.getSandwichList().count
    }
    
    //MARK: Cell Configuration
    func configureShoppingCartView(_ view: ShoppingCartCellView, forIndex index: Int){
        let sandwich:Sandwich = self.shoppingCartManager.sandwichList[index]
        view.display(name: sandwich.type.name)
        view.display(price: String (sandwich.price()))
        view.display(quantity: shoppingCartManager.getSandwichCount(type: sandwich.type))
        
    }
    
    func getTotal() -> String {
        return String (shoppingCartManager.getFinalPrice()) + "€"
    }
}
