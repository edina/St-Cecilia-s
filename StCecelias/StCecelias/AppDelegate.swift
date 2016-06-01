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
                    "desc" : "",
                    "count" : 22,
                    "items" : [
                        [
                            "id": 1,
                            "name": "item1Name",
                            "desc": "desc1"
                        ],
                        [
                            "id": 2,
                            "name": "item12Name",
                            "desc": "desc12"
                        ]
                    ]
                ],
                [
                    "name" : "Blades Collection",
                    "id" : "2",
                    "desc" : "",
                    "count" : 156,
                    "items" : [
                        [
                            "id": 3,
                            "name": "item2Name",
                            "desc": "desc1"
                        ],
                        [
                            "id": 4,
                            "name": "item2Name",
                            "desc": "desc2"
                        ]
                    ]
                ],
                [
                    "name" : "C.H. Brackenbury Memorial Collection",
                    "id" : "3",
                    "desc" : "",
                    "count" : 192
                ],
                [
                    "name" : "Farmer Collection",
                    "id" : "4",
                    "desc" : "",
                    "count" : 1
                ],
                [
                    "name" : "Frank Tomes Collection",
                    "id" : "5",
                    "desc" : "",
                    "count" : 63
                ],
                [
                    "name" : "Galpin Society Collection",
                    "id" : "6",
                    "desc" : "",
                    "count" : 8
                ],
                [
                    "name" : "Glen Collection",
                    "id" : "7",
                    "desc" : "",
                    "count" : 237
                ],
                [
                    "name" : "Handling Collection",
                    "id" : "9",
                    "desc" : "",
                    "count" : 15
                ],
                [
                    "name" : "John Donaldson Collection",
                    "id" : "10",
                    "desc" : "",
                    "count" : 3
                ],
                [
                    "name" : "Kilravock Castle Collection",
                    "id" : "11",
                    "desc" : "",
                    "count" : 2
                ],
                [
                    "name" : "Langwill Collection",
                    "id" : "12",
                    "desc" : "",
                    "count" : 10
                ],
                [
                    "name" : "Macaulay Collection",
                    "id" : "13",
                    "desc" : "",
                    "count" : 54
                ],
                [
                    "name" : "Mickleburgh Collection",
                    "id" : "14",
                    "desc" : "",
                    "count" : 73
                ],
                [
                    "name" : "MIMEd",
                    "id" : "15",
                    "desc" : "",
                    "count" : 5075
                ],
                [
                    "name" : "Object Lessons",
                    "id" : "16",
                    "desc" : "",
                    "count" : 6
                ],
                [
                    "name" : "Raymond Russell Collection",
                    "id" : "17",
                    "desc" : "",
                    "count" : 21
                ],
                [
                    "name" : "Reid Collection",
                    "id" : "18",
                    "desc" : "",
                    "count" : 231
                ],
                [
                    "name" : "Rendall Collection",
                    "id" : "19",
                    "desc" : "",
                    "count" : 119
                ],
                [
                    "name" : "Rodger Mirrey Collection",
                    "id" : "20",
                    "desc" : "",
                    "count" : 23
                ],
                [
                    "name" : "Ross Collection",
                    "id" : "21",
                    "desc" : "",
                    "count" : 208
                ],
                [
                    "name" : "Shaw-Hellier Collection",
                    "id" : "22",
                    "desc" : "",
                    "count" : 54
                ],
                [
                    "name" : "Sir Nicholas Shackleton Collection",
                    "id" : "23",
                    "desc" : "",
                    "count" : 997
                ]
            ]
            
            self.createCollectionObjects(entity, backgroundContext: backgroundContext, collections: collections)
            
            try! backgroundContext.save()
        }
    }
    
    
    func createCollectionObjects(entity: NSEntityDescription, backgroundContext: NSManagedObjectContext, collections: [[String:Any]]) {
        
        
        let itemEntity = NSEntityDescription.entityForName(Constants.Entity.item, inManagedObjectContext: backgroundContext)!
        
        for collection in collections{
            let collectionObject = NSManagedObject(entity: entity, insertIntoManagedObjectContext: backgroundContext)
            collectionObject.setValue(collection["name"] as? String, forKey: "name")
            collectionObject.setValue(collection["id"] as? String, forKey: "id")
            collectionObject.setValue(collection["desc"] as? String, forKey: "desc")
            collectionObject.setValue(collection["count"] as? Int, forKey: "count")
            
            // Add any items to the collection
            if let items = collection["items"] as? [[String:NSObject]]{
                
                for item in items {
                    let itemObject = NSManagedObject(entity: itemEntity, insertIntoManagedObjectContext: backgroundContext)
                    
                    if let name = item["name"]{
                        itemObject.setValue(name, forKey: "name")
                    }
                    if let id = item["id"]{
                        itemObject.setValue(id, forKey: "id")
                    }
                    if let desc = item["desc"]{
                        itemObject.setValue(desc, forKey: "desc")
                    }
                                        
                    let manyRelation = collectionObject.mutableSetValueForKey("items")
                    manyRelation.addObject(itemObject)

                }
            }
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

