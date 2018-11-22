//
//  ViewController.swift
//  Opdracht5-Galgje
//
//  Created by student on 08/11/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let alphabet = "abcdefghijklmnopqrstuvwxyz"
    var gameEngine:GameEngine=GameEngine()
    @IBOutlet var letterPicker: UIPickerView!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var chosenLettersPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func playTapped(_ sender: Any) {
        if(letterPicker.selectedRow(inComponent: 0) != 0){
        let index=alphabet.index(alphabet.startIndex,offsetBy:letterPicker.selectedRow(inComponent: 0)-1)
        let result:(Bool,[Int:Character?]?) = gameEngine.guessLetter(letter:alphabet[index])
        
        if(result.0){
            if(result.1 != nil){
            guessed(letters: result.1!)
            }
        }
        }
    }
    
    private func guessed(letters:[Int:Character?]){
        var s:String=""
            for l in 0..<letters.count {
                if(letters[l]! == nil){
                    s.append("_")
                }
                else{
                    chosenLettersPicker.selectRow((alphabet.firstIndex(of: letters[l]!!)?.encodedOffset)! + 1, inComponent: l, animated: true)
                    s.append(letters[l]!!)
                }
            
        }
    }
    
    
    @IBAction func startTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Wat is het woord?", message: nil, preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Woord"
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            if let word:String = alert.textFields?.first?.text {
                print("Woord: \(word)")
                
                if(!self.gameEngine.setWord(word: word)){
                    let error = UIAlertController(title: "Fout", message: "Gelieve een woord in te geven met minstens 1 letter en maximaal 6 letters.", preferredStyle: .alert)
                    error.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(error,animated: true)
                    self.letterPicker.isUserInteractionEnabled=false
                    self.playButton.isEnabled=false
                }
                else{
                    self.letterPicker.isUserInteractionEnabled=true
                    self.playButton.isEnabled=true
                    for w in 0..<self.chosenLettersPicker.numberOfComponents{
                        self.chosenLettersPicker.selectRow(0, inComponent: w, animated: true)
                    }
                }
                self.letterPicker.selectRow(0, inComponent: 0, animated: true)
            }
        }))
        
        self.present(alert, animated: true)
    }
    
}

