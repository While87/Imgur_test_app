//
//  DetailView.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import Foundation

protocol DetailView: AnyObject {
    var presenter: DetailPresenter? { get set }
}
