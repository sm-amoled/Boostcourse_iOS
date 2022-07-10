//
//  UserRegisterInformation.swift
//  Ch2_SignUp
//
//  Created by Park Sungmin on 2022/07/10.
//

import Foundation

class UserRegisterInformation {
    static let shared = UserRegisterInformation()
    
    private init() {}
    
    var id: String?
    var password: String?
    var description: String?
    var phoneNo: String?
    var birth: Date?
}
