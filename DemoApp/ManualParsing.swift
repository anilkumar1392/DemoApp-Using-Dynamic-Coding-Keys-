//
//  ManualParsing.swift
//  DemoApp
//
//  Created by mac on 03/09/21.
//

import Foundation
import UIKit


let successJsonData = """
{
    "success": true,
    "data": {
        "name": "codecat15",
        "email": "codecat15@gmail.com"
    },
    "errorMessage": "no error",
    "code": 200
}

""".data(using: .utf8)

let failureJsonData = """

{
"success": 0,
"data": "some error occured",
"errorMessage": "Invalid credentials",
"code": 401
}

""".data(using: .utf8)


//MARK: - Model
struct UserResponse {
    var success: Custom
    var data: UserEnum?
    var errorMessage: String?
    var code: Int?
}

//Parsing different data type in same key.
enum Custom: Decodable {
    case int(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let x = try? container.decode(Int.self){
            self = .int(x)
        }
        
        if let x = try? container.decode(String.self){
            self = .string(x)
        }
        
        throw DecodingError.typeMismatch(Custom.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: ""))
    }
}

enum UserEnum: Decodable {
    case data(UserData)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let x = try? container.decode(UserData.self) {
            self = .data(x)
        }
        if let x = try? container.decode(String.self){
            self = .string(x)
        }
        
        throw DecodingError.typeMismatch(UserEnum.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: ""))
    }
}

struct UserData: Decodable{
    var name: String?
    var email: String?
}

// MARK: - JSON Decoding

/*
do {
    let result = try JSONDecoder().decode(UserResponse.self, from: failureJsonData!)
    debugPrint(result.data)
} catch let error {
    debugPrint(error)
}
*/
