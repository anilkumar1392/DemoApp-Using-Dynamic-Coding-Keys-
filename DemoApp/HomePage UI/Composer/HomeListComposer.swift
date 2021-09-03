//
//  HomeListComposer.swift
//  DemoApp
//
//  Created by mac on 04/07/21.
//

import Foundation
import UIKit

final class HomeListComposer {
    private init() {}
    
    public static func listComposedWith(userLoader : UsersService) -> HomeListVC{
        let vc  = HomeListVC.make()
        vc.userService = UserApiAdapter(userApi: userLoader)
        return vc
    }
}

private extension HomeListVC {
    static func make() -> HomeListVC {
        let bundle = Bundle(for: HomeListVC.self)
        let storyboard = UIStoryboard.init(name: "Main", bundle: bundle)
        let homeListController = storyboard.instantiateViewController(identifier: "HomeListVC") as! HomeListVC
        return homeListController
    }
}

