//
//  ViewControllerRouter.swift
//  ios-base
//
//  Created by Ahmet on 25.05.2022.
//  
//

import UIKit

class ViewControllerRouter: ViewControllerRouterDelegate {

    static let storyboard = UIStoryboard(name: "ViewController", bundle: Bundle.main)

    static func createViewControllerViewController(_ view: ViewControllerView?) -> UIViewController {
        guard let vc = view ?? storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewControllerView else {
            return UIViewController()
        }

        let presenter: ViewControllerPresenterDelegate & ViewControllerInteractorOutputDelegate = ViewControllerPresenter()
        let interactor: ViewControllerInteractorInputDelegate  = ViewControllerInteractor(nil)
        let router: ViewControllerRouterDelegate = ViewControllerRouter()

        vc.presenter = presenter
        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return vc
    }

    func dismiss(view: UIViewController) {
        view.dismiss(animated: true, completion: nil)
    }
}
