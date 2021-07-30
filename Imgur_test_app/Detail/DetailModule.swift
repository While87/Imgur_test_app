//
//  DetailModule.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import Foundation
import UIKit

class DetailModule {
    
    func build() -> UIViewController {
        let view = UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "Detail") as! DetailDefaultView
        let interactor = DetailDefaultInteractor()
        let presenter = DetailDefaultPresenter()
        let router = DetailDefaultRouter()
        
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
