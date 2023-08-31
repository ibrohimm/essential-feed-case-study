//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Ibrokhim Movlonov on 31/08/23.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
