//
//  DemoAppTests.swift
//  DemoAppTests
//
//  Created by mac on 04/07/21.
//

import XCTest
@testable import DemoApp

class DemoAppTests: XCTestCase {

    func test_withNoData_showsZeroCell(){
        let (sut,_) = makeSut()
        XCTAssertEqual(sut.users.count, 0)
        XCTAssertEqual(sut.tableView(sut.tableView, numberOfRowsInSection: 0), 0)
        XCTAssertEqual(sut.tableView(sut.tableView, numberOfRowsInSection: 1), 0)
    }

    func test_withApiCall_showsDataOnCell(){
        let (sut,userService) = makeSut()
        let expectation = self.expectation(description: "userService")
        userService.getUsers { (users) in
            sut.users = users ?? []
            sut.tableView.reloadData()
            expectation.fulfill()
            XCTAssertNotEqual(sut.users.count, 0)
            XCTAssertEqual(sut.tableView(sut.tableView, numberOfRowsInSection: 0), sut.users.count)
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    
    //MARK: - Helper
    
    func makeSut() -> (HomeListVC,UsersService) {
        let userList = ApiHelperMock()
        let vc = HomeListComposer.listComposedWith(userLoader: userList)
        _ = vc.view
        return (vc,userList)
    }
}
