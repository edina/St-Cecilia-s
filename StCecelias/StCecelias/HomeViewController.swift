//
//  HomeViewController.swift
//  StCecelias
//
//  Created by Colin Gormley on 20/05/2016.
//  Copyright © 2016 Edina. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.proximityContentManager = ProximityContentManager(
//            beaconIDs: [
//                // TODO: replace with UUIDs, majors and minors of your own beacons
//                BeaconID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D", major: 1, minor: 1),
//                BeaconID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D", major: 2, minor: 2),
//                BeaconID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D", major: 3, minor: 3)
//            ],
//            beaconContentFactory: CachingContentFactory(beaconContentFactory: BeaconDetailsCloudFactory()))
//        self.proximityContentManager.delegate = self
//        self.proximityContentManager.startContentUpdates()
    }

    
    
    
    
    
//    func proximityContentManager(proximityContentManager: ProximityContentManager, didUpdateContent content: AnyObject?) {
//        self.activityIndicator?.stopAnimating()
//        self.activityIndicator?.removeFromSuperview()
//        
//        if let beaconDetails = content as? BeaconDetails {
//            self.view.backgroundColor = beaconDetails.backgroundColor
//            self.label.text = "You're in \(beaconDetails.beaconName)'s range!"
//            self.image.hidden = false
//        } else {
//            self.view.backgroundColor = BeaconDetails.neutralColor
//            self.label.text = "No beacons in range."
//            self.image.hidden = true
//        }
//    }
    
    
    
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
