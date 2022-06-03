//
//  ViewControllerPresenter.swift
//  ios-base
//
//  Created by Ahmet on 25.05.2022.
//  
//

import UIKit
class ViewControllerPresenter: ViewControllerPresenterDelegate {

    weak var view: ViewControllerDelegate?
    var interactor: ViewControllerInteractorInputDelegate?
    var router: ViewControllerRouterDelegate?

    func viewDidLoad() {

    }

    func dismiss() {
    	if let viewController = self.view as? UIViewController {
            self.router?.dismiss(view: viewController)
        }
    }
}

extension ViewControllerPresenter: ViewControllerInteractorOutputDelegate {

}