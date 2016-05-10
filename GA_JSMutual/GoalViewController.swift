//
//  GoalViewController.swift
//  GA_JSMutual
//
//  Created by houjianan on 16/5/10.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

protocol GoalViewControllerDelegate {
    func back(object: Object, objectStruct: ObjectStruct)
}

class GoalViewController: UIViewController {

    var object: Object!
    var objectStruct: ObjectStruct!
    var delegate: GoalViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(object.title)
        print(objectStruct.title)
        object.title = "GoalViewController"
        objectStruct.title = "GoalViewController"
        print(object.title)
        print(objectStruct.title)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        delegate.back(object, objectStruct: objectStruct)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
