//
//  LeftViewController.swift
//  GA_JSMutual
//
//  Created by houjianan on 16/5/9.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print(childViewControllers)
        NSNotificationCenter.defaultCenter().postNotificationName("left", object: ["key" : "left"])
    }
}
