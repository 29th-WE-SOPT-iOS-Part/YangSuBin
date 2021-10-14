//
//  SuccessViewController.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/10/04.
//

import UIKit

class SuccessViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var okayButton: UIButton!
    @IBOutlet weak var anotherAccountButton: UIButton!
    var message: String?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        configUI()
        setNameLabel()
    }
    
    // MARK: - Custom Method
    func configUI() {
        anotherAccountButton.setTitle("다른 계정으로 로그인하기", for: .normal)
        logoImageView.image = UIImage(named: "Google")
    }
    
    func setupLayout() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(207)
            make.centerX.equalToSuperview()
            make.width.equalTo(117)
            make.height.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(14)
            make.centerX.equalToSuperview()
        }
        
        okayButton.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(53)
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(50)
        }
        
        anotherAccountButton.snp.makeConstraints { make in
            make.top.equalTo(okayButton.snp.bottom).offset(23)
            make.centerX.equalToSuperview()
        }
    }
    
    /// 받아온 이름 넣는 함수
    func setNameLabel() {
        if let name = message {
            nameLabel.text = "\(name)님\n환영합니다!"
            nameLabel.sizeToFit()
        }
    }
    
    // MARK: - @IBAction
    @IBAction func touchUpToGoBack(_ sender: Any) {
        /// Main이 아닌 따로 생성한 YouTubeMain이라는 스토리보드를 선언
        let youtubeMainStoryboard = UIStoryboard.init(name: "YoutubeMain", bundle: nil)
        guard let nextVC = youtubeMainStoryboard.instantiateViewController(withIdentifier: "CustomTabBarController") as? CustomTabBarController else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .crossDissolve
        
        present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func touchUpToGoAnotherAccount(_ sender: Any) {
        guard let pvc = self.presentingViewController as? UINavigationController else {return}
        self.dismiss(animated: true) {
            pvc.popToRootViewController(animated: true)
        }
    }
}
