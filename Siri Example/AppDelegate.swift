//
//  AppDelegate.swift
//  Siri Example
//
//  Created by Justin Oakes on 9/10/18.
//  Copyright © 2018 Justin Oakes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)

        guard userActivity.activityType == "colorFruit",
        let emojiView = storyBoard.instantiateViewController(withIdentifier: "emojiView") as? EmojiViewController,
            let color = userActivity.userInfo?["color"] as? String,
            let fruit = userActivity.userInfo?["fruit"] as? String else {
            return false
        }

        emojiView.color = getColorForString(color: color)
        emojiView.fruit = Fruit(rawValue: fruit) //getFruitForString(fruit: fruit)
        application.keyWindow?.rootViewController?.present(emojiView, animated: true, completion: nil)
        return true
    }

    func getFruitForString(fruit: String) -> Fruit {
        switch fruit {
        case "Apple":
            return .🍎
        case "Cherry":
            return .🍒
        case "Banana":
            return .🍌
        case "Avocado":
            return .🥑
        default:
            return .🍎
        }
    }

    func getColorForString(color: String) -> UIColor {
        switch color {
        case "Red":
            return #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        case "Green":
            return #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
        case "Blue":
            return #colorLiteral(red: 0, green: 0, blue: 1, alpha: 1)
        case "Yellow":
            return #colorLiteral(red: 1, green: 1, blue: 0, alpha: 1)
        default:
            return #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        }
    }
}

