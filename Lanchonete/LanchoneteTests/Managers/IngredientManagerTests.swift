//
//  IngredientManagerTests.swift
//  LanchoneteTests
//
//  Created by vera.dias on 2/10/21.
//

import XCTest
@testable import Lanchonete

class IngredientManagerTests: XCTestCase {
    func test_GIVEN_a_list_of_ingredients_that_do_not_contain_egg_WHEN_I_check_if_the_list_contains_egg_THEN_I_should_get_false(){
        
        let ingredientManager = IngredientManager(with:[.bacon,.hamburger])
        
        XCTAssertFalse(ingredientManager.containsIngredient(ingredient: .egg))
    }
    
    func test_GIVEN_a_list_of_ingredients_that_contains_bacon_WHEN_I_check_if_the_list_contains_bacon_THEN_I_should_get_true () {
        let ingredientManager = IngredientManager(with:[.bacon,.hamburger])
        
        XCTAssertTrue(ingredientManager.containsIngredient(ingredient: .bacon))
    }
    
    func test_GIVEN_a_list_with_6_bacons_WHEN_I_want_to_get_the_quantity_THEN_I_should_get_6 (){
        let ingredientManager = IngredientManager(with:[.bacon,.bacon])
        
        XCTAssertEqual(ingredientManager.getQuantity(for: .bacon), 2)
    }
    
    func test_GIVEN_a_list_with_a_bacon_and_a_egg_WHEN_I_want_to_get_the_quantity_for_the_egg_THEN_I_should_get_1 (){
        let ingredientManager = IngredientManager(with:[.bacon,.egg])
        
        XCTAssertEqual(ingredientManager.getQuantity(for: .egg), 1)
    }
    
    func test_GIVEN_an_empty_list_WHEN_I_want_to_get_the_quantity_for_bacon_THEN_I_should_get_0() {
        let ingredientManager = IngredientManager(with:[])
        
        XCTAssertEqual(ingredientManager.getQuantity(for: .bacon), 0)
    }
    
    func test_GIVEN_a_list_that_has_bacon_bacon_egg_WHEN_I_add_another_egg_THEN_the_list_should_be_bacon_bacon_egg_egg(){
        let ingredientManager = IngredientManager(with:[.bacon,.bacon,.egg])
        ingredientManager.addIngredient(.egg)
        XCTAssertEqual(ingredientManager.getAllIngredients(), [.bacon,.bacon,.egg,.egg])
    }
    
    func test_GIVEN_a_list_that_has_bacon_bacon_egg_WHEN_I_add_a_hamburger_THEN_the_list_should_be_bacon_bacon_egg_hamburger(){
        let ingredientManager = IngredientManager(with:[.bacon,.bacon,.egg])
        ingredientManager.addIngredient(.hamburger)
        XCTAssertEqual(ingredientManager.getAllIngredients(), [.bacon,.bacon,.egg,.hamburger])
    }
    
    func test_GIVEN_an_empty_list_WHEN_I_add_hamburger_THEN_the_list_should_be_hamburger() {
        let ingredientManager = IngredientManager(with:[])
        ingredientManager.addIngredient(.hamburger)
        XCTAssertEqual(ingredientManager.getAllIngredients(), [.hamburger])
    }
    
    func test_GIVEN_a_sandwich_WHEN_I_remove_all_of_the_ingredients_THEN_I_should_return_false() {
        let ingredientManager = IngredientManager(with:[.bacon])
        
        XCTAssertFalse(ingredientManager.removeIngredient(.bacon))
    }
    
    func test_GIVEN_a_sandwich_WHEN_I_remove_one_of_the_ingredients_THEN_I_should_return_true() {
        let ingredientManager = IngredientManager(with:[.bacon,.hamburger,.cheese])
        
        XCTAssertTrue(ingredientManager.removeIngredient(.bacon))
    }
    
    func test_GIVEN_a_sandwich_WHEN_I_remove_one_of_the_ingredients_that_does_not_exist_THEN_I_should_return_false() {
        let ingredientManager = IngredientManager(with:[.bacon,.hamburger,.cheese])
        
        XCTAssertFalse(ingredientManager.removeIngredient(.egg))
    }

}

