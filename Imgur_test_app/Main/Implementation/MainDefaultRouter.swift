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
    
    func showDetailsView(data: AnyObject) {
        let detailViewController = DetailModule().build()
        let vc = detailViewController as! DetailDefaultView
        vc.presenter?.updateImageData(data: data)
        detailViewController.modalPresentationStyle = .automatic
        self.viewController?.present(detailViewController, animated: true, completion: nil)
    }
    
}
