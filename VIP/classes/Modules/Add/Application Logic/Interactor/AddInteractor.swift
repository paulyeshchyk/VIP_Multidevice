//
//  AddInteractor.swift
//  VIP
//
//  Created by Pavel Yeshchyk on 3/18/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class AddInteractor: NSObject, AddInteractorProtocol {

    var addManager:AddManagerProtocol?
    var addPresenter:AddPresenterProtocol?

    func saveItem(name: String?) {

        guard let manager = self.addManager else{
            
            return
        }
        
        let todos = Todos(aname: name ?? "")
        manager.addItem(todos) { () in
            
            guard let addPresenter = self.addPresenter else {
                
                return
            }
            
            addPresenter.dataHasBeenAdded()
        }
    }
}
