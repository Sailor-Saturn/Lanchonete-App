//
//  ConfirmationViewController.swift
//  Lanchonete
//
//  Created by vera.dias on 1/25/21.
//

import UIKit

final class ConfirmationViewController: UIViewController {
    
    @IBOutlet weak var nameSandwich: UILabel!
    @IBOutlet weak var priceSandwich: UILabel!
    
    let sandwichManager = SandwichManager()
    
    var sandwichType: SandwichType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameSandwich.text = sandwichManager.getSandwichName(type: sandwichType!)
        priceSandwich.text = String (sandwichManager.getSandwichPrice(type: sandwichType!))
    }
}
