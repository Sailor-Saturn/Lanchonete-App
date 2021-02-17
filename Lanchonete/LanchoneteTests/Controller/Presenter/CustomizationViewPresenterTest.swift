//
//  CustomizationViewPresenter.swift
//  LanchoneteTests
//
//  Created by vera.dias on 2/17/21.
//

import XCTest

@testable import Lanchonete

class CustomizationViewPresenterTest: XCTestCase {
    func test_GIVEN_a_customized_sandwich_WHEN_I_see_the_list_of_ingredients_THEN_I_should_get_the_list(){
        let customizationViewPresenter = CustomizationViewPresenter(ingredientManager: IngredientManager(with: Ingredient.allCases), allIngredientManager: AllIngredientsManager())
        
        XCTAssertEqual(customizationViewPresenter.ingredients, [.hamburger,.egg,.cheese,.bacon])
    }
    
    func test_GIVEN_a_customized_sandwich_WHEN_I_go_to_customization_screen_THEN_I_should_see_the_title_Available_Ingredients() {
        let customizationViewPresenter = CustomizationViewPresenter(ingredientManager: IngredientManager(with: Ingredient.allCases), allIngredientManager: AllIngredientsManager())
        
        XCTAssertEqual(customizationViewPresenter.titleForSection(), "Available Ingredients")
    }
    
    func test_GIVEN_a_customized_sandwich_WHEN_I_want_to_see_the_the_number_of_sections_THEN_I_should_get_1() {
        let customizationViewPresenter = CustomizationViewPresenter(ingredientManager: IngredientManager(with: Ingredient.allCases), allIngredientManager: AllIngredientsManager())
        
        XCTAssertEqual(customizationViewPresenter.numberOfSections(), 1)
    }
    
    func test_GIVEN_a_customized_sandwich_WHEN_I_want_to_see_the_number_of_ingredients_THEN_I_should_get_4() {
        let customizationViewPresenter = CustomizationViewPresenter(ingredientManager: IngredientManager(with: Ingredient.allCases), allIngredientManager: AllIngredientsManager())
        
        XCTAssertEqual(customizationViewPresenter.numberOfRowsInSection(), 4)
    }
}

