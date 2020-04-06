//
//  CountryTableViewCell.swift
//  CountrySelection
//
//  Created by user on 4/4/20.
//  Copyright © 2020 Aravind. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var countryNameOutlet: UILabel!
    @IBOutlet weak var countryImageOutlet: UIImageView!
    var loadCountryList: countryList! {
        didSet { populateTableViewCells() }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    /// Function to set data to table view cell
    func populateTableViewCells() {
        countryNameOutlet.text = loadCountryList.name
        countryImageOutlet.image(from: loadCountryList.flag)
        self.selectionStyle = .none
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
