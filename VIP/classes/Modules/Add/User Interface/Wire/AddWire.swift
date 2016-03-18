//
//  AddWire.swift
//  VIP
//
//  Created by Pavel Yeshchyk on 3/18/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class AddWire: NSObject, AddWireProtocol {

    var addView: AddViewController
    var addPresenter: AddPresenter
    var addInteractor: AddInteractor
    var addNavigationController: UINavigationController?
    var addManager:AddManager
    var addWireListener:AddWireListener?

    deinit {
        
        addPresenter.addWire = nil
    }
    
    override init() {

        addView = AddViewController(nibName: "AddViewController", bundle: NSBundle.mainBundle())
        addPresenter = AddPresenter()
        addPresenter.addView = addView
        addView.eventHandler = addPresenter

        addInteractor = AddInteractor()
        addInteractor.addPresenter = addPresenter
        addPresenter.addInteractor = addInteractor
        
        addManager = AddManager()
        addInteractor.addManager = addManager

        super.init()

        addPresenter.addWire = self
    }

    func prepareViewController(completion: WirePreparationViewControllerBlock) {

        completion(vc: self.addView)
    }
    
    func dismissAddview() {

        guard let listener = self.addWireListener else {

            return
        }
        listener.dataHasBeenAdded()
    }

}
