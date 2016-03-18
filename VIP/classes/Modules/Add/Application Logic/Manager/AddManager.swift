//
//  AddManager.swift
//  VIP
//
//  Created by Pavel Yeshchyk on 3/18/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class AddManager: NSObject, AddManagerProtocol {

    func addItem(todos: Todos, onSave:OnSave) {
       
        let context = CoreDataProvider.sharedInstance().mainManagedObjectContext
        context.performBlock { () -> Void in
            
            let predicate = NSPredicate(format: "ident == %f", argumentArray: [todos.ident])
            
            let sample = Sample.findOrCreateObjectWithPredicate(predicate, inManagedObjectContext: context)
            sample.name = todos.name
            sample.ident = NSDecimalNumber(double: todos.ident)

            if (context.hasChanges) {

                do {
                    
                    try context.save()
                    
                    NSThread.executeOnMainThread({ () -> Void in
                        
                        onSave()
                    })
                }catch {
                    
                }
            }
        }
        
    }
    
}
