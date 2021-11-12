//
//  SignupVC.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/10/04.
//

import UIKit

import SnapKit

class SignupVC: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var showPwButton: UIButton!
    @IBOutlet weak var showPwLabel: UILabel!
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
    }
    
    func setupAddTarget() {
        /// 요소에 따라 정의해둔 함수를 실행
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        pwTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        showPwButton.addTarget(self, action: #selector(showPwButtonClicked(button:)), for: .touchUpInside)
    }
    
//    func showAlert(title: String, message: String, okAction: ((UIAlertAction) -> Void)? = nil) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "확인", style: .default, handler: { action in
//            /// 서버에서 받은 message가 "회원 가입 성공"일 때만 화면 전환
//            if message == "회원 가입 성공" {
//                /// present 화면 전환
//                /// Main 스토리보드의 SignupVC -> Main 스토리보드의 SuccessVC
//                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SuccessVC") as? SuccessVC else {return}
//
//                nextVC.modalPresentationStyle = .fullScreen
//                self.present(nextVC, animated: true, completion: nil)
//            }
//        })
//        alert.addAction(okAction)
//        present(alert, animated: true)
//    }
    
    // MARK: - @IBAction
    @IBAction func touchUpToSuccess(_ sender: Any) {
        requestSignup()
    }
    
    // MARK: - @objc
    /// textField 변화에 따라 수행할 함수
    @objc
    func textFieldDidChange(textField: UITextField) {
        nextButton.isEnabled = nameTextField.hasText && emailTextField.hasText && pwTextField.hasText ?  true : false
    }
    
    /// 비밀번호 표시 버튼에 따라 수행할 함수
    @objc
    func showPwButtonClicked(button: UIButton) {
        pwTextField.isSecureTextEntry = pwTextField.isSecureTextEntry == true ? false : true
        showPwButton.tintColor = pwTextField.isSecureTextEntry == true ? .lightGray : .systemBlue
    }
}

// MARK: - Layout
extension SignupVC {
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
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(128)
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
        
        showPwButton.snp.makeConstraints { make in
            make.top.equalTo(pwTextField.snp.bottom).offset(17)
            make.leading.equalToSuperview().inset(21)
            make.width.height.equalTo(18)
        }
        
        showPwLabel.snp.makeConstraints { make in
            make.centerY.equalTo(showPwButton.snp.centerY)
            make.leading.equalTo(showPwButton.snp.trailing).offset(11)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(showPwButton.snp.bottom).offset(31)
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(50)
        }
    }
}

// MARK: - Network
extension SignupVC {
    func requestSignup() {
        SignupService.shared.signup(email: emailTextField.text ?? "", name: nameTextField.text ?? "", password: pwTextField.text ?? "") { [self] responseData in
            switch responseData {
            case .success(let signupResponse):
                guard let response = signupResponse as? SignupDataModel else {return}
                if response.data != nil {
                    self.showAlert(title: "회원가입", message: response.message)
                }
                UserDefaults.standard.set(nameTextField.text, forKey: UserDefaults.Keys.userName)
            case .requestErr(let msg):
                print("requestErr \(msg)")
                
            case .pathErr(let loginResponse):
                guard let response = loginResponse as? SignupDataModel else {return}
                self.showAlert(title: "회원가입", message: response.message, okAction: nil)
                print("pathErr")
                
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
