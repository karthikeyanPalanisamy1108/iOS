//
//  CountryModel.swift
//  CountrySelection
//
//  Created by user on 03/04/20.
//  Copyright © 2020 Aravind. All rights reserved.
//

import Foundation
import UIKit
// MARK:- Model for Countries
typealias Countries = [countryList]
struct countryList: Codable {
      let name: String
      let callingCodes: [String]
      let capital: String
      let region: String
      let subregion: String
      let timezones: [String]
      let currencies: [currencyData]
      let languages: [languagesData]
      let flag: String
}
// MARK: - BusinessLocation
struct currencyData: Codable {
   let code, name, symbol: String?
}
// MARK: - BusinessLocation
struct languagesData: Codable {
   let name, nativeName: String?
}
