//
//  AllIngridientsManagerTests.swift
//  LanchoneteTests
//
//  Created by vera.dias on 2/10/21.
//

import XCTest
@testable import Lanchonete

class AllIngredientsManagerTests: XCTestCase {
    func test_GIVEN_all_the_ingredients_available_WHEN_I_click_on_the_table_view_THEN_I_should_see_all_the_ingredients() {
        let allIngredientManager = AllIngredientsManager()
        
        XCTAssertEqual(allIngredientManager.getIngredientList(), [.hamburguer,.egg,.cheese,.bacon])
    }
    
    func test_GIVEN_a_list_of_ingredients_WHEN_I_see_the_bacon_ingredient_THEN_I_should_see_Bacon() {
        let allIngredientManager = AllIngredientsManager()
        
        XCTAssertEqual(allIngredientManager.getIngredientName(ingredient: .bacon),"Bacon")
    }
    
    func test_GIVEN_the_egg_ingredient_WHEN_I_search_for_the_price_ingredient_THEN_I_should_get_2_00 () {
        let allIngredientManager = AllIngredientsManager()
        
        XCTAssertEqual(allIngredientManager.getIngredientPrice(ingredient: .egg),"2.0")
    }
}
