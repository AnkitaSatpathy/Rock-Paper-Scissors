//
//  ViewController.swift
//  Rock Paper Scissors
//
//  Created by Ankita Satpathy on 02/06/17.
//  Copyright © 2017 Ankita Satpathy. All rights reserved.
//

import UIKit

class ShapeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func RockBtnPrssed(_ sender: Any) {
        var controller :ResultViewController
       controller = self.storyboard?.instantiateViewController(withIdentifier: "resultVC") as! ResultViewController
        controller.userChoice = throwShape(sender as! UIButton)
        
        present(controller, animated: true, completion: nil)
        
    }
    
    @IBAction func paperBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "resultSegue", sender: sender)
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue"{
        var controller = segue.destination as! ResultViewController
        controller.userChoice = throwShape(sender as! UIButton)

            }
}
    func throwShape(_ sender: UIButton) -> Shape {
        let shape = sender.title(for: UIControlState())!
        return Shape(rawValue: shape)!
    }
}

