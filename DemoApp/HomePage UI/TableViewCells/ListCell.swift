//
//  ListCell.swift
//  DemoApp
//
//  Created by mac on 04/07/21.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(user : User){
        selectionStyle = .none
        nameLabel.text = "\(user.first_name?.capitalized ?? "") \(user.last_name?.capitalized ?? "")"
        emailLabel.text = "\(user.email ?? "")"
        descLabel.text = "\(user.message ?? "")"
    }

    
    func configureCellForKeeper(keeper : Keeper){
        selectionStyle = .none
        nameLabel.text = "\(keeper.appName ?? "")"
        emailLabel.text = "\(keeper.appSecret ?? "")"
        descLabel.text = ""
    }
}
