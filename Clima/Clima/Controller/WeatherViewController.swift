

/*
 
 NOTE:
 
 >>>>>>>>>  How to make dynamic color according to System.
 
 When we define the custom color then not able to change with the system color mode like dark , light.
 
 So when pickup the color using drop-pin then right click on chose color box and add on the small colors box so that when we add color set in the assets then we able to get that color and in this we define color for light and dark mode.
 
 And at last on original main file we choose the custom color but we use that define color that show on the top.
 
 
 >>> Sometime we use png photo for the background and sometime pdf
 
 In this when we use the png then issue come as on zoom photo clearlty gone.
 But we use the pdf for background image this not lossup their zooming
 But when use the pdf as image then make sure enable (click the checkbox)the **Resizing**.
 */

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var weatherManager = WheatherManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        searchTextField.delegate = self
    }

    @IBAction func searchPressed(_ sender: Any) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            return true
        }else{
            textField.placeholder = "Type Something here"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text{
            weatherManager.fetchWeather(cityName: city)
        }
    
        searchTextField.text = ""
    }
    
    func didUpdateWeather(_ weatherManager: WheatherManager, weather: WeatherModel){
        print(weather.temperature)
    }
    func didFailWithError(error: any Error) {
     print(error)
    }
    
}

