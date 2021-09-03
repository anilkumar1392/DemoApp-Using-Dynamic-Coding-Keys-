//
//  ListModel.swift
//  DemoApp
//
//  Created by mac on 04/07/21.
//

import Foundation

struct User : Decodable {
    var id : Int?
    var first_name : String?
    var last_name : String?
    var email : String?
    var gender : String?
    var message : String?
    var ip_address : String?
}


struct Keeper : Decodable{
    var appName : String?
    var appId : String?
    var appSecret : String?
    var type : String?
}

struct KeeperArray : Decodable{
    var name : String?
    var keepers : [Keeper]
}

struct KeeperModel : Decodable{
    var keeperArr : [KeeperArray] = []
    
    struct DynamicCodingKeys : CodingKey {
        var stringValue: String
        
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        var intValue: Int?
        
        init?(intValue: Int) {
            nil
        }
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        for key in container.allKeys {
            let decodedObject = try container.decode([Keeper].self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
            let object = KeeperArray(name: key.stringValue, keepers: decodedObject)
            keeperArr.append(object)
        }
    }
    
}
