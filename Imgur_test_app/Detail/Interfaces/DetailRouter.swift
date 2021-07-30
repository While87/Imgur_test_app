//
//  DetailRouter.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import Foundation
import UIKit

protocol DetailRouter: AnyObject {
    var presenter: DetailPresenter? { get set }
    var viewController: UIViewController? { get set }
    func showDetail()
}
