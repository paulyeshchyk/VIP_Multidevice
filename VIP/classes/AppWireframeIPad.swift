//
//  AppWireframe.swift
//  VIP
//
//  Created by Pavel Yeshchyk on 3/18/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit


class AppWireframeIPad: NSObject,AppWireFrameProtocol, ListWireListenerProtocol, AddWireListener {
    
    var listWire:ListWireProtocol
    var addWire:AddWireProtocol
    var rootWindow:UIWindow

    var rootSplitViewController:UISplitViewController?
    
    func findOrCreateContainer(views:[UIViewController])->UIViewController {
        
        guard let root = rootSplitViewController else {
            
            let newRoot = UISplitViewController()
            newRoot.viewControllers = views
            self.rootWindow.rootViewController = newRoot
            self.rootWindow.makeKeyAndVisible()
            self.rootSplitViewController = newRoot
            
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
            
            let nc = UINavigationController(rootViewController: vc)
            self.masterView = nc
        })
        
        self.addWire.prepareViewController({ (vc) -> () in
            
            let nc = UINavigationController(rootViewController: vc)
            self.detailView = nc
        })
    }
    
    //MARK: - AddWireListener
    func dataHasBeenAdded() {
        
        self.listWire.reloadDataIfNeed()
    }

    //MARK:  - ListWireListenerProtocol
    func presentAddView(){
        
        self.addWire.prepareViewController { (vc) -> () in

            self.detailView = vc
        }
    }
    
    
    var masterView:UIViewController? {
        
        didSet {
            
            self.invalidateSplit()
        }
    }
    var detailView:UIViewController? {
        
        didSet {
            
            self.invalidateSplit()
        }
    }
    
    func invalidateSplit() {
        
        guard let detailView = self.detailView else {
            return
        }
        
        guard let masterView = self.masterView else {
            return
        }
        
        findOrCreateContainer([masterView, detailView])
    }
    
    
    
}
