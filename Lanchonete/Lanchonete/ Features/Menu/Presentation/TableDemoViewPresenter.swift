//
//  TableDemoViewPresenter.swift
//  Lanchonete
//
//  Created by vera.dias on 1/20/21.
//

import Foundation

public enum Sections: CaseIterable {
    case menuSandwiches
    case ingredients
}
public protocol TableDemoView: class {
    func reloadData()
    func navigateToConfirmationScreen(sandwich: SandwichType)
}

public class TableDemoPresenter {
    public var view: TableDemoView?
    let sandwichManager = SandwichManager()
    let ingredientManager = IngredientManager()
    
    // Get all the sandwiches from the menu
    lazy var menuSandwiches: [SandwichType] = {
        return sandwichManager.getSandwichTypes()
    }()
    
    //Get all Ingredients from the menu
    // Get all the sandwiches from the menu
    lazy var ingredients: [Ingredient] = {
        return ingredientManager.getIngredientList()
    }()
    
    func numberOfSections() -> Int {
        return Sections.allCases.count
    }
    
    func titleForSection(_ section: Int) -> String {
        let section = Sections.allCases[section]
        
        switch section {
        case .menuSandwiches:
            return "Menu Sandwiches"
        case .ingredients:
            return "Available Ingredients to personalize"
        }
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        let section = Sections.allCases[section]
        
        switch section {
        case .menuSandwiches:
            return menuSandwiches.count
        case .ingredients:
            return ingredients.count
        }
    }
    
    func getSectionHeaders() -> [Sections]{
        return Sections.allCases
    }
    
    //MARK: - Cell Configuration
    func configureMenuSandwichView(_ view: SandwichView, forIndex index: Int){
        let sandwich = menuSandwiches[index]
        view.display(sandwich: "PLACEHOLDER REMOVER")
        view.display(price: String(sandwichManager.getSandwichPrice(type: sandwich)))
    }
    
    func configureIngredientView(_ view: IngredientView, forIndex index: Int){
        let ingredient = ingredients[index]
        view.display(price: ingredientManager.getIngredientPrice(ingredient: ingredient))
        view.display(ingredient: ingredientManager.getIngredientName(ingredient: ingredient))
        
    }
    
    func didSelect(row: Int){
        let selectedSandwich = menuSandwiches[row]
        view?.navigateToConfirmationScreen(sandwich: selectedSandwich)
    }
}
