//
//  BannerViewController.swift
//  TabbedAd
//
//  Created by Ahmed Khedr on 12/18/15.
//  Copyright © 2015 Ahmed Khedr. All rights reserved.
//

import UIKit
import iAd

class BannerViewController: UIViewController {
    
    private var contentController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BannerViewManager.sharedInstance.addBannerViewController(self)
        let children = self.childViewControllers
        assert(children.count != 0)
        
        contentController = children.first
        title = contentController.title
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        view.addSubview(BannerViewManager.sharedInstance.bannerView)
    }
    
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return contentController.preferredInterfaceOrientationForPresentation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var contentFrame = view.bounds
        var bannerFrame = CGRectZero
        
        let bannerView = BannerViewManager.sharedInstance.bannerView
        bannerFrame.size = bannerView.sizeThatFits(contentFrame.size)
        
        if bannerView.bannerLoaded {
            contentFrame.size.height -= (bannerFrame.size.height + contentController.tabBarController!.tabBar.frame.height)
            bannerFrame.origin.y = contentFrame.size.height
        } else {
            bannerFrame.origin.y = contentFrame.size.height
        }
        contentController.view.frame = contentFrame

        if isViewLoaded() && view.window != nil {
            view.addSubview(bannerView)
            bannerView.frame = bannerFrame
            view.layoutSubviews()
        }
    }
    
    func updateLayout() {
        UIView.animateWithDuration(0.25, animations: {
            self.view.setNeedsDisplay()
            self.view.layoutIfNeeded()
        })
    }
}