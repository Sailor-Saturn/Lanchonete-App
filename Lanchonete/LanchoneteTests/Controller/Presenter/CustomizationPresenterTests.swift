//
//  CustomizationPresenterTests.swift
//  LanchoneteTests
//
//  Created by vera.dias on 2/23/21.
//
import XCTest
@testable import Lanchonete

class CustomizationPresenterTests: XCTestCase {
    func test_GIVEN_an_XBacon_sandwich_WHEN_I_remove_all_of_the_ingredients_THEN_I_should_not_be_able_to_press_the_customize_button(){
        let customizationPresenter = CustomizationViewPresenter(ingredientManager: IngredientManager(with: [.bacon]))
        XCTAssertFalse(customizationPresenter.removeIngredient(from: 3))
    }
    
    func test_GIVEN_an_XBacon_sandwich_WHEN_I_remove_one_of_the_ingredients_THEN_I_should_be_able_to_press_the_customize_button(){
        let customizationPresenter = CustomizationViewPresenter(ingredientManager: IngredientManager(with: [.bacon,.egg]))
        XCTAssertTrue(customizationPresenter.removeIngredient(from: 3))
    }
    
    func test_GIVEN_an_XBacon_sandwich_WHEN_I_add_one_of_the_ingredients_THEN_I_should_be_able_to_press_the_customize_button(){
        let customizationPresenter = CustomizationViewPresenter(ingredientManager: IngredientManager(with: [.bacon,.egg]))
        XCTAssertTrue(customizationPresenter.addIngredient(from: 3))
    }
    
    func test_GIVEN_an_XBacon_sandwich_WHEN_I_remove_all_of_the_ingredients_THEN_I_should_see_that_the_list_is_empty(){
        let fakeCustomizationController = FakeCustomizationViewController()
        let customizationPresenter = CustomizationViewPresenter(ingredientManager: IngredientManager(with: [.bacon]))
        
        customizationPresenter.view = fakeCustomizationController
        customizationPresenter.viewDidLoad()
        customizationPresenter.removeIngredient(from: 3)
        
        XCTAssertFalse(fakeCustomizationController.spy_didCallDisplayButton)
    }
    
    func test_GIVEN_an_XBacon_sandwich_WHEN_I_have_one_ingredient_THEN_I_should_be_able_to_click_on_the_confirm_button(){
        let fakeCustomizationController = FakeCustomizationViewController()
        
        let customizationPresenter = CustomizationViewPresenter(ingredientManager: IngredientManager(with: [.bacon]))
        
        customizationPresenter.view = fakeCustomizationController
        customizationPresenter.viewDidLoad()
        
        XCTAssertTrue(fakeCustomizationController.spy_didCallDisplayButton)
    }
}
class FakeCustomizationViewController: CustomizationView {
    
    var spy_didCallDisplayButton: Bool = false
    func reloadData() {
        
    }
    
    func display(confirm isEnabled: Bool) {
        spy_didCallDisplayButton = isEnabled
    }
    
}
