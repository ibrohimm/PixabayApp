//
//  DetailViewController.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 23/11/23.
//

import UIKit
import RxSwift
import RxCocoa

final class DetailViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet private var tableView: UITableView!
    
    var viewModel: DetailViewModel!
    private let disposeBag = DisposeBag()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBindings()
    }
    
    // MARK: - Helper
    
    private func setupBindings() {
        viewModel.sections
            .bind(to: tableView.rx.items) { tableView, index, element in
                let indexPath = IndexPath(row: 0, section: index)
                switch element {
                case .section1(let data):
                    let cell = tableView.dequeueCell(ImageDetailFirstSectionCell.self, for: indexPath)
                    cell.configure(with: data)
                    return cell
                case .section2(let data):
                    let cell = tableView.dequeueCell(ImageDetailSecondSectionCell.self, for: indexPath)
                    cell.configure(with: data)
                    return cell
                }
            }
            .disposed(by: disposeBag)
    }
    
    private func setupTableView() {
        tableView.register(ImageDetailFirstSectionCell.self)
        tableView.register(ImageDetailSecondSectionCell.self)
    }
}
