//
//  AddPresenter.swift
//  VIP
//
//  Created by Pavel Yeshchyk on 3/18/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class AddPresenter: NSObject, AddPresenterProtocol, AddEventHandlerProtocol {

    var addWire: AddWireProtocol?
    var addView: AddViewProtocol?
    var addInteractor: AddInteractorProtocol?

    func saveEntry(name: String?) {

        guard let addInteractor = self.addInteractor else {

            return
        }
        addInteractor.saveItem(name)
    }

    func didEndEditingName(text: String?) {

    }
    
    func dataHasBeenAdded() {
        
        guard let addWire = self.addWire else {
            
            return
        }
        addWire.dismissAddview()
    }
}


