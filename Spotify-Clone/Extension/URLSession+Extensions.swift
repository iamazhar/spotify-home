//
//  URLSession+Extensions.swift
//  Spotify-Clone
//
//  Created by Azhar Anwar on 4/8/20.
//  Copyright © 2020 Azhar Anwar. All rights reserved.
//

import Foundation

protocol NetworkEngine {
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    func performRequest(for request: URLRequest, completionHandler: @escaping Handler)
}

extension URLSession: NetworkEngine {
    typealias  Handler = NetworkEngine.Handler
    
    func performRequest(for request: URLRequest, completionHandler: @escaping Handler) {
        let task = dataTask(with: request, completionHandler: completionHandler)
        task.resume()
    }
}
