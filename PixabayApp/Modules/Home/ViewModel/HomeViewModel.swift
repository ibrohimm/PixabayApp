//
//  HomeViewModel.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import RxSwift
import RxCocoa

final class HomeViewModel {
    
    // MARK: - Properties
    
    private let coordinator: HomeCoordinator
    private let homeRepository: HomeRepository
    private let disposeBag = DisposeBag()
    
    let images: Driver<[ImageModel]>
    let isLoading: Driver<Bool>
    let errorDriver: Driver<String>
    
    // MARK: - Init
    
    init(homeRepository: HomeRepository, coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        self.homeRepository = homeRepository
        
        let errorSubject = PublishSubject<String>()
        let loadingSubject = BehaviorSubject<Bool>(value: false)
        
        images = Observable.deferred {
            loadingSubject.onNext(true)
            return homeRepository.loadImages()
                .asObservable()
                .catch { error in
                    errorSubject.onNext("An error occured with: \(error)")
                    return Observable.just([])
                }
                .do(onNext: { _ in
                    loadingSubject.onNext(false)
                })
        }
        .asDriver(onErrorJustReturn: [])
        .startWith([]) // Provide an initial value
        
        isLoading = loadingSubject
            .asDriver(onErrorJustReturn: false)
            .skip(1) // Skip initial loading state
        
        errorDriver = errorSubject
            .asDriver(onErrorJustReturn: "")
    }
    
    // MARK: - Helper
    
    
}
