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
        
        let ingredientManager = IngredientManager(with:[.bacon,.hamburguer])
        
        XCTAssertFalse(ingredientManager.containsIngredient(ingredient: .egg))
    }
    
    func test_GIVEN_a_list_of_ingredients_that_contains_bacon_WHEN_I_check_if_the_list_contains_bacon_THEN_I_should_get_true () {
        let ingredientManager = IngredientManager(with:[.bacon,.hamburguer])
        
        XCTAssertTrue(ingredientManager.containsIngredient(ingredient: .bacon))
    }
}

