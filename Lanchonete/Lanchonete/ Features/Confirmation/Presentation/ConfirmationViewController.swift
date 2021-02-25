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
    @IBOutlet weak var addToShoppingCartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        canTheSandwichBeAddedToShoppingCart()
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        countLabel.text = presenter?.incrementQuantity()
        canTheSandwichBeAddedToShoppingCart()
    }
    
    @IBAction func minusButtonTapped(_ sender: Any) {
        countLabel.text = presenter?.decrementQuantity()
        canTheSandwichBeAddedToShoppingCart()
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
        
        customizationViewController.presenter = CustomizationViewPresenter(ingredientManager: IngredientManager(with: ingredients))
        customizationViewController.presenter?.delegate = self
    }
    
    func displaySandwich() {
        sandwichTitle.text = presenter?.getSandwichName()
        sandwichIngredientList.text = presenter?.getIngredientListToString()
        if let code = presenter?.getSandwichCode(),
           let image = UIImage(named: code) {
            sandwichImage.image = image
        }
    }
    
    func canTheSandwichBeAddedToShoppingCart() {
        if (presenter!.getSandwichIngredients().isEmpty || countLabel.text == "0"){
            addToShoppingCartButton.isEnabled = false
            addToShoppingCartButton.alpha = 0.5
        }else {
            addToShoppingCartButton.isEnabled = true
            addToShoppingCartButton.alpha = 1
        }
    }
}
extension ConfirmationViewController: CustomizationViewDelegate {
    func customizationViewDidEnd(with ingredients: [Ingredient]) {
        presenter?.updateIngredientList(ingredients: ingredients)
        canTheSandwichBeAddedToShoppingCart()
    }
}


