//
//  WeatherModel.swift
//  Clima
//
//  Created by Ankit on 05/10/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel{
 
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    // Computed Properties
    var conditionName: String {
        // Computed propeties always be var type
        switch conditionId {
        case 200...232:
           return "cloud.bolt"
        
        case 300...321:
           return "cloud.drizzle"
            
        case 500...531:
            return "cloud.rain"
            
        case 600...622:
            return "cloud.snow"
            
        case 701...781:
            return "cloud.fog"
            
        case 800:
            return  "sun.max"
            
        case 801...804:
            return "cloud.bolt"
            
        default:
            return "cloud"
        }
    }
    
//    func getConditionName(weatherId: Int) -> String {
//        switch weatherId {
//        case 200...232:
//           return "cloud.bolt"
//        
//        case 300...321:
//           return "cloud.drizzle"
//            
//        case 500...531:
//            return "cloud.rain"
//            
//        case 600...622:
//            return "cloud.snow"
//            
//        case 701...781:
//            return "cloud.fog"
//            
//        case 800:
//            return  "sun.max"
//            
//        case 801...804:
//            return "cloud.bolt"
//            
//        default:
//            return "cloud"
//        }
//
//    }
}
