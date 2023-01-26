//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Ibrokhim Movlonov on 25/01/23.
//

import Foundation

public enum HTTPClientResult {
    case success(HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}

public class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Error) -> Void) {
        client.get(from: url) { result  in
            switch result {
            case .success(_):
                completion(.invalidData)
            case .failure(_):
                completion(.connectivity)
            }
        }
    }
}
