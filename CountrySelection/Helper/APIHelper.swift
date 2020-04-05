//
//  API.swift
//  CountrySelection
//
//  Created by user on 03/04/20.
//  Copyright © 2020 Aravind. All rights reserved.
//

import Foundation
import Alamofire
 
struct APIHelper {
    func getURL(_ type: URLs) -> String {
        if AppConstants.baseURL == "" { fatalError("Base URL is empty") }
        return AppConstants.baseURL + type.rawValue
    }
    func request(for type: URLs) -> URLRequest {
        var request = URLRequest(url: URL(string: getURL(type))!)
        let httpType = HTTPMethod(for: type)
        request.httpMethod = httpType.rawValue
        if httpType == .post {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        return request
    }
    func HTTPMethod(for type: URLs) -> HTTPMethod {
        switch type {
        case .search, .detail, .all:
            return .get
        }
    }
}
