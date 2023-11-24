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
    let didSelectItem = PublishSubject<ImageModel>()
    
    var title: Driver<String> {
        Observable.just("PIXABAY".localized())
            .asDriver(onErrorJustReturn: "")
    }
    
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
        .startWith([])
        
        isLoading = loadingSubject
            .asDriver(onErrorJustReturn: false)
            .skip(1)
        
        errorDriver = errorSubject
            .asDriver(onErrorJustReturn: "")
        
        didSelectItem
            .subscribe(onNext: { [weak coordinator] selectedImage in
                coordinator?.navigateToDetailPage(model: selectedImage)
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Helper
    
    
}
