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
    
    var sandwichType: SandwichType?
    
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
    }
    
    @IBAction func addToShoppingCartButtonTapped(_ sender: Any) {
    }
    
    @IBAction func goBackButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}