//
//  APIConstants.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/11/04.
//

import Foundation

struct APIConstants {
    // MARK: - Base URL
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    // MARK: - Feature URL
    static let loginURL = baseURL + "/user/login"
    static let signUpURL = baseURL + "/user/signup"
}
