//
//  DetailInteractor.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import Foundation

protocol DetailInteractor {
    var presenter: DetailPresenter? { get set }
    
    func getComments(id: String)
}
