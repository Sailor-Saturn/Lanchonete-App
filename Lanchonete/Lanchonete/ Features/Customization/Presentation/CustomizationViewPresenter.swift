//
//  CustomizationViewPresenter.swift
//  Lanchonete
//
//  Created by vera.dias on 2/9/21.
//


import Foundation

public protocol CustomizationView: class {
    func reloadData()
}
public class CustomizationViewPresenter {
    let ingredientManager: IngredientManager
    
    public var view: CustomizationView?
    
    init(ingredientManager: IngredientManager) {
        self.ingredientManager = ingredientManager
    }
    // Get all the sandwiches from the menu
    lazy var ingredients: [Ingredient] = {
        return ingredientManager.getIngredientList()
    }()
    
    func numberOfSections() -> Int {
        return Sections.allCases.count
    }
    
    func titleForSection() -> String {
        return "Avaliable Ingredients"
    }
    
    func numberOfRowsInSection() -> Int {
        return ingredients.count
    }
    
    //MARK: - Cell Configuration
    func configureIngredientView(_ view: IngredientView, forIndex index: Int){
        let ingredient = ingredients[index]
        view.display(price: ingredientManager.getIngredientPrice(ingredient: ingredient))
        view.display(ingredient: ingredientManager.getIngredientName(ingredient: ingredient))
    }
    
}
