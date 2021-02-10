//
//  TableDemoViewPresenter.swift
//  Lanchonete
//
//  Created by vera.dias on 1/20/21.
//

import Foundation

public protocol TableDemoView: class {
    func reloadData()
    func navigateToConfirmationScreen(sandwich: SandwichType)
}

public class TableDemoPresenter {
    public var view: TableDemoView?
    let menuManager = MenuManager()
    
    // Get all the sandwiches from the menu
    lazy var menuSandwiches: [SandwichType] = {
        return menuManager.getSandwichTypes()
    }()
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func titleForSection() -> String {
        return "Menu Sandwiches"
    }
    
    func numberOfRowsInSection() -> Int {
        return menuSandwiches.count
    }
    
    //MARK: - Cell Configuration
    func configureMenuSandwichView(_ view: SandwichView, forIndex index: Int){
        let sandwich = menuSandwiches[index]
        view.display(sandwich: menuManager.getSandwichName(type: sandwich))
        view.display(price: String(menuManager.getSandwichPrice(type: sandwich)))
    }
    
    func didSelect(row: Int){
        let selectedSandwich = menuSandwiches[row]
        view?.navigateToConfirmationScreen(sandwich: selectedSandwich)
    }
}
