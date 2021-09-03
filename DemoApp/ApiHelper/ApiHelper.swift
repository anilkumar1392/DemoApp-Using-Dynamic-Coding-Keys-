//
//  ApiHelper.swift
//  DemoApp
//
//  Created by mac on 04/07/21.
//

import Foundation

class UserList : UsersService{
    
    var serviceHelper = ServiceHelper()
    func getUsers(onComplition : @escaping ([User]?) -> Void){
        serviceHelper.request(param: [:], methodType: .get, apiName: kUsersApi, complition: { (result) in
            switch result{
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode([User].self, from: data as! Data)
                    onComplition(result)
                } catch {
                    onComplition(nil)
                }
            case .failure(let error):
                print("Something went wrong \(error)")
            }
        })
    }
    
    func getKeeprs(onComplition : @escaping ([KeeperArray]?) -> Void){
        serviceHelper.request(param: [:], methodType: .get, apiName: kKeeperApi, complition: { (result) in
            switch result{
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(KeeperModel.self, from: data as! Data)
                    onComplition(result.keeperArr)
                } catch {
                    onComplition(nil)
                }
            case .failure(let error):
                print("Something went wrong \(error)")
            }
        })
    }
}
