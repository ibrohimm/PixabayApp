//
//  HomeViewController.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    private let disposeBag = DisposeBag()
    var viewModel: HomeViewModel!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBindings()
    }
    
    // MARK: -
    
    private func setupBindings() {        
        viewModel.images
            .drive(tableView.rx.items(cellIdentifier: "ImageTableViewCell", cellType: ImageTableViewCell.self)) { _, model, cell in
                cell.configure(with: model)
            }
            .disposed(by: disposeBag)
        
        viewModel.errorDriver
            .drive(onNext: { [weak self] error in
                self?.showErrorAlert(with: error)
            })
            .disposed(by: disposeBag)
        
        viewModel.isLoading
            .drive(activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(ImageModel.self)
            .subscribe(onNext: { selectedImage in
                // Navigate to image details
                print(selectedImage)
            })
            .disposed(by: disposeBag)
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
    }
}
