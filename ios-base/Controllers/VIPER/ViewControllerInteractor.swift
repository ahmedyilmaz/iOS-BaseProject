//
//  ViewControllerInteractor.swift
//  ios-base
//
//  Created by Ahmet on 25.05.2022.
//  
//

import Foundation
import Networking
import Moya

class ViewControllerInteractor: ViewControllerInteractorInputDelegate {
    weak var presenter: ViewControllerInteractorOutputDelegate?

    let provider: MoyaProvider<Api>
    public init(_ provider: MoyaProvider<Api>?) {
        let authPlugin = AccessTokenPlugin(tokenClosure: UserDefaults.standard.string(forKey: "token") ?? "")
        self.provider = provider ?? MoyaProvider<Api>(plugins: [authPlugin, NetworkLoggerPlugin(verbose: true)])
    }
}
