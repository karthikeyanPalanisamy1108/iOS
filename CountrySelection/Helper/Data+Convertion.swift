//
//  Data+Convertion.swift
//  CountrySelection
//
//  Created by user on 03/04/20.
//  Copyright © 2020 Aravind. All rights reserved.
//

import Foundation
// MARK:- Class to help convert data types for API's
class AppJsonConversions {
/// A Method to convert a String to Json Dict
///
/// - Parameter text: Passing Json String
/// - Returns: Returns a Dictionary
func convertToDictionary(text: String) -> [String: AnyObject] {
    var dict = [String: AnyObject]()
    if let data = text.data(using: String.Encoding.utf8) {
        do {
            dict = (try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject])!
        } catch {
            print(error)
        }
    }
    return dict
}
/// A Method to convert the dict to String
///
/// - Parameter dict: Dictionary Value
/// - Returns: Converted Json String Value
func convertToString(dict: [String: AnyObject]) -> String {
    if let theJSONData = try?  JSONSerialization.data(
        withJSONObject: dict,
        options: .prettyPrinted
        ),
        let theJSONText = String(data: theJSONData,
                                 encoding: String.Encoding.ascii) {
        print("JSON string = \n\(theJSONText)")
        return theJSONText
    }
    return ""
}
}

