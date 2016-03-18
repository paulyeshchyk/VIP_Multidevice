//
//  ListViewController.swift
//  VIP
//
//  Created by Pavel Yeshchyk on 3/18/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ListViewProtocol {

    var eventHandler: ListViewEventHandler?
    var presenter:ListPresenterProtocol?
    
    @IBOutlet var tableView:UITableView?

    override func viewDidLoad() {

        super.viewDidLoad()

        
        self.tableView?.registerNib(UINib(nibName: "ListTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "ListTableViewCell")
        let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("didTapAddButton"))
        navigationItem.rightBarButtonItem = addItem
    }

    func didTapAddButton() {

        guard let eventHandler = self.eventHandler else {

            return
        }

        eventHandler.addNewEntry()
    }

    
    func reloadDataIfNeed() {
        
        self.tableView?.reloadData()
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell =  UITableViewCell(style: .Default, reuseIdentifier: "ListTableViewCell")
        let detail = self.presenter?.detailAtIndex(indexPath.row)
        cell.textLabel?.text = detail?.name
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return (self.presenter?.numberOfDetails())!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

//        let detail = self.presenter?.detailAtIndex(indexPath.row)
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
    }
}
