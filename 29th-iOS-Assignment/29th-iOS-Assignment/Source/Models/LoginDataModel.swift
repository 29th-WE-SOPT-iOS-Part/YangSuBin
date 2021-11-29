//
//  LoginDataModel.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/11/04.
//

import Foundation

// MARK: - LoginDataModel
struct LoginDataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginData?
}

// MARK: - LoginData
struct LoginData: Codable {
    let id: Int
    let name, email: String
}
