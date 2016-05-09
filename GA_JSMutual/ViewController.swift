//
//  ViewController.swift
//  GA_JSMutual
//
//  Created by houjianan on 16/5/9.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(childViewControllers)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "leftAction:", name: "left", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "rightAction:", name: "right", object: nil)
    }
    
    func rightAction(notifycation: NSNotification) {
        print(notifycation.object!["key"])
        push(notifycation.object!["key"] as! String)
    }
    
    func leftAction(notifycation: NSNotification) {
        print(notifycation.object!["key"])
        push(notifycation.object!["key"] as! String)
    }
    
    func push(value: String) {
        let str = (value == "Left" ? "Right" : "Left") + "ViewController"
        let storyboard = UIStoryboard(name:"Main", bundle:nil)
        let newController = storyboard.instantiateViewControllerWithIdentifier(str)
        let oldController = childViewControllers.last!
        
        oldController.willMoveToParentViewController(nil)
        addChildViewController(newController)
        newController.view.frame = oldController.view.frame
        
        transitionFromViewController(oldController, toViewController: newController, duration: 0.3, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: nil, completion: { (finished) -> Void in
            oldController.removeFromParentViewController()
            newController.didMoveToParentViewController(self)
        })
    }

 
    
}

