//
//  MainDefaultPresenter.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import Foundation

class MainDefaultPresenter: MainPresenter {

    weak var view: MainView?
    var router: MainRouter?
    var interactor: MainInteractor? {
        didSet {
            //Start load gallery after init current class
            self.interactor?.getGalleryItems()
        }
    }
    func routerShowDetails(data: AnyObject) {
        self.router?.showDetailsView(data: data)
    }
    
    func getDetails(id: Int) {
        self.interactor?.getGalleryItem(id: id)
    }
    
    func getGallery() {
        self.interactor?.getGalleryItems()
    }
    
    func interactorDidFetchGallery(with result: Result<[String], Error>) {
        switch result {
        case .success(let gallery):
            self.view?.updateCollection(with: gallery)
            self.interactor?.getImages()
        case .failure(let error):
            self.view?.updateError(with: error.localizedDescription)
        }
    }
    
    func interactorDidDownloadImage(with result: Result<AnyObject, Error>) {
        switch result {
        case .success(let data):
            self.view?.updateImage(with: data)
        case .failure(let error):
            self.view?.updateError(with: error.localizedDescription)
        }
    }
}
