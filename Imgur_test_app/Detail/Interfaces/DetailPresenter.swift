//
//  DetailPresenter.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import Foundation

protocol DetailPresenter: AnyObject {
    var view: DetailView? { get set }
    var interactor: DetailInteractor? { get set }
    var router: DetailRouter? { get set }
    
    func interactorDidFetchComments(with result: Result<AnyObject, Error>)
    func getComments(id: String)
    func updateImageData(data: AnyObject)
}
