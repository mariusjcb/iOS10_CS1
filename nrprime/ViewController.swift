//
//  ViewController.swift
//  nrprime
//
//  Created by Marius Ilie on 08/03/17.
//  Copyright © 2017 Marius Ilie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Brain aka. Model
    
    var numberFromTextField: Int? {
        didSet {
            if numberFromTextField != nil {
                numberFromTextFieldIsAPrimeNumber = checkPrimeWith(value: numberFromTextField!)
            } else {
                numberFromTextFieldIsAPrimeNumber = nil
            }
        }
    }
    
    var numberFromTextFieldIsAPrimeNumber: Bool? {
        didSet {
            updateUI()
        }
    }
    
    func checkPrimeWith(value number: Int) -> Bool {
        if number <= 1 {
            return false
        }
        
        if number <= 3 {
            return true
        }
        
        
        for i in 2...(number/2) {
            if number % i == 0 {
                return false
            }
        }
        
        return true
    }
    
    //MARK: - Logic aka. Controller
    
    func setNumberWith(stringValue num: String?) {
        textField.resignFirstResponder()
        
        if let n = num {
            numberFromTextField = Int(n)
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func onTap(_ sender: UIButton) {
        setNumberWith(stringValue: textField.text)
    }
    
    @IBAction func button7(_ sender: UIButton) {
        setNumberWith(stringValue: sender.currentTitle)
    }
    
    @IBAction func callUpdateUI(_ sender: UIButton) {
        updateUI()
    }
    
    //MARK: - Interface aka. View
    
    func updateUI() {
        if let img = UIImage(named: "i-should-buy-a-boat") {
            let imgView = UIImageView()
            
            imgView.image = img
            imgView.contentMode = UIViewContentMode.scaleAspectFill
            imgView.frame = view.frame
            
            view.insertSubview(imgView, at: 0)
        }
        
        if let currentStatus = numberFromTextFieldIsAPrimeNumber {
            if currentStatus {
                statusLabel.text = "Prim"
            }
            else {
                statusLabel.text = "Neprim"
            }
        } else {
            statusLabel.text = "Ghertoiule 😡"
        }
    }
}

