//
//  ViewController.swift
//  firstApp
//
//  Created by Satish Chandra Panigrahi on 2016-02-26.
//  Copyright © 2016 Satish Chandra Panigrahi. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(ViewController.promptForMsg))
        
        // Add for class Asisgnment - option 1
      //  navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Action, target: self, action: #selector(ViewController.shareTapped))
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(ViewController.promptForMsg)), UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Action, target: self, action: #selector(ViewController.shareTapped))]
        
    }
    
    // Added for class assignment
    
    func shareTapped() {
        let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        vc.setInitialText(labelText.text)
        presentViewController(vc, animated: true, completion: nil)
        
        // put check code for BMI here
    }
    
    func promptForMsg(){
        let ac = UIAlertController(title: "Enter Message", message: nil, preferredStyle: .Alert)
        ac.addTextFieldWithConfigurationHandler{(textField: UITextField!) in
        textField.keyboardType = UIKeyboardType.DecimalPad
        textField.placeholder = "Mass (kg)"
        
        }
        ac.addTextFieldWithConfigurationHandler{(textField: UITextField!) in
            textField.keyboardType = UIKeyboardType.DecimalPad
            textField.placeholder = "Height (m)"
        }

        
        let submitAction = UIAlertAction(title: "Submit", style: .Default) {
            [unowned self, ac] (action: UIAlertAction) in
            let weight = Float(ac.textFields![0].text!)
            // check and error message
            let height = Float(ac.textFields![1].text!)
            // check and error message
            let bmi = weight!/(height! * height!)
            // some thing like try catch

            self.labelText.text = "Your BMI is \(String(bmi))"
            
        }
        
        ac.addAction(submitAction)
        
        presentViewController(ac, animated: true, completion: nil)
        
        labelText.text = "You clicked plus long msg"
        return
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

