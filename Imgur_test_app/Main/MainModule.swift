//
//  MainModule.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import Foundation
import UIKit

class MainModule {
    
    func build() -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Main") as! MainDefaultView
        let interactor = MainDefaultInteractor()
        let presenter = MainDefaultPresenter()
        let router = MainDefaultRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.presenter = presenter
        router.viewController = view
        
        return view
    }
}
