//
//  NetworkResult.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/11/04.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr(T)
    case serverErr
    case networkFail
}
