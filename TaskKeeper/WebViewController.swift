//
//  WebViewController.swift
//  TaskKeeper
//
//  Created by Dakota Brown on 12/12/16.
//  Copyright © 2016 Dakota Brown. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    //Outlet created for webView and my website is loaded with NSURL
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL (string: "https://mason.gmu.edu/~dbrown32/index.html");
        let requestObj = NSURLRequest(url: url! as URL);
        webView.loadRequest(requestObj as URLRequest);

        // Do any additional setup after loading the view.
    }

 
}
