//
//  AppDelegate.swift
//  StCecelias
//
//  Created by Colin Gormley on 20/05/2016.
//  Copyright © 2016 Edina. All rights reserved.
//

import UIKit
import DATAStack

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var dataStack: DATAStack = {
        let dataStack = DATAStack(modelName: "St_Cecelias")
        
        return dataStack
    }()
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.createCollections()
        return true
    }
    
    func createCollections() {
        self.dataStack.performInNewBackgroundContext { backgroundContext in
            
            let entity = NSEntityDescription.entityForName(Constants.Entity.collection, inManagedObjectContext: backgroundContext)!
            
            let collections: [[String:Any]] = [
                [
                    "name" : "Andreas Hartmann-Virnich Collection",
                    "id" : "1",
                    "desc" : ""
                ],
                [
                    "name" : "Blades Collection",
                    "id" : "2",
                    "desc" : ""
                ],
                [
                    "name" : "C.H. Brackenbury Memorial Collection",
                    "id" : "3",
                    "desc" : ""
                ],
                [
                    "name" : "Farmer Collection",
                    "id" : "4",
                    "desc" : ""
                ],
                [
                    "name" : "Frank Tomes Collection",
                    "id" : "5",
                    "desc" : ""
                ],
                [
                    "name" : "Galpin Society Collection",
                    "id" : "6",
                    "desc" : ""
                ],
                [
                    "name" : "Glen Collection",
                    "id" : "7",
                    "desc" : ""
                ],
                [
                    "name" : "Handling Collection",
                    "id" : "9",
                    "desc" : ""
                ],
                [
                    "name" : "John Donaldson Collection",
                    "id" : "10",
                    "desc" : ""
                ],
                [
                    "name" : "Kilravock Castle Collection",
                    "id" : "11",
                    "desc" : ""
                ],
                [
                    "name" : "Langwill Collection",
                    "id" : "12",
                    "desc" : ""
                ],
                [
                    "name" : "Macaulay Collection",
                    "id" : "13",
                    "desc" : ""
                ],
                [
                    "name" : "Mickleburgh Collection",
                    "id" : "14",
                    "desc" : ""
                ],
                [
                    "name" : "MIMEd",
                    "id" : "15",
                    "desc" : ""
                ],
                [
                    "name" : "Object Lessons",
                    "id" : "16",
                    "desc" : ""
                ],
                [
                    "name" : "Raymond Russell Collection",
                    "id" : "17",
                    "desc" : ""
                ],
                [
                    "name" : "Reid Collection",
                    "id" : "18",
                    "desc" : ""
                ],
                [
                    "name" : "Rendall Collection",
                    "id" : "19",
                    "desc" : ""
                ],
                [
                    "name" : "Rodger Mirrey Collection",
                    "id" : "20",
                    "desc" : ""
                ],
                [
                    "name" : "Ross Collection",
                    "id" : "21",
                    "desc" : ""
                ],
                [
                    "name" : "Shaw-Hellier Collection",
                    "id" : "22",
                    "desc" : ""
                ],
                [
                    "name" : "Sir Nicholas Shackleton Collection",
                    "id" : "23",
                    "desc" : ""
                ]
            ]
            
            self.createCollectionObjects(entity, backgroundContext: backgroundContext, collections: collections)
                   
            try! backgroundContext.save()
        }
    }
    
    
    func createCollectionObjects(entity: NSEntityDescription, backgroundContext: NSManagedObjectContext, collections: [[String:Any]]) {
        
        for collection in collections{
            let object = NSManagedObject(entity: entity, insertIntoManagedObjectContext: backgroundContext)
            object.setValue(collection["name"] as? String, forKey: "name")
            object.setValue(collection["id"] as? String, forKey: "id")
            object.setValue(collection["desc"] as? String, forKey: "desc")
        }
        
        
    }
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

// Allow all view controllers to access datastack
extension UIViewController {
    var dataStack:DATAStack {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).dataStack
    }
}

