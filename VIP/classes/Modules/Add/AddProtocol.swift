//
//  AddProtocol.swift
//  VIP
//
//  Created by Pavel Yeshchyk on 3/18/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

protocol AddWireListener {
    
    func dataHasBeenAdded()
}

protocol AddWireProtocol:WireProtocol {
 
    var addWireListener:AddWireListener? {get set}
    
    func dismissAddview()
}

protocol AddPresenterProtocol {

    var addView: AddViewProtocol? { get set }
    var addInteractor: AddInteractorProtocol? { get set }
    
    func dataHasBeenAdded()
}

protocol AddInteractorProtocol {

    var addManager:AddManagerProtocol? {get set}
    var addPresenter:AddPresenterProtocol? {get set}
    func saveItem(name: String?)
}

protocol AddViewProtocol {

    var eventHandler: AddEventHandlerProtocol? { get set }
}

protocol AddEventHandlerProtocol {

    func didEndEditingName(text: String?)

    func saveEntry(name: String?)
}

typealias OnSave = () -> ()
protocol AddManagerProtocol {
    
    func addItem(todos:Todos, onSave:OnSave)
}