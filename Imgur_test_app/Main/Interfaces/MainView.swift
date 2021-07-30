//
//  MainView.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import Foundation

protocol MainView: AnyObject {
    var presenter: MainPresenter? { get set }
    
    func updateCollection(with gallery: [String])
    func updateImage(with data: Data)
    func updateError(with error: String)
}
