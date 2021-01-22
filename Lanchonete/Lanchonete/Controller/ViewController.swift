//
//  ViewController.swift
//  Lanchonete
//
//  Created by vera.dias on 1/6/21.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var xBaconPrice: UILabel!
    @IBOutlet weak var xBaconQuantity: UILabel!
    @IBOutlet weak var xBaconName: UILabel!
    
    @IBOutlet weak var xBurguerPrice: UILabel!
    @IBOutlet weak var xBurguerName: UILabel!
    @IBOutlet weak var xBurguerQuantity: UILabel!
    
    @IBOutlet weak var xEggPrice: UILabel!
    @IBOutlet weak var xEggName: UILabel!
    @IBOutlet weak var xEggQuantity: UILabel!
    
    @IBOutlet weak var xEggBaconPrice: UILabel!
    @IBOutlet weak var xEggBaconName: UILabel!
    @IBOutlet weak var xEggBaconQuantity: UILabel!
    
    @IBOutlet weak var totalValue: UILabel!
    
    var xBaconQuantityVal:Int = 0
    var xBurguerQuantityVal: Int = 0
    var xEggQuantityVal: Int = 0
    var xEggBaconQuantityVal: Int = 0
    
    var finalPriceVal: Double = 0.0
    
    let sandwichManager = SandwichManager()
    let ingredientManager = IngredientManager()
    let shoppingCartManager = ShoppingCartManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        xBaconName.text = sandwichManager.getSandwichName(type: .xBacon)
        xBaconQuantity.text = "x" + String(xBaconQuantityVal)
        xBaconPrice.text = String(sandwichManager.getSandwichPrice(type: .xBacon))
        
        xBurguerName.text = sandwichManager.getSandwichName(type: .xBurguer)
        xBurguerQuantity.text = "x" + String(xBaconQuantityVal)
        xBurguerPrice.text = String(sandwichManager.getSandwichPrice(type: .xBurguer))
        
        xEggQuantity.text = "x" + String(xBaconQuantityVal)
        xEggName.text = sandwichManager.getSandwichName(type: .xEgg)
        xEggPrice.text = String(sandwichManager.getSandwichPrice(type: .xEgg))
        
        xEggBaconName.text = sandwichManager.getSandwichName(type: .xEggBacon)
        xEggBaconQuantity.text = "x" + String (xEggBaconQuantityVal)
        xEggBaconPrice.text = String(sandwichManager.getSandwichPrice(type: .xEggBacon))
        
        totalValue.text = String(finalPriceVal)
    }
    
    @IBAction func onAddSandwichxBacon(_ sender: UIButton) {
        shoppingCartManager.addSandwich(type: .xBacon)
        xBaconQuantityVal+=1
        
        xBaconQuantity.text = "x" + String(xBaconQuantityVal)
        
        finalPriceVal = shoppingCartManager.getFinalPrice()
        totalValue.text = String (finalPriceVal)
    }
    
    
    @IBAction func onRemoveSandwichxBacon(_ sender: UIButton) {
        if(xBaconQuantityVal > 0){
            shoppingCartManager.removeSandwich(type: .xBacon)
            xBaconQuantityVal-=1
            
            xBaconQuantity.text = "x" + String(xBaconQuantityVal)
            
            finalPriceVal = shoppingCartManager.getFinalPrice()
            totalValue.text = String (finalPriceVal)
        }
    }
    
    
    @IBAction func onAddSandwichxBurguer(_ sender: UIButton) {
        shoppingCartManager.addSandwich(type: .xBurguer)
        xBurguerQuantityVal+=1
        
        xBurguerQuantity.text = "x" + String(xBurguerQuantityVal)
        
        finalPriceVal = shoppingCartManager.getFinalPrice()
        totalValue.text = String (finalPriceVal)
    }
    
    @IBAction func onRemoveSandwichxBurguer(_ sender: UIButton) {
        if(xBaconQuantityVal > 0){
            shoppingCartManager.removeSandwich(type: .xBurguer)
            xBurguerQuantityVal-=1
            
            xBurguerQuantity.text = "x" + String(xBurguerQuantityVal)
            
            finalPriceVal = shoppingCartManager.getFinalPrice()
            totalValue.text = String (finalPriceVal)
        }
    }
    
    @IBAction func onAddSandwichxEgg(_ sender: UIButton) {
        shoppingCartManager.addSandwich(type: .xEgg)
        xEggQuantityVal+=1
        
        xEggQuantity.text = "x" + String(xEggQuantityVal)
        
        finalPriceVal = shoppingCartManager.getFinalPrice()
        totalValue.text = String (finalPriceVal)
    }
    
    
    @IBAction func onRemovexEgg(_ sender: UIButton) {
        if(xEggQuantityVal > 0){
            shoppingCartManager.removeSandwich(type: .xEgg)
            xEggQuantityVal-=1
            
            xEggQuantity.text = "x" + String(xEggQuantityVal)
            
            finalPriceVal = shoppingCartManager.getFinalPrice()
            totalValue.text = String (finalPriceVal)
        }
    }
    
    @IBAction func onAddxEggBacon(_ sender: UIButton) {
        shoppingCartManager.addSandwich(type: .xEggBacon)
        xEggBaconQuantityVal+=1
        
        xEggBaconQuantity.text = "x" + String(xEggBaconQuantityVal)
        
        finalPriceVal = shoppingCartManager.getFinalPrice()
        totalValue.text = String (finalPriceVal)
    }
    
    
    @IBAction func onRemovexEggBacon(_ sender: Any) {
        if(xEggBaconQuantityVal > 0){
            shoppingCartManager.removeSandwich(type: .xEggBacon)
            xEggBaconQuantityVal-=1
            
            xEggBaconQuantity.text = "x" + String(xEggBaconQuantityVal)
            
            finalPriceVal = shoppingCartManager.getFinalPrice()
            totalValue.text = String (finalPriceVal)
        }
    }
    
}

