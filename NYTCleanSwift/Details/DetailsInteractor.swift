//
//  DetailsInteractor.swift
//  NYTCleanSwift
//
//  Created by Abdulrahman on 4/8/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailsBusinessLogic {
    func doSomething(request: Details.Something.Request)
//    func doSomethingElse(request: Details.SomethingElse.Request)
}

protocol DetailsDataStore {
    //var name: String { get set }
}

class DetailsInteractor: DetailsBusinessLogic, DetailsDataStore {
    var presenter: DetailsPresentationLogic?
    var worker: DetailsWorker?
    //var name: String = ""

    // MARK: Do something (and send response to DetailsPresenter)

    func doSomething(request: Details.Something.Request) {
        worker = DetailsWorker()
        worker?.doSomeWork()

        let response = Details.Something.Response()
        presenter?.presentSomething(response: response)
    }
//
//    func doSomethingElse(request: Details.SomethingElse.Request) {
//        worker = DetailsWorker()
//        worker?.doSomeOtherWork()
//
//        let response = Details.SomethingElse.Response()
//        presenter?.presentSomethingElse(response: response)
//    }
}
