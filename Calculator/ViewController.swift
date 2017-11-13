//
//  ViewController.swift
//  Calculator
//
//  Created by Mihir Rathwa on 8/24/17.
//  Copyright © 2017 Mihir Rathwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstOperand:Double = 0
    var secondOperand:Double = 0
    var displayOperator = false
    var operatorTag = 0;
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if displayOperator == true {
            
            display.text = String(sender.tag-1)
            secondOperand = Double(display.text!)!
            displayOperator = false
            
        } else {
            
            display.text = display.text! + String(sender.tag-1)
            secondOperand = Double(display.text!)!
            
        }
        
    }

    @IBAction func operations(_ sender: UIButton) {
        
        if display.text != "" && sender.tag != 11 && sender.tag != 16 {
            
            firstOperand = Double(display.text!)!
            
            if sender.tag == 12 {
                
                display.text = "÷"
                
            } else if sender.tag == 13 {
                
                display.text = "x"
                
            } else if sender.tag == 14 {
                
                display.text = "-"
                
            } else if sender.tag == 15 {
                
                display.text = "+"
                
            } else if sender.tag == 17 {
                
                display.text = "%"
                
            }
            operatorTag = sender.tag
            displayOperator = true
            
        } else if sender.tag == 16 {
            
            if operatorTag == 12 {
                
                display.text = String(firstOperand / secondOperand)
                
            } else if operatorTag == 13 {
                
                display.text = String(firstOperand * secondOperand)
                
            } else if operatorTag == 14 {
                
                display.text = String(firstOperand - secondOperand)
                
            } else if operatorTag == 15 {
                
                display.text = String(firstOperand + secondOperand)
                
            } else if operatorTag == 17 {
                
                display.text = String(fmod(firstOperand, secondOperand))
                
            }
            
        } else if sender.tag == 11 {
            
            display.text = ""
            firstOperand = 0
            secondOperand = 0
            operatorTag = 0
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

