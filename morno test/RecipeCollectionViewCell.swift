//
//  RecipeCollectionViewCell.swift
//  morno test
//
//  Created by Harsh Topiwala on 2020-07-20.
//  Copyright © 2020 Harsh Topiwala. All rights reserved.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var interestTitle: UILabel!
    
    // calls method to update cell with information
    var recipe: Recipe! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        if let recipe = recipe {
            featuredImageView.image = recipe.featuredImage
            interestTitle.text = recipe.title
            backgroundColorView.backgroundColor = recipe.color
        } else {
            featuredImageView.image = nil
            interestTitle.text = nil
            backgroundColorView.backgroundColor = nil
            
        }
        
        backgroundColorView.layer.cornerRadius = 10.0
        backgroundColorView.layer.masksToBounds = true
        featuredImageView.layer.cornerRadius = 10.0
        featuredImageView.layer.masksToBounds = true
        
    }
}
