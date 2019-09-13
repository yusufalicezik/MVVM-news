//
//  ViewController.swift
//  MVVM-Weather
//
//  Created by Yusuf ali cezik on 13.09.2019.
//  Copyright © 2019 Yusuf Ali Cezik. All rights reserved.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm:WeatherViewModel)
}


class AddWeatherCityViewController: UIViewController {

    @IBOutlet weak var addCityLabel: UITextField!
    var delegate:AddWeatherDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Add New"
        self.navigationItem.largeTitleDisplayMode = .never
        self.addCityLabel.layer.cornerRadius = 16


    }
    @IBAction func saveButtonClicked(_ sender: Any) {
        if let cityName = addCityLabel.text{
            let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=e7053643c8ec058d30e19fd70110b5dc")
            
            let weatherResource = Resource<WeatherViewModel>(url: url!) { data in
                
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                
                return weatherVM
            }
            WebService.shared.load(resorcue: weatherResource) {[weak self] (result) in
                if let weatherVM = result {
                    if let delegate = self?.delegate{
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.navigationController?.popViewController(animated: true)
                    }
                }
            }
        }
    }
}

