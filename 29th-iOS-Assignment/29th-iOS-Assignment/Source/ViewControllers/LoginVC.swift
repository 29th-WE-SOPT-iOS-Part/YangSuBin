//
//  LoginVC.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/10/04.
//

import UIKit

import SnapKit

class LoginVC: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setupLayout()
        setupAddTarget()
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Custom Method
    func configUI() {
        /// 초기 다음버튼 비활성화
        nextButton.isEnabled = false
        
        logoImageView.image = UIImage(named: "Google")
        
        subLabel.text = "Youtube도 이동하면서 계속하세요.\n앱 및 safari에서도 Google 서비스에 로그인됩니다."
    }
    
    func setupAddTarget() {
        /// 요소에 따라 정의해둔 함수를 실행
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        pwTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    // MARK: - @IBAction
    @IBAction func touchUpToSuccess(_ sender: Any) {
        requestLogin()
    }
    
    @IBAction func touchUpToSignup(_ sender: Any) {
        /// push 화면 전환
        /// Main 스토리보드의 LoginVC -> Main 스토리보드의 SignupVC
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") else {return}
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    // MARK: - @objc
    /// textField 변화에 따라 수행할 함수
    @objc
    func textFieldDidChange(textField: UITextField) {        
        nextButton.isEnabled = nameTextField.hasText && emailTextField.hasText && pwTextField.hasText ?  true : false
    }
}

// MARK: - Layout
extension LoginVC {
    func setupLayout() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(117)
            make.height.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(14)
            make.centerX.equalToSuperview()
        }
        
        subLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(14)
            make.centerX.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(subLabel.snp.bottom).offset(68)
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(50)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(50)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(pwTextField.snp.bottom).offset(73)
            make.leading.equalToSuperview().inset(22)
        }
        
        nextButton.snp.makeConstraints { make in
            make.centerY.equalTo(signUpButton.snp.centerY)
            make.trailing.equalToSuperview().inset(22)
            make.width.equalTo(74)
            make.height.equalTo(50)
        }
    }
}

// MARK: - Network
extension LoginVC {
    func requestLogin() {
        LoginService.shared.login(email: emailTextField.text ?? "", password: pwTextField.text ?? "") { [self] responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginDataModel else {return}
                if response.data != nil {
                    self.showAlert(title: "로그인", message: response.message)
                }
                UserDefaults.standard.set(nameTextField.text, forKey: UserDefaults.Keys.userName)
            case .requestErr(let loginResponse):
                guard let response = loginResponse as? LoginDataModel else {return}
                self.showAlert(title: "로그인", message: response.message, okAction: nil)
                print("requestErr")
                
            case .pathErr:
                print("pathErr")
                
            case .serverErr:
                print("serverErr")
                
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
