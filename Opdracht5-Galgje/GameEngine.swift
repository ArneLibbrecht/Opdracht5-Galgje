//
//  GameEngine.swift
//  Opdracht5-Galgje
//
//  Created by lector on 14/11/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation
class GameEngine{
    private var word:String;
    private var guessedLetters:[Int:Character?]
    init()
    {
        word=""
        guessedLetters=[:]
    }
    
    
    func setWord(word:String)->Bool{
        if(word.count>6 || word.count<1 || word.range(of:"([a-zA-Z])+$", options: .regularExpression) == nil){
        return false
        }
      else{
        self.word=word
            for l in 0..<self.word.count{
               guessedLetters.updateValue(nil, forKey: l)
            }
        return true
        }
    }
    
    func guessLetter(letter:Character)->(hasLetter:Bool,guessedLetters:[Int:Character?]?)    {
        let hasLetter=word.range(of: String(letter)) != nil
        
        if(hasLetter){
            for l in 0..<self.word.count {

                if(guessedLetters[l]!==nil && self.word[word.index(word.startIndex,offsetBy: l)]==letter){
                    guessedLetters.updateValue(letter, forKey: l)
                }
            }
        }

        return (hasLetter:hasLetter,guessedLetters:guessedLetters)
       
    }
    
}
