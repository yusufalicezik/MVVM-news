//
//  WeatherListViewModel.swift
//  MVVM-Weather
//
//  Created by Yusuf ali cezik on 13.09.2019.
//  Copyright © 2019 Yusuf Ali Cezik. All rights reserved.
//

import Foundation

struct WeatherListViewModel {
     var weatherViewModels = [WeatherViewModel]()
    private var searchBarText = ""
    
    mutating func addWeatherViewModel(_ vm:WeatherViewModel){
        self.weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section:Int)->Int{
        return self.weatherViewModels.count
    }
    
    func modelAt(_ index:Int)->WeatherViewModel{
        return self.weatherViewModels[index]
    }
}
struct WeatherViewModel:Decodable {
    let name:String
    let currentTemperature:TemperatureViewModel
    
    private enum CodingKeys:String, CodingKey {
        case name
        case currentTemperature = "main"
    }

}
struct TemperatureViewModel:Decodable {
    let temperature:Double
    let temperatureMin:Double
    let temperatureMax:Double
    
    private enum CodingKeys:String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
    
}
