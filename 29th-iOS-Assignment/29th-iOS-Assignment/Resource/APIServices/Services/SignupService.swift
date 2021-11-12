//
//  SignupService.swift
//  29th-iOS-Assignment
//
//  Created by 양수빈 on 2021/11/10.
//

import Foundation

import Alamofire

struct SignupService {
    static let shared = SignupService()
    
    func signup(email: String,
                name: String,
                password: String,
                completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let url = APIConstants.signUpURL
        
        let header : HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body : Parameters = [
            "email" : email,
            "name" : name,
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
                
                let networkResult = self.judgeSignupStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeSignupStatus (by statuscode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statuscode {
        case 200: return isValidSignupData(data: data)
        case 400:
            return isInvalidSignupData(data: data)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidSignupData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignupDataModel.self, from: data) else {return .networkFail}
        return .success(decodedData)
    }
    
    private func isInvalidSignupData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignupDataModel.self, from: data) else {return .pathErr}
        return .requestErr(decodedData)
    }
}
