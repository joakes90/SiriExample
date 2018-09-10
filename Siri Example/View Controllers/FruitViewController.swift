//
//  FruitViewController.swift
//  Siri Example
//
//  Created by Justin Oakes on 9/10/18.
//  Copyright © 2018 Justin Oakes. All rights reserved.
//

import UIKit

class FruitViewController: UIViewController {

    var fruit: Fruit?

    func displayColors(with fruit: Fruit) {
        self.fruit = fruit
        performSegue(withIdentifier: "fruitToColor", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let fruit = fruit,
            let destination = segue.destination as? ColorViewController else {
                return
        }
        destination.fruit = fruit
    }
    @IBAction func didTapApple(_ sender: Any) {
        displayColors(with: .🍎)
    }

    @IBAction func didTapCherry(_ sender: Any) {
        displayColors(with: .🍒)
    }

    @IBAction func didTapBanana(_ sender: Any) {
        displayColors(with: .🍌)
    }
    
    @IBAction func didTapAvocado(_ sender: Any) {
        displayColors(with: .🥑)
    }
}


enum Fruit: String {
    case 🍎
    case 🍒
    case 🍌
    case 🥑
}
