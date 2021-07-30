//
//  MainRouter.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import Foundation
import UIKit

protocol MainRouter: AnyObject {
    var presenter: MainPresenter? { get set }
    var viewController: UIViewController? { get set }
    
    func showDetailsView(id: Int)
}
