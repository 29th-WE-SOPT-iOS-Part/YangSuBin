//
//  SuccessViewController.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/10/04.
//

import UIKit

class SuccessViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNameLabel()
    }
    
    // 받아온 이름 넣는 함수
    func setNameLabel() {
        if let name = message {
            nameLabel.text = "\(name)님"
            nameLabel.sizeToFit()
        }
    }
    
    /// 나중에 추가 과제 진행하면서 지울 부분
    @IBAction func touchUpToGoBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
