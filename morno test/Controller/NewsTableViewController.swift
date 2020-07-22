//
//  NewsTableViewController.swift
//  morno test
//
//  Created by Harsh Topiwala on 2020-07-21.
//  Copyright © 2020 Harsh Topiwala. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var news: [News] = News.fetchNews()
    
    // UITableViewDataSource
    
    // need to have this when overriding uitableviewcontroller
    // specifies the number of cells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    // tells the table to load a cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // indexpath contains a section, and a row e.g Indexpath : [section, row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        
        let new = news[indexPath.row]
        cell.news = new
        return cell
        
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}
