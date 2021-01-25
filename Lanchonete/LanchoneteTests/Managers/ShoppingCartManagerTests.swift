//
//  ShoppingCartManagerTests.swift
//  LanchoneteTests
//
//  Created by vera.dias on 1/22/21.
//

import XCTest
@testable import Lanchonete

class ShoppingCartManagerTests: XCTestCase {
    
    func test_GIVEN_an_empty_shopping_cart_WHEN_I_add_a_sandwich_THEN_the_total_should_be_the_price_of_the_added_sandwich() {
        let manager = ShoppingCartManager()
        //let sandwich = Sandwich(type: .xBacon)
        manager.addSandwich(type: .xBacon)
        XCTAssertEqual(manager.getFinalPrice(), 7.0)
    }
    
    func test_GIVEN_a_shopping_cart_containing_a_sandwich_WHEN_I_add_a_sandwich_THEN_the_total_should_be_the_price_of_the_sum_of_the_two_sandwiches(){
        let manager = ShoppingCartManager()
        
        manager.addSandwich(type: .xBacon)
        manager.addSandwich(type: .xBurguer)
        XCTAssertEqual(manager.getFinalPrice(), 11.5)
    }
    
    func test_GIVEN_a_shopping_cart_containing_two_sandwiches_WHEN_I_remove_a_sandwich_THEN_the_total_should_be_the_price_of_the_remaining_sandwich (){
        let manager = ShoppingCartManager()
    
        manager.addSandwich(type: .xBacon)
        manager.addSandwich(type: .xBurguer)
        
        manager.removeSandwich(type: .xBacon)
        
        XCTAssertEqual(manager.getFinalPrice(), 4.5)
    }
    
    func test_GIVEN_a_shopping_cart_containing_one_sandwich_WHEN_I_remove_a_sandwich_THEN_the_total_should_be_0(){
        let manager = ShoppingCartManager()
        
        manager.addSandwich(type: .xBacon)
        
        manager.removeSandwich(type: .xBacon)
        
        XCTAssertEqual(manager.getFinalPrice(), 0)
    }

}
