//
//  ViewController.swift
//  Cafe App
//
//  Created by SAMANTHA SPRAGUE on 9/13/22.
//

import UIKit

class ViewController: UIViewController {

    
    var items = ["water", "chocolate", "lemonade", "wrap", "apple"]
    var prices = [1.50, 1.00, 2.00, 5.00, 1.50]
    var total = 0.0
    var cart = ""
    var menu = ""
    
    @IBOutlet weak var menuOutlet: UITextView!
    @IBOutlet weak var userItemOutlet: UITextField!
    @IBOutlet weak var cartOutlet: UITextView!
    @IBOutlet weak var errorOutlet: UILabel!
    @IBOutlet weak var totalOutlet: UILabel!
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var cartLabelOutlet: UILabel!
    @IBOutlet weak var addButtonOutlet: UIButton!
    @IBOutlet weak var passButtonOutlet: UIButton!
    @IBOutlet weak var passLabelOutlet: UILabel!
    @IBOutlet weak var adminAddButtonOutlet: UIButton!
    @IBOutlet weak var adminDeleteButtonOutlet: UIButton!
    @IBOutlet weak var priceOutlet: UITextField!
    @IBOutlet weak var exitButtonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        adminAddButtonOutlet.isHidden = true
        adminDeleteButtonOutlet.isHidden = true
        priceOutlet.isHidden = true
        exitButtonOutlet.isHidden = true
        
        for i in 0 ..< items.count{
            menu += " \n  $\(prices[i])  \t  \(items[i])"
        }
        menuOutlet.text = menu
        
    }
    
    
    @IBAction func addItemAction(_ sender: Any) {
        
        
        var index = 0
        var bool = false
        for i in 0..<items.count{
            if items[i] == userItemOutlet.text{
                bool = true
                index = i
            }
        }
        
        if bool{
            cart += "\n $\(prices[index]) \t \(items[index])"
            total += prices[index]
        }else{
            errorOutlet.text = "Error: Invalid entry"
        }
        
        cartOutlet.text = cart
        totalOutlet.text = "Total: $\(total)"
        userItemOutlet.text = ""
        
    }
    
    
    @IBAction func abcAction(_ sender: Any) {
        
        while true{
            var again = true
            for i in 0..<items.count - 1{
                let tempI = items[i]
                let tempP = prices[i]
                
                if items[i] > items[i+1]{
                    items[i] = items[i+1]
                    items[i+1] = tempI
                    prices[i] = prices[i+1]
                    prices[i+1] = tempP
                    again = false
                }
            }
            if again{
                break
            }
        }
        menu = ""
        for i in 0 ..< items.count{
            menu += " \n  $\(prices[i])  \t  \(items[i])"
        }
        menuOutlet.text = menu
    }
    
    
    @IBAction func priceAction(_ sender: Any) {
        
        while true{
            var again = true
            for i in 0..<items.count - 1{
                let tempI = items[i]
                let tempP = prices[i]
                
                if prices[i] > prices[i+1]{
                    items[i] = items[i+1]
                    items[i+1] = tempI
                    prices[i] = prices[i+1]
                    prices[i+1] = tempP
                    again = false
                }
            }
            if again{
                break
            }
        }
        menu = ""
        for i in 0 ..< items.count{
            menu += " \n  $\(prices[i])  \t  \(items[i])"
        }
        menuOutlet.text = menu
    }
    
    
    
    @IBAction func passwordAction(_ sender: Any) {
        
        if passwordOutlet.text == "saxy"{
            cartOutlet.isHidden = true
            totalOutlet.isHidden = true
            passwordOutlet.isHidden = true
            passButtonOutlet.isHidden = true
            addButtonOutlet.isHidden = true
            cartLabelOutlet.isHidden = true
            passLabelOutlet.isHidden = true
            adminAddButtonOutlet.isHidden = false
            adminDeleteButtonOutlet.isHidden = false
            priceOutlet.isHidden = false
            exitButtonOutlet.isHidden = false
            
        }else{
            passLabelOutlet.text = "Incorrect Password"
        }
        
        passwordOutlet.text = ""
        passLabelOutlet.text = ""
        errorOutlet.text = ""
    }
    

    @IBAction func adminAddAction(_ sender: Any) {
        errorOutlet.text = ""
        var bool = false
        for i in 0..<items.count{
            if items[i] == userItemOutlet.text{
                bool = true
            }
        }
        if bool{
            errorOutlet.text = "Item already on menu"
        }else{
           // var p = 0.0
            if let p = Double(priceOutlet.text ?? "0.0"){
                menu += "\n $ \(p)\t \(userItemOutlet.text!)"
                prices.append(p)
                menuOutlet.text = menu
                items.append(userItemOutlet.text!)
            }else{
                errorOutlet.text = "Error: Invalid price"
            }
        }
        
        userItemOutlet.text = ""
        priceOutlet.text = ""
        
    }
    
    @IBAction func adminDeleteAction(_ sender: Any) {
        errorOutlet.text = ""
        var bool = false
        var index = 0
        for i in 0..<items.count{
            if items[i] == userItemOutlet.text{
                bool = true
                index = i
            }
        }
        if bool{
            items.remove(at: index)
            prices.remove(at: index)
            
            menu = ""
            for i in 0 ..< items.count{
                menu += " \n  $\(prices[i])  \t  \(items[i])"
            }
            menuOutlet.text = menu
            
        }else{
            errorOutlet.text = "Error: Item not in menu"
        }
        userItemOutlet.text = ""
        priceOutlet.text = ""
    }
    
    
    
    @IBAction func exitButton(_ sender: Any) {
        cartOutlet.isHidden = false
        totalOutlet.isHidden = false
        passwordOutlet.isHidden = false
        passButtonOutlet.isHidden = false
        addButtonOutlet.isHidden = false
        cartLabelOutlet.isHidden = false
        passLabelOutlet.isHidden = false
        adminAddButtonOutlet.isHidden = true
        adminDeleteButtonOutlet.isHidden = true
        priceOutlet.isHidden = true
        exitButtonOutlet.isHidden = true
        errorOutlet.text = ""
        
    }
    
    

}

