//
//  ListProtocol.swift
//  VIP
//
//  Created by Pavel Yeshchyk on 3/18/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

protocol ListWireListenerProtocol {

    func presentAddView()
}

protocol ListWireProtocol:WireProtocol {

    var addWire: AddWireProtocol? { get set }
    var listPresenter: ListPresenter { get set}
    var listWireListener:ListWireListenerProtocol? { get set}
    func addNewEntry()

    func reloadDataIfNeed()
}

protocol ListPresenterProtocol {

    var userInterface: ListViewProtocol? { get set }
    var wireframe: ListWireProtocol? { get set }
    
    func numberOfDetails()->Int
    func detailAtIndex(index:Int)->Todos
}

protocol ListViewProtocol {

    var eventHandler: ListViewEventHandler? { get set }
    var presenter:ListPresenterProtocol? { get set }
    func reloadDataIfNeed()

}

protocol ListViewEventHandler {

    func addNewEntry()
}