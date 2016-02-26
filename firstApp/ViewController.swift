//
//  ViewController.swift
//  firstApp
//
//  Created by Satish Chandra Panigrahi on 2016-02-26.
//  Copyright © 2016 Satish Chandra Panigrahi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(ViewController.promptForMsg))
        
    }
    
    func promptForMsg(){
        let ac = UIAlertController(title: "Enter Message", message: nil, preferredStyle: .Alert)
        ac.addTextFieldWithConfigurationHandler(nil)
        
        let submitAction = UIAlertAction(title: "Submit", style: .Default) {
            [unowned self, ac] (action: UIAlertAction) in
            //our code
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

