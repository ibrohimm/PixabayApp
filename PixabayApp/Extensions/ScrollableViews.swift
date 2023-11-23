//
//  ScrollableViews.swift
//  PixabayApp
//
//  Created by Ibrokhim Movlonov on 24/11/23.
//

import UIKit

extension UITableView {
    func register(_ cell: AnyClass) {
        let name = String(describing: cell)
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forCellReuseIdentifier: name)
    }
    
    func dequeueCell<Cell: UITableViewCell>(_ cell: Cell.Type, for indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: String(describing: Cell.self), for: indexPath) as? Cell else { return Cell() }
        return cell
    }
 
}
