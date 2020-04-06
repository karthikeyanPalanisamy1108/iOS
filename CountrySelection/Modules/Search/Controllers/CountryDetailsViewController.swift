//
//  CountryDetailsViewController.swift
//  CountrySelection
//
//  Created by user on 4/4/20.
//  Copyright © 2020 Aravind. All rights reserved.
//

import UIKit

class CountryDetailsViewController: UIViewController {
    var countryList: countryList?
    @IBOutlet weak var callingCode: UILabel!
    @IBOutlet weak var captialLabel: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var subRegion: UILabel!
    @IBOutlet weak var timeZone: UILabel!
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var languages: UILabel!
    @IBOutlet weak var countryFlag: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = countryList?.name ?? "N/A"
        countryFlag.image(from: countryList?.flag ?? "")
        captialLabel.text = countryList?.capital.isEmpty == true ? "N/A" : countryList?.capital
        callingCode.text = (countryList?.callingCodes.joined(separator: ", ").description != "") ? countryList?.callingCodes.joined(separator: ", ") :  "N/A"
        region.text = countryList?.region.isEmpty == true ? "N/A" : countryList?.region
        subRegion.text = countryList?.subregion.isEmpty == true ? "N/A" : countryList?.subregion
        timeZone.text = countryList?.timezones.joined(separator: ", ")
        currency.text = (countryList?.currencies.map({ $0.code }) as? [String])?.joined(separator: ", ")
        languages.text = (countryList?.languages.map({ $0.name }) as? [String])?.joined(separator: ", ")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
