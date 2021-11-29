//
//  SignupDataModel.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/11/10.
//

import Foundation

// MARK: - SignupDataModel
struct SignupDataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignupData?
}

// MARK: - SignupData
struct SignupData: Codable {
    let id: Int
    let name, email: String
}

