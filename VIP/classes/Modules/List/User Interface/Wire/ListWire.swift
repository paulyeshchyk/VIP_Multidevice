//
//  ListWire.swift
//  VIP
//
//  Created by Pavel Yeshchyk on 3/18/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class ListWire: NSObject, ListWireProtocol {

    var listViewController: ListViewController
    var listPresenter: ListPresenter
    var addWire: AddWireProtocol?
    var listWireListener:ListWireListenerProtocol?

    deinit {

        self.listPresenter.wireframe = nil
    }

    override init() {

        listViewController = ListViewController(nibName: "ListViewController", bundle: NSBundle.mainBundle())

        listPresenter = ListPresenter()
        listPresenter.userInterface = listViewController

        listViewController.eventHandler = listPresenter
        listViewController.presenter = listPresenter

        super.init()

        self.listPresenter.wireframe = self

    }

    func prepareViewController(completion: WirePreparationViewControllerBlock) {
        
        completion(vc:self.listViewController)
    }
    
    func addNewEntry() {
        
        self.listWireListener?.presentAddView()
    }

    func reloadDataIfNeed() {
        
        self.listViewController.reloadDataIfNeed()
    }
    
}
