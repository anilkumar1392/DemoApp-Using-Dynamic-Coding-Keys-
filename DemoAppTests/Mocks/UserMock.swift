//
//  UserMock.swift
//  DemoAppTests
//
//  Created by mac on 04/07/21.
//

import Foundation
@testable import DemoApp

class ApiHelperMock : UsersService {
    var shouldReturnError = false
    
    convenience init(){
        self.init(shouldReturnError: false)
    }
    
    init(shouldReturnError : Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    func getUsers(onComplition: @escaping ([User]?) -> Void) {
        if shouldReturnError == true {
            onComplition(nil)
        } else {
            guard let url = Bundle(for: DemoAppTests.self).url(forResource: "User-mock-data", withExtension: "json"),let data = try? Data(contentsOf: url) else {
                return onComplition(nil)
            }
            let mockUserResponse = try? JSONDecoder().decode([User].self, from: data)
            onComplition(mockUserResponse)
        }
    }
}



