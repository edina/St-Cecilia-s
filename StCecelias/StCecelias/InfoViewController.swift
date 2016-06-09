//
//  InfoViewController.swift
//  StCecelias
//
//  Created by Colin Gormley on 09/06/2016.
//  Copyright © 2016 Edina. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL (string: "http://collections.ed.ac.uk/mimed/search/*/Collection:%22mimed%7C%7C%7CMIMEd%22")
        let requestObj = NSURLRequest(URL: url!);
        self.webView.loadRequest(requestObj)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
