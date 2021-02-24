//
//  CustomizationViewPresenter.swift
//  Lanchonete
//
//  Created by vera.dias on 2/9/21.
//

import Foundation

public protocol CustomizationView: AnyObject {
    func reloadData()
}

public protocol CustomizationViewDelegate: AnyObject {
    func customizationViewDidEnd(with ingredients: [Ingredient])
}

public class CustomizationViewPresenter {
    let ingredientManager: IngredientManager
    weak var delegate: CustomizationViewDelegate?
    
    public var view: CustomizationView?
    
    init(ingredientManager: IngredientManager) {
        self.ingredientManager = ingredientManager
    }
    // Get all the sandwiches from the menu
    lazy var ingredients: [Ingredient] = {
        return Ingredient.allCases
    }()
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func titleForSection() -> String {
        return "Available Ingredients"
    }
    
    func numberOfRowsInSection() -> Int {
        return ingredients.count
    }
    
    //MARK: - Cell Configuration
    func configureIngredientView(_ view: IngredientView, forIndex index: Int){
        let ingredient = ingredients[index]
        let quantity = ingredientManager.getQuantity(for: ingredient)
        
        view.populate(ingredient: ingredient.name, price: ingredient.price, quantity: quantity, index: index)
    }
    
    
    func confirmCustomization() {
        delegate?.customizationViewDidEnd(with: ingredientManager.getAllIngredients())
    }
    
    func addIngredient(from row: Int) -> Bool{
        let ingredient = ingredients[row]
        ingredientManager.addIngredient(ingredient)
        return true
    }
    
    func removeIngredient(from row: Int) -> Bool{
        let ingredient = ingredients[row]
        return ingredientManager.removeIngredient(ingredient)
    }
    
    func isConfirmButtonEnabled() -> Bool {
        return !ingredientManager.getAllIngredients().isEmpty
    }
    
}
