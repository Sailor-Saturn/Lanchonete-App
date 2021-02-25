//
//  SandwichManagerTests.swift
//  LanchoneteTests
//
//  Created by vera.dias on 1/26/21.
//

import XCTest
@testable import Lanchonete

class SandwichManagerTests: XCTestCase {
    func test_GIVEN_a_menu_sandwich_WHEN_I_add_ingredient_THEN_the_price_is_updated(){
        //Given
        let sandwichManager = SandwichManager(with: .xBacon)
        
        //When
        sandwichManager.addIngredient(.egg)
        
        //Then
        XCTAssertEqual(sandwichManager.getPrice(), 9.0)
    }
    
    func test_GIVEN_a_menu_sandwich_WHEN_I_add_ingredient_THEN_the_ingredient_list_is_updated(){
        //Given
        let sandwichManager = SandwichManager(with: .xBacon)
        
        let xBacon = SandwichType.xBacon
        var expectedResult = xBacon.ingredientsInSandwich
        expectedResult.append(.egg)

        //When
        sandwichManager.addIngredient(.egg)

        //Then
        XCTAssertEqual(sandwichManager.getIngredients(),expectedResult)
    }
    
    func test_GIVEN_a_menu_sandwich_WHEN_I_remove_an_ingredient_THEN_the_price_is_updated(){
        //Given
        let sandwichManager = SandwichManager(with: .xBacon)
        
        //When
        sandwichManager.removeIngredient(.bacon)
        
        //Then
        XCTAssertEqual(sandwichManager.getPrice(), 4.5)
    }
    
    func test_GIVEN_a_menu_sandwich_WHEN_I_remove_an_ingredient_THEN_the_ingredient_list_is_updated(){
        //Given
        let sandwichManager = SandwichManager(with: .xBacon)

        //When
        sandwichManager.removeIngredient(.bacon)

        let expectedResult = [Ingredient.hamburger, .cheese]
        
        //Then
        XCTAssertEqual(sandwichManager.getIngredients(),expectedResult)
    }
    
    func test_GIVEN_a_menu_sandwich_WHEN_I_remove_an_ingredient_that_does_not_exist_THEN_the_price_should_be_the_same(){
        //Given
        let sandwichManager = SandwichManager(with: .xBacon)
        
        //When
        sandwichManager.removeIngredient(.egg)
        
        //Then
        XCTAssertEqual(sandwichManager.getPrice(), 7.0)
    }
    
    func test_GIVEN_a_menu_sandwich_WHEN_I_remove_an_ingredient_that_does_not_exist_THEN_the_ingredient_list_should_be_the_same(){
        //Given
        let sandwichManager = SandwichManager(with: .xBacon)

        //When
        sandwichManager.removeIngredient(.egg)

        let expectedResult = [Ingredient.hamburger, .cheese, .bacon]
        
        //Then
        XCTAssertEqual(sandwichManager.getIngredients(),expectedResult)
    }
    
    func test_GIVEN_a_customized_sandwich_WHEN_I_add_ingredient_THEN_the_price_is_updated(){
        //Given
        let expectedIngredients: [Ingredient] = [.egg,.egg]
        let sandwichManager = SandwichManager(ingredients: expectedIngredients)
        
        //When
        sandwichManager.addIngredient(.cheese)
        
        //Then
        XCTAssertEqual(sandwichManager.getPrice(), 5.5)
    }
    
    func test_GIVEN_a_customized_sandwich_WHEN_I_add_duplicated_ingredients_and_remove_one_THEN_the_price_is_updated(){
        //Given
        let expectedIngredients: [Ingredient] = [.egg,.egg,.bacon]
        let sandwichManager = SandwichManager(ingredients: expectedIngredients)
        
        //When
        sandwichManager.removeIngredient(.egg)
        
        //Then
        XCTAssertEqual(sandwichManager.getPrice(), 4.5)
    }
    
    func test_GIVEN_a_customized_sandwich_WHEN_I_add_multiple_ingredients_and_remove_them_all_THEN_the_price_should_be_0(){
        //Given
        let expectedIngredients: [Ingredient] = [.egg,.egg,.bacon,.bacon]
        let sandwichManager = SandwichManager(ingredients: expectedIngredients)
        
        //When
        sandwichManager.removeAll()
        
        //Then
        XCTAssertEqual(sandwichManager.getPrice(), 0.0)
    }
    
    func test_GIVEN_a_customized_sandwich_WHEN_I_add_multiple_ingredients_and_remove_them_all_THEN_the_ingredient_list_should_be_0(){
        //Given
        let expectedIngredients: [Ingredient] = [.egg,.egg,.bacon,.bacon]
        let sandwichManager = SandwichManager(ingredients: expectedIngredients)
        
        //When
        sandwichManager.removeAll()
        
        //Then
        XCTAssertEqual(sandwichManager.getIngredients(), [])
    }
    
    func test_GIVEN_a_bacon_sandwich_WHEN_I_want_to_see_the_description_THEN_I_should_get_the_ingredient_list() {
        let sandwichManager = SandwichManager(with: .xBacon)
        
        XCTAssertEqual(sandwichManager.getSandwichIngredientListString(), "Ingredients: 1x Hamburger, 1x Cheese, 1x Bacon.")
    }
    
    func test_GIVEN_a_bacon_sandwich_WHEN_I_remove_the_hamburger_ingredient_THEN_I_should_get_the_updated_ingredient_list() {
        let sandwichManager = SandwichManager(with: .xBacon)
        
        sandwichManager.removeIngredient(.hamburger)
        
        XCTAssertEqual(sandwichManager.getSandwichIngredientListString(), "Ingredients: 1x Cheese, 1x Bacon.")
    }
}
