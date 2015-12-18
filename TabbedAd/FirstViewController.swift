//
//  FirstViewController.swift
//  TabbedAd
//
//  Created by Ahmed Khedr on 12/18/15.
//  Copyright © 2015 Ahmed Khedr. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var products = [
        "iPhone", "iPad", "iPod", "MacBook Pro", "iMac", "Macbook Air", "Mac Pro", "iPad Pro", "Mac TV", "iPad 2", "iPad mini", "Apple Watch", "Mac mini"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        title = "First View Controller"
        
        // NOT IMPLEMENTED
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleAdActionWillBegin", name: BannerViewActionWillBegin, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleAdActionDidFinish", name: BannerViewActionDidFinish, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension FirstViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath)
        cell.textLabel!.text = products[indexPath.row]
        
        return cell
    }
}

extension FirstViewController: UITableViewDelegate {
    
    
}

