//
//  MainPresenter.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import Foundation

protocol MainPresenter: AnyObject {
    var view: MainView? { get set }
    var interactor: MainInteractor? { get set }
    var router: MainRouter? { get set }
    
    func routerShowDetails(data: AnyObject)
    func getDetails(id: Int)
    func getGallery()
    func interactorDidFetchGallery(with result: Result<[String], Error>)
    func interactorDidDownloadImage(with result: Result<AnyObject, Error>)
}
