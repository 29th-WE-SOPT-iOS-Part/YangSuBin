//
//  SuccessViewController.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/10/04.
//

import UIKit

class SuccessViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var nameLabel: UILabel!
    var message: String?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setNameLabel()
    }
    
    // MARK: - Custom Method
    /// 받아온 이름 넣는 함수
    func setNameLabel() {
        if let name = message {
            nameLabel.text = "\(name)님\n환영합니다!"
            nameLabel.sizeToFit()
        }
    }
    
    // MARK: - @IBAction
    /// 나중에 추가 과제 진행하면서 지울 부분
    @IBAction func touchUpToGoBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
