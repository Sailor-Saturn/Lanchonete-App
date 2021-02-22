//
//  MenuManagerTests.swift
//  LanchoneteTests
//
//  Created by vera.dias on 2/4/21.
//

import XCTest
@testable import Lanchonete

class MenuManagerTests: XCTestCase {
    func test_GIVEN_the_menu_screen_WHEN_I_see_the_menu_sandwich_table_THEN_I_should_see_all_the_listed_menu_sandwich_names () {
        let menuManager: MenuManager = MenuManager()
        
        XCTAssertEqual(menuManager.getSandwichTypes(), [.xBacon,.xEgg,.xBurger,.xEggBacon,.xCustom])
    }
    
    func test_GIVEN_the_menu_screen_WHEN_I_select_a_sandwich_THEN_I_should_see_the_name_of_the_sandwich () {
        let menuManager: MenuManager = MenuManager()
        
        XCTAssertEqual(menuManager.getSandwichName(type: .xBacon), "X-Bacon")
    }
    
    func test_GIVEN_the_menu_screen_WHEN_I_select_a_sandwich_THEN_I_should_see_the_price_of_the_sandwich () {
        let menuManager: MenuManager = MenuManager()
        
        XCTAssertEqual(menuManager.getSandwichPrice(type: .xBacon), 7.0)
    }
}
