//
//  SouceViewController.swift
//  GA_JSMutual
//
//  Created by houjianan on 16/5/10.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class SouceViewController: UIViewController, GoalViewControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var object = Object()
    var objectStruct = ObjectStruct()
    override func viewDidLoad() {
        super.viewDidLoad()
        object.title = "SouceViewController"
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        objectStruct.title = "SouceViewController"
        let s = UIStoryboard.init(name: "Main", bundle: nil)
        let toVC = s.instantiateViewControllerWithIdentifier("GoalViewController") as! GoalViewController
        toVC.object = object
        toVC.objectStruct = objectStruct
        toVC.delegate = self
        self.navigationController?.pushViewController(toVC, animated: true)
    }
    
    func back(object: Object, objectStruct: ObjectStruct) {
        print("back", object.title, objectStruct.title)
        print(self.object.title, self.objectStruct.title)
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        cell?.textLabel?.text = object.title
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
}
