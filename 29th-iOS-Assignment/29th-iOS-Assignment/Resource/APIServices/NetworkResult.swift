//
//  NetworkResult.swift
//  29th-iOS-Assignment
//
//  Created by μμλΉ on 2021/11/04.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
