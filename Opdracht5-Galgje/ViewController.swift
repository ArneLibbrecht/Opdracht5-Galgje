//
//  ViewController.swift
//  Opdracht5-Galgje
//
//  Created by student on 08/11/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func startTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Wat is het woord?", message: nil, preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Woord"
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            if let word = alert.textFields?.first?.text {
                print("Woord: \(word)")
            }
        }))
        
        self.present(alert, animated: true)
    }
    
}

