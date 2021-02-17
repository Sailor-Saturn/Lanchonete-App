//
//  ShoppingCartView.swift
//  Lanchonete
//
//  Created by vera.dias on 2/11/21.
//

import Foundation

public protocol ShoppingCartCellView: class {
    func display(name: String)
    func display(price: String)
    func display(quantity: Int)
}
