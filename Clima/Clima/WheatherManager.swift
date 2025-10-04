//
//  WheatherManager.swift
//  Clima
//
//  Created by Ankit on 02/10/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation


protocol WeatherManagerDelegate {
    
    func didUpdateWeather(weather: WeatherModel)
}

struct WheatherManager {
    

    var delegate: WeatherManagerDelegate?
    
    let wheatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=40d4ca02fe5a70771cb0a9cc744c5a85&units=metric";
    
    
    func fetchWeather(cityName: String){
        print("cityName: \(cityName)")
        let urlString = "\(wheatherUrl)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        
        // Create a URL
        if let url = URL(string: urlString){
            
            // Create a URL Session
            let sesssion = URLSession(configuration: .default)
         
            // Give Session a task
            let task = sesssion.dataTask(with: url) { (data, response, error) in
                
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data{
                    if  let weather = self.parseJSON(weatherData: safeData){
//                        let weatherVC = WeatherViewController()
//                        weatherVC.didUpdateWeather(weather: weather);
                        // Instend of the above use the delegate
                        
                        self.delegate?.didUpdateWeather(weather: weather)
                    }
                }

            }
            
            // Start a task
            task.resume()
            
        }
    }
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decorder = JSONDecoder()
        
        do{
            let decodedData = try decorder.decode(WeatherData.self, from: weatherData)
           let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
          return weather
            
        }catch{
            print(error)
            return nil
        }
    }
    
    
}
