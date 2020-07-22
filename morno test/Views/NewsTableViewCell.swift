//
//  NewsTableViewCell.swift
//  morno test
//
//  Created by Harsh Topiwala on 2020-07-22.
//  Copyright © 2020 Harsh Topiwala. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var headline: UILabel!
    
    var news: News! {
        didSet {
            updateUI()
        }
    }
    
    
    func updateUI() {
        
        thumbnailImageView.layer.cornerRadius = 8.0
        thumbnailImageView.layer.masksToBounds = true
        // setting the image
        thumbnailImageView.image = UIImage(named: news.thumbnailFileName)
        headline.text = news.authorName
    }
    
    
}
