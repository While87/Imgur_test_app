//
//  MainInteractor.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import Foundation

protocol MainInteractor {
    var presenter: MainPresenter? { get set }
    
    func getGalleryItems()
    func getImages()
    func getGalleryItem(id: Int)
    
}
