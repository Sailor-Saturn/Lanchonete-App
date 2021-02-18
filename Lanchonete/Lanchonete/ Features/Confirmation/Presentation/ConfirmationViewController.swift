//
//  ConfirmationViewController.swift
//  Lanchonete
//
//  Created by vera.dias on 1/25/21.
//

import UIKit

final class ConfirmationViewController: UIViewController {
    
    var presenter: ConfirmationViewPresenter?
    
    @IBOutlet weak var sandwichView: UIImageView!
    
    @IBOutlet weak var sandwichTitle: UILabel!
    @IBOutlet weak var sandwichIngredientList: UILabel!
    @IBOutlet weak var sandwichImage: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sandwichTitle.text = presenter?.getSandwichName()
        sandwichIngredientList.text = presenter?.getIngredientList()
        if let code = presenter?.getSandwichCode(),
           let image = UIImage(named: code) {
            sandwichImage.image = image
        }
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        countLabel.text = presenter?.incrementQuantity()
    }
    
    @IBAction func minusButtonTapped(_ sender: Any) {
        countLabel.text = presenter?.decrementQuantity()
    }
    
    @IBAction func personalizeButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: Segues.confirmationToCustomization, sender: presenter?.getSandwichIngredients())
    }
    
    @IBAction func addToShoppingCartButtonTapped(_ sender: Any) {
        presenter?.addToShoppingCart()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goBackButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: sender)
        
        guard let customizationViewController = segue.destination as? CustomizationViewController,
              let ingredients = sender as? [Ingredient] else {
            return
        }
        
        customizationViewController.presenter = CustomizationViewPresenter(ingredientManager: IngredientManager(with: ingredients), allIngredientManager: AllIngredientsManager())
    }
}
