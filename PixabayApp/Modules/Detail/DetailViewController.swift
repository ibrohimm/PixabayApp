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
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ImageDetailFirstSectionCell", for: indexPath) as! ImageDetailFirstSectionCell
                    cell.configure(with: data)
                    return cell
                case .section2(let data):
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ImageDetailSecondSectionCell", for: indexPath) as! ImageDetailSecondSectionCell
                    cell.configure(with: data)
                    return cell
                }
            }
            .disposed(by: disposeBag)
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "ImageDetailFirstSectionCell", bundle: nil), forCellReuseIdentifier: "ImageDetailFirstSectionCell")
        tableView.register(UINib(nibName: "ImageDetailSecondSectionCell", bundle: nil), forCellReuseIdentifier: "ImageDetailSecondSectionCell")
    }
}
