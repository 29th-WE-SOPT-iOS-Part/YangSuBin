//
//  UIView+Extension.swift
//  29th-iOS-Assignment
//
//  Created by μμλΉ on 2021/10/28.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
