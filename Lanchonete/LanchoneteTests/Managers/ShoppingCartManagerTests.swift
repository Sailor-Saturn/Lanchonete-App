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
        
        manager.addSandwichWithQuantity(sandwich: .xBacon, quantity: 1, price: 7.0)
        XCTAssertEqual(manager.getFinalPrice(), 7.0)
    }
    
    func test_GIVEN_a_shopping_cart_containing_a_sandwich_WHEN_I_add_a_sandwich_THEN_the_total_should_be_the_price_of_the_sum_of_the_two_sandwiches(){
        let manager = ShoppingCartManager(items: [Item(quantity: 1, price: 7.0, sandwichType: .xBacon), Item(quantity: 1, price: 4.5, sandwichType: .xBurger)])
        
        XCTAssertEqual(manager.getFinalPrice(), 11.5)
    }
    
    func test_GIVEN_a_shopping_cart_containing_two_sandwiches_WHEN_I_remove_a_sandwich_THEN_the_total_should_be_the_price_of_the_remaining_sandwich (){
        let manager = ShoppingCartManager(items: [Item(quantity: 1, price: 7.0, sandwichType: .xBacon), Item(quantity: 1, price: 4.5, sandwichType: .xBurger)])
        
        manager.removeSandwich(type: .xBacon)
        
        XCTAssertEqual(manager.getFinalPrice(), 4.5)
    }
    
    func test_GIVEN_a_shopping_cart_containing_one_sandwich_WHEN_I_remove_a_sandwich_THEN_the_total_should_be_0(){
        let manager = ShoppingCartManager(items: [Item(quantity: 1, price: 7.0, sandwichType: .xBacon)])
        
        manager.removeSandwich(type: .xBacon)
        
        XCTAssertEqual(manager.getFinalPrice(), 0)
    }
    
    func test_GIVEN_a_shopping_cart_containing_two_equal_sandwiches_WHEN_I_remove_a_sandwich_THEN_the_total_should_be_the_price_of_the_remaining_sandwich() {
    
        let manager = ShoppingCartManager(items: [Item(quantity: 2, price: 7.0, sandwichType: .xBacon)])
        
        manager.removeSandwich(type: .xBacon)
        
        XCTAssertEqual(manager.getFinalPrice(), 7.0)
    }
    
    func test_GIVEN_a_shopping_cart_containing_one_sandwich_WHEN_I_remove_a_sandwich_that_is_not_in_the_shopping_cart_THEN_the_total_should_be_the_price_of_the_remaining_sandwich() {
        
        let manager = ShoppingCartManager(items: [Item(quantity: 1, price: 7.0, sandwichType: .xBacon)])
        
        manager.removeSandwich(type: .xBurger)
        
        XCTAssertEqual(manager.getFinalPrice(), 7.0)
    }
    
    func test_GIVEN_an_empty_shopping_cart_WHEN_nothing_is_done_THEN_the_final_price_should_be_0(){
        let manager = ShoppingCartManager()
        
        XCTAssertEqual(manager.getFinalPrice(), 0)
    }

    func test_GIVEN_I_Have_1_XBacon_in_Shopping_Cart_WHEN_I_add_another_XBacon_with_customized_ingredients_THEN_I_should_see_2_XBacons_with_different_prices() {
        let manager = ShoppingCartManager(items: [Item(quantity: 1, price: 7.0, sandwichType: .xBacon)])

        manager.addSandwichWithQuantity(sandwich: .xBacon, quantity: 1, price: 10.0)
        
        XCTAssertEqual(manager.getFinalPrice(), 17.0)
    }
    
    func test_GIVEN_a_shopping_cart_with_xbacon_WHEN_I_add_another_xbacon_THEN_the_list_should_be_updated() {
        let manager = ShoppingCartManager(items: [Item(quantity: 1, price: 7.0, sandwichType: .xBacon)])
        
        manager.addSandwichWithQuantity(sandwich: .xBacon, quantity: 1, price: 7.0)
        XCTAssertEqual(manager.getFinalPrice(), 14.0)
    }

}
