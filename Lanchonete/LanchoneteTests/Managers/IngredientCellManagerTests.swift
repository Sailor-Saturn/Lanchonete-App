//
//  IngredientCellTests.swift
//  LanchoneteTests
//
//  Created by vera.dias on 2/10/21.
//

import XCTest
@testable import Lanchonete

class IngredientCellTests: XCTestCase {
    
    func test_GIVEN_the_ingredient_WHEN_I_click_on_the_plus_button_and_the_quantity_is_0_THEN_the_quantity_should_be_updated_to_1 () {
        let ingredientCellManager = IngredientCellManager()
        
        ingredientCellManager.incrementQuantity()
        
        XCTAssertEqual(ingredientCellManager.getQuantity(), 1)
    }
    
    func test_GIVEN_the_ingredient_WHEN_I_click_on_the_minus_button_and_the_quantity_is_0_THEN_the_quantity_should_not_be_updated (){
        let ingredientCellManager = IngredientCellManager()
        
        ingredientCellManager.decreaseQuantity()
        
        XCTAssertEqual(ingredientCellManager.getQuantity(), 0)
    }
    
    func test_GIVEN_the_ingredient_WHEN_I_click_on_the_minus_button_and_the_quantity_is_1_THEN_the_quantity_should_be_0() {
        let ingredientCellManager = IngredientCellManager(with: 1)
        
        ingredientCellManager.decreaseQuantity()
        
        XCTAssertEqual(ingredientCellManager.getQuantity(), 0)
    }
    
    func test_GIVEN_the_ingredient_with_quantity_1_WHEN_I_set_quantity_to_2_then_the_value_should_be_updated() {
        let ingredientCellManager = IngredientCellManager(with: 1)
        
        ingredientCellManager.setQuantity(value: 2)
        
        XCTAssertEqual(ingredientCellManager.getQuantity(), 2)
    }

}

