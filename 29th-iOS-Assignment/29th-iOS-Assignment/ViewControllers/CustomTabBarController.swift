//
//  CustomTabBarController.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/10/13.
//

import UIKit

class CustomTabBarController: UITabBarController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBar()
    }
    
    // MARK: - Custom Method
    func setTabBar() {
        guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC"),
              let shortsVC = self.storyboard?.instantiateViewController(withIdentifier: "ShortsVC"),
              let addVC = self.storyboard?.instantiateViewController(withIdentifier: "AddVC"),
              let subscribeVC = self.storyboard?.instantiateViewController(withIdentifier: "SubscribeVC"),
              let lockerVC = self.storyboard?.instantiateViewController(withIdentifier: "LockerVC")
        else {return}
        
        /// 탭바 아이템별 이름
        homeVC.tabBarItem.title = "홈"
        shortsVC.tabBarItem.title = "shorts"
        addVC.tabBarItem.title = "추가"
        subscribeVC.tabBarItem.title = "구독"
        lockerVC.tabBarItem.title = "보관함"
        
        /// 탭바 아이콘 색상
        tabBar.tintColor = .black
        
        /// 탭바 아이템별 기본 아이콘
        homeVC.tabBarItem.image = UIImage(named: "homeIcon")
        shortsVC.tabBarItem.image = UIImage(named: "shortIcon")
        addVC.tabBarItem.image = UIImage(named: "plusCircleIcon")
        subscribeVC.tabBarItem.image = UIImage(named: "subscriptionsIcon")
        lockerVC.tabBarItem.image = UIImage(named: "LibraryIcon")
        
        /// 탭바 아이템별 선택됐을 때 아이콘
        homeVC.tabBarItem.selectedImage = UIImage(named: "homeIconFill")
        subscribeVC.tabBarItem.selectedImage = UIImage(named: "subscriptionsIconFill")
        lockerVC.tabBarItem.selectedImage = UIImage(named: "LibraryIconFill")
        
        setViewControllers([homeVC, shortsVC, addVC, subscribeVC, lockerVC], animated: true)
    }
}
