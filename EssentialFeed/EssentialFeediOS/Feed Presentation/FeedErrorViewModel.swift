//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Ibrokhim Movlonov on 31/08/23.
//

import Foundation

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
