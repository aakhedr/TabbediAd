//
//  BannerViewManager.swift
//  TabbedAd
//
//  Created by Ahmed Khedr on 12/18/15.
//  Copyright © 2015 Ahmed Khedr. All rights reserved.
//

import UIKit
import iAd

// MARK: -Constants
let BannerViewActionWillBegin: String = "BannerViewActionWillBegin"
let BannerViewActionDidFinish: String = "BannerViewActionDidFinish"

class BannerViewManager: NSObject, ADBannerViewDelegate {
    
    // MARK: -Shared instance
    static let sharedInstance = BannerViewManager()
    
    // MARK: -Properties
    var bannerView: ADBannerView!
    var bannerViewControllers: NSMutableSet!
    
    // MARK: -Initializor
    override init() {
        super.init()
        
        bannerView = ADBannerView(adType: .Banner)
        bannerViewControllers = NSMutableSet()
        bannerView.delegate = self
    }
    
    // MARK: -
    
    func addBannerViewController(controller: BannerViewController) {
        bannerViewControllers.addObject(controller)
    }
    
    func removeBannerViewController(controller: BannerViewController) {
        bannerViewControllers.removeObject(controller)
    }
    
    // MARK: -Ad banner view delegate methods
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        NSLog("bannerViewDidLoadAd")
        
        for bannerViewController in bannerViewControllers {
            (bannerViewController as! BannerViewController).updateLayout()
        }
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        NSLog("didFailToReceiveAdWithError %@", error);
        
        for bannerViewController in bannerViewControllers {
            (bannerViewController as! BannerViewController).updateLayout()
        }
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        NSNotificationCenter.defaultCenter().postNotificationName(BannerViewActionWillBegin, object: self)
        return true
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        NSNotificationCenter.defaultCenter().postNotificationName(BannerViewActionDidFinish, object: self)
    }
    
    // Not implemented in iAdSuite
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        
    }
}
