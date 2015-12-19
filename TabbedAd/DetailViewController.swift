//
//  DetailViewController.swift
//  TabbedAd
//
//  Created by Ahmed Khedr on 12/18/15.
//  Copyright © 2015 Ahmed Khedr. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var itemLabel: UILabel!
    var item: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemLabel.text = item
        title = "Detail view controller"
        
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
        navigationItem.leftItemsSupplementBackButton = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
