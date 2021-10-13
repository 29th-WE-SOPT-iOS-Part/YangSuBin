//
//  HomeVC.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/10/13.
//

import UIKit

class HomeVC: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }

    // MARK: - Custom Method
    func configUI() {
        view.backgroundColor = .lightGray
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}