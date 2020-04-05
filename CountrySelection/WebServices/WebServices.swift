//
//  WebServices.swift
//  CountrySelection
//
//  Created by user on 03/04/20.
//  Copyright © 2020 Aravind. All rights reserved.
//

import Foundation
import Alamofire
class WebServices {
    ///  Setup default settings here
    internal func getData(from parameters: [String: Any]) -> Data {
        let obj = AppJsonConversions()
        let string = obj.convertToString(dict: parameters as [String: AnyObject])
        return string.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) ?? Data()
    }
    func getData(type: URLs, parameters: [String: Any], completion: @escaping (_ response: AnyObject, _ statuscode: Int) -> Void, errorOccured: @escaping (_ error: NSError?) -> Void) {
        var request = APIHelper().request(for: type)
        if APIHelper().HTTPMethod(for: type) == .post {
            request.httpBody = getData(from: parameters)
        }
        manager.request(request)
            .validate(statusCode: 200..<500)
            .responseJSON { response in
                switch response.result {
                case .success:
                    completion(response.data as AnyObject? ?? NSData(), response.response?.statusCode as Int? ?? Int())
                case .failure(let error):
                    errorOccured(error as NSError?)
                }
        }
    }
}
var manager: Alamofire.SessionManager = {
       // Create custom manager
       let configuration = URLSessionConfiguration.default
       configuration.timeoutIntervalForRequest = 130
       configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
       let manager = Alamofire.SessionManager(
           configuration: configuration
       )
       return manager
   }() 
