//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Ibrokhim Movlonov on 25/01/23.
//

import Foundation

public class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public typealias Result = LoadFeedResult<Error>
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { [weak self] result  in
            guard self != nil else { return }
            
            switch result {
            case .success(let data, let response):
                completion(FeedItemsMapper.map(data, from: response))
            case .failure(_):
                completion(.failure(.connectivity))
            }
        }
    }
}
