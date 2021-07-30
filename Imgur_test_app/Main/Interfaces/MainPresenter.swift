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
    
    func showDetails(id: Int)
    
    func getGallery()
    func getImage(id: Int)
    
    func interactorDidFetchGallery(with result: Result<[String], Error>)
    func interactorDidDownloadImage(with result: Result< Data, Error>)
}
