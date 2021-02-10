//
//  TableViewController.swift
//  Lanchonete
//
//  Created by vera.dias on 1/20/21.
//

import UIKit
enum Segues {
    static let listToConfirmation = "listToConfirmation"
}


class TableViewController: UITableViewController, TableDemoView {
    let presenter = TableDemoPresenter()
    
    func reloadData() {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
    }
    
    //MARK: - Section Configuration
    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.titleForSection()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection()
    }
    
    //MARK: - Cell configuration
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let sandwichCell = tableView.dequeueReusableCell(withIdentifier: "MenuSandwich") as? SandwichCell {
            presenter.configureMenuSandwichView(sandwichCell, forIndex: indexPath.row)
            return sandwichCell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
    }
    
    func navigateToConfirmationScreen(sandwich: SandwichType){
        self.performSegue(withIdentifier: Segues.listToConfirmation, sender: sandwich)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let confirmationViewController = segue.destination as? ConfirmationViewController,
              let sandwichType = sender as? SandwichType  else {
            return
        }
        
        confirmationViewController.presenter = ConfirmationViewPresenter(sandwichManager: SandwichManager(with: sandwichType))
    }
}
