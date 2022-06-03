//
//  ViewControllerView.swift
//  ios-base
//
//  Created by Ahmet on 25.05.2022.
//  
//

import UIKit

class ViewControllerView: ViewController {
    var presenter: ViewControllerPresenterDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ViewController"
    }

}

extension ViewControllerView: ViewControllerDelegate {
    func error(notification: Notification) {

    }
}