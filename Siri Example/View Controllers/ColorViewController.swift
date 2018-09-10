//
//  ColorViewController.swift
//  Siri Example
//
//  Created by Justin Oakes on 9/10/18.
//  Copyright © 2018 Justin Oakes. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    var fruit: Fruit?
    var color: UIColor?

    func displayEmoji(with color: UIColor) {
        self.color = color
        performSegue(withIdentifier: "colorToEmoji", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let fruit = fruit,
        let color = color,
        let destination = segue.destination as? EmojiViewController else {
            return
        }
        destination.color = color
        destination.fruit = fruit
    }
    
    @IBAction func didTapRed(_ sender: Any) {
        displayEmoji(with: #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1))
    }

    @IBAction func didTapGreen(_ sender: Any) {
        displayEmoji(with: #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1))
    }

    @IBAction func didTapBlue(_ sender: Any) {
        displayEmoji(with: #colorLiteral(red: 0, green: 0, blue: 1, alpha: 1))
    }

    @IBAction func didTapYellow(_ sender: Any) {
        displayEmoji(with: #colorLiteral(red: 0.9994240403, green: 1, blue: 0, alpha: 1))
    }

}
