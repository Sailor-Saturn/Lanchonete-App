//
//  ConfirmationViewPresenterTests.swift
//  LanchoneteTests
//
//  Created by vera.dias on 2/1/21.
//

import XCTest

@testable import Lanchonete

class ConfirmationViewPresenterTest: XCTestCase {
    func test_GIVEN_a_menu_sandwich_WHEN_I_click_on_the_sandwich_THEN_I_should_see_the_name_of_the_sandwich(){
        let sandwichManager = SandwichManager(with: .xBacon)
        
        let confirmationViewPresenter = ConfirmationViewPresenter(sandwichManager: sandwichManager, shoppingCartManager: ShoppingCartManager())
        
        XCTAssertEqual(confirmationViewPresenter.getSandwichName(), "X-Bacon")
    }
    
    func test_GIVEN_a_menu_sandwich_WHEN_I_click_on_the_sandwich_THEN_I_should_get_the_ingredient_list() {
        let sandwichManager = SandwichManager(with: .xBacon)
        
        let confirmationViewPresenter = ConfirmationViewPresenter(sandwichManager: sandwichManager, shoppingCartManager: ShoppingCartManager())
        
        XCTAssertEqual(confirmationViewPresenter.getIngredientListToString(), "Ingredients: 1x Hamburger, 1x Cheese, 1x Bacon.")
    }
    
    func test_GIVEN_a_customized_sandwich_WHEN_I_click_on_the_sandwich_THEN_I_should_see_the_name_X_Custom() {
        let sandwichManager = SandwichManager()
        
        let confirmationViewPresenter = ConfirmationViewPresenter(sandwichManager: sandwichManager, shoppingCartManager: ShoppingCartManager())
        
        XCTAssertEqual(confirmationViewPresenter.getSandwichName(), "X-Custom")
    }
    
    func test_GIVEN_a_customized_sandwich_WHEN_I_click_on_the_sandwich_THEN_I_should_see_no_ingredients_yet() {
        let sandwichManager = SandwichManager()
        
        let confirmationViewPresenter = ConfirmationViewPresenter(sandwichManager: sandwichManager, shoppingCartManager: ShoppingCartManager())
        
        XCTAssertEqual(confirmationViewPresenter.getIngredientListToString(), "No Ingredients yet! 😳")
    }
    
    func test_GIVEN_a_menu_sandwich_on_the_confirmation_screen_WHEN_I_click_on_the_increment_button_THEN_the_quantity_should_be_increased_by_one() {
        let sandwichManager = SandwichManager(with: .xBacon)
        
        let confirmationViewPresenter = ConfirmationViewPresenter(sandwichManager: sandwichManager, shoppingCartManager: ShoppingCartManager())
        
        
        XCTAssertEqual(confirmationViewPresenter.incrementQuantity(), "2")
    }
    
    func test_GIVEN_a_menu_sandwich_on_the_confirmation_screen_and_the_quantity_is_1_WHEN_I_click_on_the_decrement_button_THEN_the_quantity_should_be_decremented_by_one() {
        let sandwichManager = SandwichManager(with: .xBacon)
        
        let confirmationViewPresenter = ConfirmationViewPresenter(sandwichManager: sandwichManager, shoppingCartManager: ShoppingCartManager())
        
        XCTAssertEqual(confirmationViewPresenter.decrementQuantity(), "0")
    }
    
    func test_GIVEN_a_menu_sandwich_on_the_confirmation_screen_WHEN_the_quantity_is_0_and_the_I_decrement_the_quantity_THEN_the_quantity_should_be_0() {
        let sandwichManager = SandwichManager(with: .xBacon)
        
        let confirmationViewPresenter = ConfirmationViewPresenter(sandwichManager: sandwichManager, shoppingCartManager: ShoppingCartManager())
        
        confirmationViewPresenter.quantity = 0
        
        XCTAssertEqual(confirmationViewPresenter.decrementQuantity(), "0")
    }
    
    func test_GIVEN_a_menu_sandwich_WHEN_I_click_on_the_sandwich_THEN_I_should_see_the_specified_image() {
        let sandwichManager = SandwichManager(with: .xBacon)
        
        let confirmationViewPresenter = ConfirmationViewPresenter(sandwichManager: sandwichManager, shoppingCartManager: ShoppingCartManager())
        
        XCTAssertEqual(confirmationViewPresenter.getSandwichCode(), "X-Bacon")
    }
    
    func test_GIVEN_a_customized_sandwich_WHEN_I_click_on_the_sandwich_THEN_I_should_see_the_specified_image() {
        let sandwichManager = SandwichManager()
        
        let confirmationViewPresenter = ConfirmationViewPresenter(sandwichManager: sandwichManager, shoppingCartManager: ShoppingCartManager())
        
        XCTAssertEqual(confirmationViewPresenter.getSandwichCode(),"X-Custom")
    }
}
