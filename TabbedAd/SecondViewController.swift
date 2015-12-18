//
//  SecondViewController.swift
//  TabbedAd
//
//  Created by Ahmed Khedr on 12/18/15.
//  Copyright © 2015 Ahmed Khedr. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Second View Controller"
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleAdActionWillBegin", name: BannerViewActionWillBegin, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleAdActionDidFinish", name: BannerViewActionDidFinish, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

