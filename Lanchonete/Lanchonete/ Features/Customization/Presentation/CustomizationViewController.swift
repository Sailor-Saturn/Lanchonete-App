//
//  CustomizationViewController.swift
//  Lanchonete
//
//  Created by vera.dias on 2/9/21.
//

import UIKit

class CustomizationViewController: UITableViewController, CustomizationView {
    
    var presenter: CustomizationViewPresenter?
    
    func reloadData() {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Section Configuration
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let numberOfSections = presenter?.numberOfSections(){
            return numberOfSections
        }
        return -1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let titleForSection = presenter?.titleForSection(){
            return titleForSection
        }
        return "ERROR"
        
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
            return ingredientCell
        }
        return UITableViewCell()
    }
    
    @IBAction func dismissScreen(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
