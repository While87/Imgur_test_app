//
//  DetailDefaultRouter.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import Foundation
import UIKit

class DetailDefaultRouter: DetailRouter {

    weak var presenter: DetailPresenter?
    weak var viewController: UIViewController?
    
    func showDetail() {
        let viewController = DetailModule().build()
        viewController.modalPresentationStyle = .automatic
        self.viewController?.present(viewController, animated: true, completion: nil)
    }    
}
