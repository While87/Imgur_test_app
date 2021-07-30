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
            //Start load gallery after start application
            self.interactor?.getGalleryItems()
        }
    }
    
    //show image details view
    func showDetails(id: Int) {
        self.router?.showDetailsView(id: id)
    }
    
    func getGallery() {
        self.interactor?.getGalleryItems()
    }
    
    func getImage(id: Int) {
        self.interactor?.getImage(id: id)
    }
    
    func interactorDidFetchGallery(with result: Result<[String], Error>) {
        switch result {
        case .success(let gallery):
            self.view?.updateCollection(with: gallery)
        case .failure(let error):
            self.view?.updateError(with: "Все пошло не по плану 😭 \n\(error.localizedDescription)")
        }
    }
    
    func interactorDidDownloadImage(with result: Result<Data, Error>) {
        switch result {
        case .success(let data):
            self.view?.updateImage(with: data)
        case .failure(let error):
            self.view?.updateError(with: "Все пошло не по плану 😭 \n\(error.localizedDescription)")
        }
    }
}
