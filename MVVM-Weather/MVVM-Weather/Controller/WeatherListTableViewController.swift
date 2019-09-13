//
//  WeatherListTableViewController.swift
//  MVVM-Weather
//
//  Created by Yusuf ali cezik on 13.09.2019.
//  Copyright © 2019 Yusuf Ali Cezik. All rights reserved.
//

import UIKit

class WeatherListTableViewController: UITableViewController {
    
    
    private var weatherListViewModel = WeatherListViewModel()
    var searchController:UISearchController!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupNavBar()
        
    }

    func setupNavBar(){
        searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        self.definesPresentationContext = true
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textfield.placeholder = "Search City"
            if let backgroundview = textfield.subviews.first {
                backgroundview.backgroundColor = UIColor.white
                backgroundview.layer.cornerRadius = 10
                backgroundview.clipsToBounds = true
            }
        }
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), NSAttributedString.Key.font:UIFont(name: "Verdana", size: 18.0)!]

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAdd" {
              let addWeatherVC=segue.destination as! AddWeatherCityViewController
                addWeatherVC.delegate = self
        }
    }
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.numberOfRows(section)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WeatherCell else { return UITableViewCell()}
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        cell.cityNameLabel.text = weatherVM.name
        cell.temperatureLabel.text = "\(weatherVM.currentTemperature.temperature)°"
        return cell
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        weatherListViewModel.weatherViewModels = weatherListViewModel.weatherViewModels.filter({( weatherViewModel : WeatherViewModel) -> Bool in
            return weatherViewModel.name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    


}
extension WeatherListTableViewController : AddWeatherDelegate{
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
        print(vm.currentTemperature.temperature)
    }
    
    
}

extension WeatherListTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        if let txt = searchController.searchBar.text {
            if txt != ""{
             filterContentForSearchText(txt)
            }
        }
       
    }
}
