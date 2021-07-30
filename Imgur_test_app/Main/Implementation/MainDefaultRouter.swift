//
//  MainDefaultRouter.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import Foundation
import UIKit

class MainDefaultRouter: MainRouter {
    
    weak var presenter: MainPresenter?
    weak var viewController: UIViewController?
    
    func showDetailsView(id: Int) {
        let detailViewController = DetailModule().build()
        detailViewController.modalPresentationStyle = .automatic
        self.viewController?.present(detailViewController, animated: true, completion: nil)
    }
    
}
