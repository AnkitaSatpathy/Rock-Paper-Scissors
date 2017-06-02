//
//  ResultViewController.swift
//  Rock Paper Scissors
//
//  Created by Ankita Satpathy on 02/06/17.
//  Copyright © 2017 Ankita Satpathy. All rights reserved.
//

import UIKit

enum Shape:String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"


static func randomShape() -> Shape{
    let shapes = ["Rock", "Paper", "Scissors"]
    let randomChoice = Int(arc4random_uniform(3))
    return Shape(rawValue: shapes[randomChoice])!
    }
}
    

class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    
    var userChoice: Shape!
    var systemChoice: Shape = Shape.randomShape()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    func displayResult(){
        var resultText: String
        var image : String
         let match = "\(userChoice.rawValue) vs. \(systemChoice.rawValue)"
        
        switch (userChoice! , systemChoice) {
        case let (user, opponent) where user == opponent:
            resultText = "\(match): it's a tie!"
            image = "tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            resultText = "You win with \(match)!"
            image = "\(userChoice.rawValue)-\(systemChoice.rawValue)"
        default:
            resultText = "You lose with \(match) :(."
            image = "\(systemChoice.rawValue)-\(userChoice.rawValue)"
        }
        
        image = image.lowercased()
        self.imageview.image = UIImage(named:image)
        self.resultLabel.text = resultText

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func playAgainBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

   
}
