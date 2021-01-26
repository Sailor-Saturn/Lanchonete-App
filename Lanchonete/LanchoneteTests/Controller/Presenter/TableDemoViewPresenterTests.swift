//
//  TableDemoViewPresenter.swift
//  LanchoneteTests
//
//  Created by vera.dias on 1/25/21.
//

import XCTest
@testable import Lanchonete

class TableDemoViewPresenterTests: XCTestCase {
    func test_GIVEN_a_sandwich_list_WHEN_I_tap_in_a_sandwich_THEN_I_should_see_the_confirmation_screen(){
        // Given
        
        let fakeDemoTableViewController = FakeDemoTableViewController()
        let tableDemoViewPresenter = TableDemoPresenter()
        
        tableDemoViewPresenter.view = fakeDemoTableViewController
        
        // When
        tableDemoViewPresenter.didSelect(row: 0)
        
        // Then
        XCTAssertTrue(fakeDemoTableViewController.spy_didCallNavigateToConfirmationScreen)
        XCTAssertEqual(fakeDemoTableViewController.spy_verifySandwich, .xBacon)
    }
}

class FakeDemoTableViewController: TableDemoView {
    var spy_didCallNavigateToConfirmationScreen: Bool = false
    var spy_verifySandwich: SandwichType?
    
    func reloadData() {
        
    }
    
    func navigateToConfirmationScreen(sandwich: SandwichType) {
        spy_didCallNavigateToConfirmationScreen = true
        spy_verifySandwich = sandwich
    }
    
    
}
