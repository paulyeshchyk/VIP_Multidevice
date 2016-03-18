//
//  Todos.swift
//  VIP
//
//  Created by Pavel Yeshchyk on 3/18/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class Todos: NSObject {

    var name:String
    var ident:Double
    
    required init (aname:String) {
        
        name = aname
        ident = NSDate.timeIntervalSinceReferenceDate()
        
        super.init()
    }
    
}
