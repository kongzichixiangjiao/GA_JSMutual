//
//  ViewController.swift
//  GA_JSMutual
//
//  Created by houjianan on 16/5/9.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit
import JavaScriptCore

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let httpString = "https://www.baidu.com"
//        let httpUrl = NSURL(string: httpString)
//        let httpRequest = NSURLRequest(URL: httpUrl!)
//        webView.loadRequest(httpRequest)
        
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
        let str = (value == "left" ? "Right" : "Left") + "ViewController"
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

    func webViewDidFinishLoad(webView: UIWebView) {
        let context: JSContext = webView.valueForKeyPath("documentView.webView.mainFrame.javaScriptContext") as! JSContext
//        let alertJS = "alert('test js OC')"
//        context.evaluateScript(alertJS)
        
//        context[@"test1"] = ^() {
//            NSArray *args = [JSContext currentArguments];
//            for (id obj in args) {
//                NSLog(@"%@",obj);
//            }
//        };
        
        let jsFunctStr = "test1('参数1')"
        context.evaluateScript(jsFunctStr)
        let jsFunctStr1 = "test1('参数a','参数b')"
        context.evaluateScript(jsFunctStr1)
        
//        //Swift
//        let simplifyString: @convention(block) () -> () = { input in
//            let args = JSContext.currentArguments()
//            print(args)
//            for arg in args {
//                print(arg)
//            }
//        }
//        context.setObject(unsafeBitCast(simplifyString, AnyObject.self), forKeyedSubscript: "test1")
//        print(context.evaluateScript("test1"))
        
        //Swift
        let simplifyString: @convention(block) String -> String = { input in
            let mutableString = NSMutableString(string: input) as CFMutableStringRef
            CFStringTransform(mutableString, nil, kCFStringTransformToLatin, Bool())
            CFStringTransform(mutableString, nil, kCFStringTransformStripCombiningMarks, Bool())
            print(mutableString)
            return mutableString as String
        }
        print(simplifyString)
        context.setObject(unsafeBitCast(simplifyString, AnyObject.self), forKeyedSubscript: "simplifyString")
        print(context.evaluateScript("simplifyString('?????!')"))
        
        
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print("error", error)
    }
    
}

