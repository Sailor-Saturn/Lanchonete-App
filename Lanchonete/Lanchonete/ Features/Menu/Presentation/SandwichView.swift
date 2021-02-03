//
//  SandwichView.swift
//  Lanchonete
//
//  Created by vera.dias on 1/20/21.
//

import Foundation

public protocol SandwichView: class {
    func display(sandwich: String)
    func display(price: String)
}
