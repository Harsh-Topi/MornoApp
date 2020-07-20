//
//  Recipe.swift
//  morno test
//
//  Created by Harsh Topiwala on 2020-07-20.
//  Copyright © 2020 Harsh Topiwala. All rights reserved.
//

import UIKit

class Recipe {
    var title = ""
    var featuredImage: UIImage
    var color: UIColor
    
    init(title: String, featuredImage: UIImage, color: UIColor) {
        self.title = title
        self.featuredImage = featuredImage
        self.color = color
    }
    
    static func fetchRecipes() -> [Recipe] {
        return [
            Recipe(title: "Dingus", featuredImage: UIImage(named: "f1")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue:80/255.0, alpha: 0.8)),
            Recipe(title: "Dangus", featuredImage: UIImage(named: "f1")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue:80/255.0, alpha: 0.8)),
            Recipe(title: "Dungus", featuredImage: UIImage(named: "f1")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue:80/255.0, alpha: 0.8))
        ]
    }
}



