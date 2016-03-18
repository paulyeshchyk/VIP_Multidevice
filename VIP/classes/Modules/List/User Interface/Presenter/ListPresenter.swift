//
//  ListPresenter.swift
//  VIP
//
//  Created by Pavel Yeshchyk on 3/18/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class ListPresenter: NSObject, ListPresenterProtocol, ListViewEventHandler {

    var userInterface: ListViewProtocol?
    var wireframe: ListWireProtocol?


    func addNewEntry() {

        guard let wireframe = self.wireframe else {

            return
        }

        wireframe.addNewEntry()
    }

    
    func numberOfDetails()->Int {
        
        return 0
    }
    
    func detailAtIndex(index:Int)->Todos {
        
        return Todos(aname: "c")
    }

}
