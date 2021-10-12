//
//  SignupViewController.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/10/04.
//

import UIKit

class SignupViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var showPwButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setupAddTarget()
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Custom Method
    func setupAddTarget() {
        /// 요소에 따라 정의해둔 함수를 실행
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        pwTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        showPwButton.addTarget(self, action: #selector(showPwButtonClicked(button:)), for: .touchUpInside)
    }
    
    func configUI() {
        /// 초기 다음버튼 비활성화
        nextButton.isEnabled = false
    }
    
    // MARK: - @IBAction
    @IBAction func touchUpToSuccess(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SuccessViewController") as? SuccessViewController else {return}
        
        nextVC.message = nameTextField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
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
