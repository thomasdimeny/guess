//
//  ViewController.swift
//  GuessingGameiOS
//
//  Created by Thomas Dimeny on 3/12/18.
//  Copyright © 2018 Thomas Dimeny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userGuessField: UITextField!
    
    @IBOutlet weak var userFeedbackLabel: UILabel!
    
    @IBOutlet weak var userRules: UILabel!
    
    @IBOutlet weak var guessButton: UIButton!
    
    var randomNumber = Int(arc4random_uniform(10))
    var numberOfGuesses = 5
    var tries = 1
    
    var rulesLabelText = """
    *******************RULES*****************
    Rule 1. Guess a number between 0 and 100.
    Rule 2. You have 5 guesses.
    Rule 3. You shall be given hints.

"""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        userRules.text = rulesLabelText
        guessButton.setTitle("Guess", for: .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func guessButtonPressed(_ sender: Any) {
        if guessButton.titleLabel?.text == "Play Again"{
            self.guessButton.setTitle("Guess", for: .normal)
        }
        if userGuessField.text! == "" {
            userFeedbackLabel.text = "Please input a number"
        } else {
            
        if tries <= 5 {
        let userGuess = Int(userGuessField.text!)
        if userGuess! > randomNumber {
            numberOfGuesses -= 1
            userFeedbackLabel.text = "Too high. You have \(numberOfGuesses) guesses left"
            tries += 1
            
        } else if userGuess! < randomNumber {
          
            userFeedbackLabel.text = "Too low. You have \(numberOfGuesses) guesses left "
            tries += 1
           
            
        } else if userGuess == randomNumber {
            userFeedbackLabel.text = "You got it m8"
           
            }
        } else {
            userFeedbackLabel.text = "You ran out of tries, Play again?"
            guessButton.setTitle("Play Again", for: .normal)
            randomNumber = Int(arc4random_uniform(10))
            tries = 1
            numberOfGuesses = 5
        }
        
    }
    
    
}

}
