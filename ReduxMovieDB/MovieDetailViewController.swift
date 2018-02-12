//
//  MovieDetailViewController.swift
//  ReduxMovieDB
//
//  Created by Matheus Cardoso on 2/11/18.
//  Copyright © 2018 Matheus Cardoso. All rights reserved.
//

import UIKit

import ReSwift
import RxCocoa
import RxSwift

class MovieDetailViewController: UIViewController {
    let disposeBag = DisposeBag()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self, transform: {
            $0.select(MovieDetailViewState.init)
        })
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)

        store.dispatch(AppStateAction.deselectMovie)
        store.dispatch(AppStateAction.hideMovieDetail)
    }
}

// MARK: StoreSubscriber

extension MovieDetailViewController: StoreSubscriber {
    typealias StoreSubscriberStateType = MovieDetailViewState

    func newState(state: MovieDetailViewState) {
        title = state.title
    }
}
