//
//  HomeVC.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/10/13.
//

import UIKit

import SnapKit

class HomeVC: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var windowButton: UIButton!
    @IBOutlet weak var notiButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    
//    let topView = UIView()
//    let logoImageView = UIImageView()
//    let windowSharingButton = UIButton()
//    let notiButton = UIButton()
//    let searchButton = UIButton()
//    let profileButton = UIButton()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        setupLayout()
    }

    // MARK: - Custom Method
    func configUI() {
        view.backgroundColor = .white
        
        topView.backgroundColor = .gray
        logoImageView.backgroundColor = .blue
        windowButton.backgroundColor = .yellow
        notiButton.backgroundColor = .red
        searchButton.backgroundColor = .orange
        profileButton.backgroundColor = .black
    }
    
    func setupLayout() {
        topView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
            make.width.equalTo(96)
            make.height.equalTo(20)
        }
        
        profileButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.width.height.equalTo(32)
        }
        
        searchButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(profileButton.snp.leading).offset(-17)
            make.width.height.equalTo(32)
        }
        
        notiButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(searchButton.snp.leading).offset(-11)
            make.width.height.equalTo(32)
        }
        
        windowButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(notiButton.snp.leading).offset(-12)
            make.width.height.equalTo(32)
        }
    }

}
