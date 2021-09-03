//
//  ServiceHelper.swift
//  DemoApp
//
//  Created by mac on 04/07/21.
//

import Foundation

enum MethodType : String {
    case get = "GET"
    case post = "POST"
}

class ServiceHelper {
    private let session : URLSession
    init(session : URLSession = .shared) {
        self.session = session
    }
    
    func request(param: [String : Any],methodType : MethodType ,apiName: String, complition: @escaping (Result<Any, Error>) -> Void) {
        guard let urlRequest = URL(string : apiName) else {return}
        session.dataTask(with: urlRequest) { (data, response, error) in
            if error == nil && response != nil && data?.count != 0 {
                complition(.success(data ?? (Any).self))
            } else {
                complition(.failure(error!))
            }
        }.resume()
    }
}
