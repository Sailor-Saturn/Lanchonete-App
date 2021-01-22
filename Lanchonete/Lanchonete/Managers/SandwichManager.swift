//
//  SandwichManager.swift
//  Lanchonete
//
//  Created by vera.dias on 1/13/21.
//

import Foundation

public class SandwichManager {
    func getSandwichTypes () -> [SandwichType] {
        return SandwichType.allCases
    }
    
    func getSandwichName(type: SandwichType) -> String {
        return type.rawValue
    }
    
    func getSandwichPrice(type: SandwichType) -> Double {
        return Sandwich(type: type).price()
    }
    
    
}
