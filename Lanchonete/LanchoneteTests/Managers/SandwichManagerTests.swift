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

        //When
        sandwichManager.addIngredient(.egg)

        let xBacon = SandwichType.xBacon
        var expectedResult = xBacon.ingredientsInSandwich
        expectedResult.append(.egg)

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

        let expectedResult = [Ingredient.hamburguer, .cheese]
        
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

        let expectedResult = [Ingredient.hamburguer, .cheese, .bacon]
        
        //Then
        XCTAssertEqual(sandwichManager.getIngredients(),expectedResult)
    }
    
    func test_GIVEN_a_customized_sandwich_WHEN_I_add_ingredient_THEN_the_price_is_updated(){
        //Given
        let sandwichManager = SandwichManager()
        
        //When
        sandwichManager.addIngredient(.egg)
        sandwichManager.addIngredient(.egg)
        sandwichManager.addIngredient(.cheese)
        
        //Then
        XCTAssertEqual(sandwichManager.getPrice(), 5.5)
    }
    
    func test_GIVEN_a_customized_sandwich_WHEN_I_add_duplicated_ingredients_and_remove_one_THEN_the_price_is_updated(){
        //Given
        let sandwichManager = SandwichManager()
        
        //When
        sandwichManager.addIngredient(.egg)
        sandwichManager.addIngredient(.egg)
        sandwichManager.addIngredient(.bacon)
        
        sandwichManager.removeIngredient(.egg)
        
        //Then
        XCTAssertEqual(sandwichManager.getPrice(), 4.5)
    }
    
    func test_GIVEN_a_customized_sandwich_WHEN_I_add_multiple_ingredients_and_remove_them_all_THEN_the_price_should_be_0(){
        //Given
        let sandwichManager = SandwichManager()
        
        //When
        sandwichManager.addIngredient(.egg)
        sandwichManager.addIngredient(.egg)
        sandwichManager.addIngredient(.bacon)
        sandwichManager.addIngredient(.bacon)
        
        sandwichManager.removeIngredient(.egg)
        sandwichManager.removeIngredient(.egg)
        sandwichManager.removeIngredient(.bacon)
        sandwichManager.removeIngredient(.bacon)
        //Then
        XCTAssertEqual(sandwichManager.getPrice(), 0.0)
    }
    
    func test_GIVEN_a_customized_sandwich_WHEN_I_add_multiple_ingredients_and_remove_them_all_THEN_the_ingredient_list_should_be_0(){
        //Given
        let sandwichManager = SandwichManager()
        
        //When
        sandwichManager.addIngredient(.egg)
        sandwichManager.addIngredient(.egg)
        sandwichManager.addIngredient(.bacon)
        sandwichManager.addIngredient(.bacon)
        
        sandwichManager.removeIngredient(.egg)
        sandwichManager.removeIngredient(.egg)
        sandwichManager.removeIngredient(.bacon)
        sandwichManager.removeIngredient(.bacon)
        
        //Then
        XCTAssertEqual(sandwichManager.getIngredients(), [])
    }
    
}
