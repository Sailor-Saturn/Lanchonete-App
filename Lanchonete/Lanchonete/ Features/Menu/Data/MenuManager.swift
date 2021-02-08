//
//  MenuManager.swift
//  Lanchonete
//
//  Created by vera.dias on 2/4/21.
//

import Foundation

public class MenuManager {
    func getSandwichTypes () -> [SandwichType] {
        return SandwichType.allCases
    }
    
    func getSandwichPrice(type: SandwichType) -> Double {
        return Sandwich(type: type).price()
    }
    
    func getSandwichName(type: SandwichType) -> String {
        return type.name
    }
}
