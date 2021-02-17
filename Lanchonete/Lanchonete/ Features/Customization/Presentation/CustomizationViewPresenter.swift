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
    let allIngredientManager: AllIngredientsManager
    
    public var view: CustomizationView?
    
    init(ingredientManager: IngredientManager, allIngredientManager: AllIngredientsManager) {
        self.ingredientManager = ingredientManager
        self.allIngredientManager = allIngredientManager
    }
    // Get all the sandwiches from the menu
    lazy var ingredients: [Ingredient] = {
        return allIngredientManager.getIngredientList()
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
        view.display(price: allIngredientManager.getIngredientPrice(ingredient: ingredient))
        view.display(ingredient: allIngredientManager.getIngredientName(ingredient: ingredient))
        configureQuantity(view: view, ingredient: ingredient)
    }
    
    func configureQuantity(view: IngredientView,ingredient: Ingredient) {
        if(ingredientManager.containsIngredient(ingredient: ingredient)){
            view.display(quantityValue: 1)
        }else {
            view.display(quantityValue: 0)
        }
    }
    
}
