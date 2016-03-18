//
//  AddViewController.swift
//  VIP
//
//  Created by Pavel Yeshchyk on 3/18/16.
//  Copyright © 2016 NoName. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, AddViewProtocol, UITextFieldDelegate {

    var eventHandler: AddEventHandlerProtocol?
    @IBOutlet var textField: UITextField?

    override func viewDidLoad() {

        super.viewDidLoad()

        let saveItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: Selector("didTapSaveButton"))
        navigationItem.rightBarButtonItem = saveItem
    }


    func didTapSaveButton() {

        guard let eventHandler = self.eventHandler else {

            return
        }

        eventHandler.saveEntry(self.textField?.text ?? "")
    }

    //MARK: - UITextFieldDelegate

    func textFieldShouldReturn(textField: UITextField) -> Bool {

        textField.resignFirstResponder()
        return true
    }


    func textFieldDidEndEditing(textField: UITextField) {

        guard let eventHandler = self.eventHandler else{

            return
        }

        eventHandler.didEndEditingName(textField.text)
    }


}
