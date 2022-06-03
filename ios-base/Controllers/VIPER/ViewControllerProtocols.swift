//
//  ViewControllerProtocols.swift
//  ios-base
//
//  Created by Ahmet on 25.05.2022.
//  
//

import UIKit

// MARK: - View
protocol ViewControllerDelegate: class {
    func error(notification: Notification)
}

// MARK: - Interactor
protocol ViewControllerInteractorInputDelegate: class {
    var presenter: ViewControllerInteractorOutputDelegate? { get set }
}

protocol ViewControllerInteractorOutputDelegate: class {
}

// MARK: - Presenter
protocol ViewControllerPresenterDelegate: class {
    var view: ViewControllerDelegate? { get set }
    var interactor: ViewControllerInteractorInputDelegate? { get set }
    var router: ViewControllerRouterDelegate? { get set }

    func viewDidLoad()
    func dismiss()
}

// MARK: - Router
protocol ViewControllerRouterDelegate: class {
    static func createViewControllerViewController(_ view: ViewControllerView?) -> UIViewController
    func dismiss(view: UIViewController)
}
