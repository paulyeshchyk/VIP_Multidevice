//
//  AppWireframe.swift
//  VIP
//
//  Created by Pavel Yeshchyk on 3/18/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit


class AppWireframeIPhone: NSObject,AppWireFrameProtocol, ListWireListenerProtocol, AddWireListener {
    
    var listWire:ListWireProtocol
    var addWire:AddWireProtocol
    var rootWindow:UIWindow

    var rootNavigationViewController:UINavigationController?
    
    func findOrCreateContainer()->UIViewController {
    
        guard let root = rootNavigationViewController else {
            
            let newRoot = UINavigationController(rootViewController: UIViewController())
            self.rootWindow.rootViewController = newRoot
            self.rootWindow.makeKeyAndVisible()
            self.rootNavigationViewController = newRoot
            
            return newRoot
        }
        return root
    }

    
    required init(window:UIWindow) {
        
        rootWindow = window
        
        listWire = ListWire()
        addWire = AddWire()
        
        super.init()
        
        self.listWire.listWireListener = self
        self.addWire.addWireListener = self
    }
    
    
    func launch() {

        self.listWire.prepareViewController({ (vc) -> () in
            
            self.listWire.reloadDataIfNeed()
            guard let container = self.findOrCreateContainer() as? UINavigationController else {

                return
            }

            container.viewControllers = [vc]
        })
    }
    
    //MARK: - AddWireListener
    func dataHasBeenAdded() {
        
        self.rootNavigationViewController?.popViewControllerAnimated(true)
        
        self.listWire.reloadDataIfNeed()
    }

    //MARK:  - ListWireListenerProtocol
    func presentAddView(){
        
        self.addWire.prepareViewController { (vc) -> () in
            
            self.rootNavigationViewController?.pushViewController(vc, animated: true)
        }
    }
}
