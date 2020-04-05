//
//  ViewController.swift
//  CountrySelection
//
//  Created by user on 03/04/20.
//  Copyright © 2020 Aravind. All rights reserved.
//

import UIKit

class CountrySearchViewController: UIViewController {
    @IBOutlet weak var tableSearchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var searchActive = false
    var countryListData = [countryList]()
    var filteredListData = [countryList]()
    var selectedCountry: countryList?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getCountryList()
        self.tableSearchTableView.tableFooterView = UIView()
    }
    override func  viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tableSearchTableView.isHidden = true
        self.searchBar.resignFirstResponder()
    }
}
extension CountrySearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.tableSearchTableView.isHidden = !searchActive
        return !searchActive ? countryListData.count : filteredListData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.countryListCellID) as? CountryTableViewCell
        cell?.loadCountryList = searchActive ? filteredListData[indexPath.row] : countryListData[indexPath.row]
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCountry = searchActive ? filteredListData[indexPath.row] : countryListData[indexPath.row]
        searchBar.text = ""
        self.performSegue(withIdentifier: AppConstants.detailSegue, sender: self)
    }
}
extension CountrySearchViewController {
    internal func getCountryList() {
        let services = WebServices()
        services.getData(type: .all, parameters: [:], completion: { (response, statusCode) in
                print("Response Status Code is \(statusCode)")
                self.decodeData(data: response)
            }) { (error) in
            print("Handle Error")
        }
    }
    internal func decodeData(data: AnyObject) {
        let countries = try? JSONDecoder().decode(Countries.self, from: data as! Data)
        //Loop through all the countries and populate the data..
        for country in countries ?? [countryList]() {
            countryListData.append(country)
        }
    }
}
extension CountrySearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty == true {
            searchActive = true
            filteredListData = countryListData.filter({ $0.name.replacingOccurrences(of: " ", with: "").lowercased().contains(searchText.replacingOccurrences(of: " ", with: "").lowercased()) })
            self.tableSearchTableView.reloadData()
        }
    }
}
extension CountrySearchViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CountryDetailsViewController {
            vc.countryList = selectedCountry
        }
    }
}
