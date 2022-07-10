//
//  UserInformation.swift
//  Ch2_SignUp
//
//  Created by Park Sungmin on 2022/07/10.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    private init() { }
    
    var name: String?
    var age: String?
}
