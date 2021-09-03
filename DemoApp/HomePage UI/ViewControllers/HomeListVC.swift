//
//  HomeListVC.swift
//  DemoApp
//
//  Created by mac on 04/07/21.
//

import UIKit

protocol UsersService {
    func getUsers(onComplition : @escaping ([User]?) -> Void)
    func getKeeprs(onComplition : @escaping ([KeeperArray]?) -> Void)
}

class HomeListVC: UIViewController {

    //MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!
    var userService : UsersService?

    var users : [User] = []
    var keepers : [KeeperArray] = []

    //MARK: - View life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        //getUsersList()
        getKeepers()
    }

    func reloadTable(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: - Extension

extension HomeListVC {
    func setupView(){
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableView.automaticDimension
    }
}

//MARK: - UITableViewDataSource

extension HomeListVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.keepers.count
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.keepers[section].name?.capitalized
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.keepers[section].keepers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : ListCell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        cell.configureCellForKeeper(keeper: self.keepers[indexPath.section].keepers[indexPath.row])
        return cell
    }
}

//MARK: - UITableViewDelegate
extension HomeListVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

//MARK: - Extension

extension HomeListVC {
    func getUsersList(){
        userService?.getUsers(onComplition: handleResult(users:))
    }
    
    func handleResult(users : [User]?){
        self.users = users ?? []
        reloadTable()
    }
    
    func getKeepers(){
        userService?.getKeeprs(onComplition: handleResult(keepers:))
    }
    
    func handleResult(keepers : [KeeperArray]?){
        self.keepers = keepers ?? []
        reloadTable()
    }
}

