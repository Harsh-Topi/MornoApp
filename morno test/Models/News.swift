//
//  News.swift
//  morno test
//
//  Created by Harsh Topiwala on 2020-07-21.
//  Copyright © 2020 Harsh Topiwala. All rights reserved.
//

import Foundation

struct News {
    
    let authorName: String
    let imageFile: String
    let description: String
    let thumbnailFileName: String
    
    static func fetchNews() -> [News] {
        return [
            News(authorName: "Dingus", imageFile: "f1", description: "Chungus dingus", thumbnailFileName: "f1"),
            News(authorName: "Dungus", imageFile: "f1", description: "Chungus dingus", thumbnailFileName: "f1"),
            News(authorName: "Dangus", imageFile: "f1", description: "Chungus dingus", thumbnailFileName: "f1"),
            News(authorName: "Chungus", imageFile: "f1", description: "Chungus dingus", thumbnailFileName: "f1"),
            News(authorName: "Moscow", imageFile: "f1", description: "Chungus dingus", thumbnailFileName: "f1"),
        ]
    }
}
