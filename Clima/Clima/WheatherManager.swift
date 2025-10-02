//
//  WheatherManager.swift
//  Clima
//
//  Created by Ankit on 02/10/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation


struct WheatherManager {
    

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
            let task = sesssion.dataTask(with: url, completionHandler: dataHandle(data: response: error: ))
            
            // Start a task
            task.resume()
            
        }
        
        func dataHandle(data: Data?, response: URLResponse?, error: Error?){
            
            if error != nil{
                print(error!)
                return
            }
            
            if let safeData = data{
                let dataString = String(data: safeData, encoding: .utf8)
                print(dataString!)
            }
        }
    }
}
