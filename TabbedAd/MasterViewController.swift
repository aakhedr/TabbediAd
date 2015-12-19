//
//  MasterViewController.swift
//  TabbedAd
//
//  Created by Ahmed Khedr on 12/18/15.
//  Copyright © 2015 Ahmed Khedr. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let items = [
        "Item1", "Item2", "Item3", "Item4", "Item5", "Item6", "Item7", "Item8", "Item9", "Item10", "Item11", "Item12", "Item13"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Master view controller"
                
        tableView.dataSource = self
        tableView.delegate = self
        
        splitViewController?.preferredDisplayMode = UISplitViewControllerDisplayMode.AllVisible
        splitViewController?.delegate = self
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "splitSegue" {
            let detailController = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
            
            if let indexPath = tableView.indexPathForSelectedRow {
                detailController.item = items[indexPath.row]
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension MasterViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("splitTableCell", forIndexPath: indexPath)
        cell.textLabel!.text = items[indexPath.row]
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MasterViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("splitSegue", sender: self)
    }
}

extension MasterViewController: UISplitViewControllerDelegate {
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        return false
    }
}