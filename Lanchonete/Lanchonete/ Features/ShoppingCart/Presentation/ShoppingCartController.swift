//
//  ShoppingCartController.swift
//  Lanchonete
//
//  Created by vera.dias on 2/10/21.
//

import UIKit

class ShoppingCartController: UITableViewController, ShoppingCartView {
    
    var presenter: ShoppingCartPresenter!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    func reloadData() {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPriceLabel.text = presenter.getTotal()
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
        return presenter.numberOfRowsInSection()
        
    }
    
    //MARK: - Cell configuration
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let shoppingCartCell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCart") as? ShoppingCartCell {
            presenter.configureShoppingCartView(shoppingCartCell, forIndex: indexPath.row)
            return shoppingCartCell
        }
        return UITableViewCell()
    }
    
    @IBAction func dismissScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

