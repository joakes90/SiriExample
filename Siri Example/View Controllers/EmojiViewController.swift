//
//  EmojiViewController.swift
//  Siri Example
//
//  Created by Justin Oakes on 9/10/18.
//  Copyright © 2018 Justin Oakes. All rights reserved.
//

import UIKit

class EmojiViewController: UIViewController {

    
    @IBOutlet weak var emojiLabel: UILabel!
    var color: UIColor?
    var fruit: Fruit?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emojiLabel.text = fruit?.rawValue
        view.backgroundColor = color

        // Siri specific code
        let userActivity = NSUserActivity(activityType: "colorFruit")
        userActivity.title = "View \(getColorName(color: color)) \(getFruitName(fruit: fruit))"
        userActivity.userInfo = ["color" : getColorName(color: color),
                                 "fruit" : fruit?.rawValue as Any]
        userActivity.requiredUserInfoKeys = ["color", "fruit"]
        userActivity.isEligibleForSearch = true
        userActivity.isEligibleForPrediction = true
        userActivity.persistentIdentifier = "\(getColorName(color: color))\(getFruitName(fruit: fruit))"
        // This property only works in WWDC demos. Does not appear anywhere else
        //        userActivity.suggestedInvocationPhrase = "Show me a Thing"
        self.userActivity = userActivity

    }

    func getColorName(color: UIColor?) -> String {
        switch color {
        case #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1):
            return "Red"
        case #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1):
            return "Green"
        case #colorLiteral(red: 0, green: 0, blue: 1, alpha: 1):
            return "Blue"
        case #colorLiteral(red: 1, green: 1, blue: 0, alpha: 1):
            return "Yellow"
        default:
            return ""
        }
    }

    func getFruitName(fruit: Fruit?) -> String {
        switch fruit {
        case .🍎?:
            return "Apple"
        case .🍒?:
            return "Cherry"
        case .🍌?:
            return "Banana"
        case .🥑?:
            return "Avocado"
        case .none:
            return ""
        }
    }

    @IBAction func dismissView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
