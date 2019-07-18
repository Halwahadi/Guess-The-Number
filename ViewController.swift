//
//  ViewController.swift
//  Guess The Number
//
//  Created by هدية جونز on 9/27/18.
//  Copyright © 2018 هدية جونز. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    let lowerBound = 1
    let upperBound = 100
    var numberToGuess: Int!
    var numberOfGuesses = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
    }
    func generateRandomNumber() {
        numberToGuess = Int(arc4random_uniform(100)) + 1
        
    }
    
    @IBAction func submitButtonPress(_ sender: UIButton){
        if let guess = guessTextField.text {
            if let guessInt = Int(guess){
                numberOfGuesses = numberOfGuesses + 1
                print(guessInt)
                validateGuess(guessInt)
            }
        }
        print("\(String(describing: numberToGuess))")
        guessTextField.text = nil
        
    }
    func validateGuess(_ guess : Int) {
        if guess < lowerBound || guess > upperBound {
            print("Your guess should be between 1 and 100.")
            //guessLabel.text = "Your guess should be between 1 and 100."
            generateError()
        } else if guess < numberToGuess{
            print("Higher!")
            guessLabel.text = "Higher"
        }else if guess > numberToGuess{
            print("Lower!")
            guessLabel.text = "Lower!"
        }else{
            print("YOU WIN!!!")
            guessLabel.text = "YOU WIN!!!"
            numberOfGuesses = 0
            generateRandomNumber()
        }
    }
    
    func generateError(){
        let alert = UIAlertController(title: "NUMBER OUT OF BOUNDS.", message: "Your number should be between 1 and 100.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self .present(alert, animated: true, completion: nil)
    }
}
