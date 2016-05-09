//
//  GA_WebViewController.swift
//  GA_JSMutual
//
//  Created by houjianan on 16/5/9.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit
import JavaScriptCore

class GA_WebViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let httpString = "https://www.baidu.com"
        let httpUrl = NSURL(string: httpString)
        let httpRequest = NSURLRequest(URL: httpUrl!)
        webView.loadRequest(httpRequest)
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
