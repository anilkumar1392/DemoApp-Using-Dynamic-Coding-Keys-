//
//  ListViewAdapter.swift
//  DemoApp
//
//  Created by mac on 04/07/21.
//

import Foundation

struct UserApiAdapter : UsersService{

    let userApi : UsersService
    func getUsers(onComplition: @escaping ([User]?) -> Void) {
        userApi.getUsers { (users) in
            onComplition(users)
        }
    }

    func getKeeprs(onComplition: @escaping ([KeeperArray]?) -> Void) {
        userApi.getKeeprs { (keepers) in
            onComplition(keepers)
        }
    }
}

