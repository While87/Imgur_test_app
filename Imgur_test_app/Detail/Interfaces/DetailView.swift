//
//  DetailView.swift
//  Imgur_test_app
//
//  Created by Vladimir Gorbunov on 29.07.2021.
//

import Foundation

protocol DetailView: AnyObject {
    var presenter: DetailPresenter? { get set }
    
    func setLabels()
    func updateImageData(with data: AnyObject)
    func updateComments(with data: AnyObject)
    func updateError(with error: String)
}
