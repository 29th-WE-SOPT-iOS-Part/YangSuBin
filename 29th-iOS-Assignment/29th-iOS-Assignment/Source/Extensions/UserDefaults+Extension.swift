//
//  UserDefaults+Extension.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/11/12.
//

import Foundation

extension UserDefaults {
    /// UserDefaults 값이 많아지는 경우를 관리하기 어렵기 때문에 Keys로 묶어서 관리
    enum Keys {
        static var userName = "userName"
    }
}
