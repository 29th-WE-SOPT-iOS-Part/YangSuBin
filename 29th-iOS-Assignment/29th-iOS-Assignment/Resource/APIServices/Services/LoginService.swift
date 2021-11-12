//
//  LoginService.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/11/04.
//

import Foundation

import Alamofire

struct LoginService {
    static let shared = LoginService()
    
    func login(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let url = APIConstants.loginURL
        
        let header : HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body : Parameters = [
            "email" : email,
            "password" : password
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                
                let networkResult = self.judgeLoginStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeLoginStatus (by statuscode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statuscode {
        case 200: return isValidLoginData(data: data)
        case 400:
            return isInvalidLoginData(data: data)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidLoginData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(LoginDataModel.self, from: data) else {return .networkFail}
        return .success(decodedData)
    }
    
    private func isInvalidLoginData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(LoginDataModel.self, from: data) else {return .pathErr}
        return .requestErr(decodedData)
    }
}
