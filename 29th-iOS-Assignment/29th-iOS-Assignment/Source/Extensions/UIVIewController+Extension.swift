//
//  UIVIewController+Extension.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/10/13.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlert(title: String, message: String, okAction: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { action in
            /// 서버에서 받은 message가 "로그인 성공"일 때만 화면 전환
            if message == "로그인 성공" {
                /// present 화면 전환
                /// Main 스토리보드의 LoginVC -> Main 스토리보드의 SuccessVC
                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SuccessVC") as? SuccessVC else {return}
                
                nextVC.modalPresentationStyle = .fullScreen
                self.present(nextVC, animated: true, completion: nil)
            }
            
            /// 서버에서 받은 message가 "회원 가입 성공"일 때만 화면 전환
            if message == "회원 가입 성공" {
                /// present 화면 전환
                /// Main 스토리보드의 SignupVC -> Main 스토리보드의 SuccessVC
                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SuccessVC") as? SuccessVC else {return}
                
                nextVC.modalPresentationStyle = .fullScreen
                self.present(nextVC, animated: true, completion: nil)
            }
        })
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
