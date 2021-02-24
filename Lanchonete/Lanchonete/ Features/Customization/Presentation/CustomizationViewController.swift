//
//  CustomizationViewController.swift
//  Lanchonete
//
//  Created by vera.dias on 2/9/21.
//

import UIKit

class CustomizationViewController: UITableViewController, CustomizationView {
    
    @IBOutlet weak var confirmButton: UIButton!
    var presenter: CustomizationViewPresenter?
    
    func reloadData() {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let flag = presenter!.isConfirmButtonEnabled()
        confirmButton.isEnabled = flag
        if flag == false{
            confirmButton.alpha = 0.5
        }
    }
    
    //MARK: - Section Configuration
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let numberOfSections = presenter?.numberOfSections(){
            return numberOfSections
        }
        return -1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let titleForSection = presenter?.titleForSection() else{
            return "ERROR"
        }
        return titleForSection
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let numberOfRowsInSection = presenter?.numberOfRowsInSection() {
            return numberOfRowsInSection
        }
        return -1
    }
    
    //MARK: - Cell configuration
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let ingredientCell = tableView.dequeueReusableCell(withIdentifier: "Ingredient") as? IngredientCell {
            presenter?.configureIngredientView(ingredientCell, forIndex: indexPath.row)
            ingredientCell.delegate = self
            return ingredientCell
        }
        return UITableViewCell()
    }
    
    @IBAction func dismissScreen(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func confirmCustomization(_ sender: UIButton) {
        presenter?.confirmCustomization()
        self.dismiss(animated: true, completion: nil)
    }
}
extension CustomizationViewController: IngredientCellDelegate {
    func ingredientCellDidDecreaseQuantity(for index: Int) {
        confirmButton.isEnabled = presenter!.removeIngredient(from: index)
        if !confirmButton.isEnabled {
            confirmButton.alpha = 0.5
        }
        reloadData()
    }
    
    func ingredientCellDidIncrementQuantity(for index: Int) {
        confirmButton.isEnabled = presenter!.addIngredient(from: index)
        confirmButton.alpha = 1
       
        reloadData()
    }
}
