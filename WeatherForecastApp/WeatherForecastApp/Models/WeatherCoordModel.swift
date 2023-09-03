//
//  WeatherCordModel.swift
//  WeatherForecastApp
//
//  Created by Veerababu Mulugu on 8/27/23.
//

import Foundation

// MARK: - WeatherCoordModel
struct WeatherCoordModel: Codable {
    let cod :       String?
    let message :   Int?
    let cnt :       Int?
    var list :      [List]?
    let city :      City?
}

// MARK: - City
struct City :           Codable {
    let id :            Int?
    let name :          String?
    let coord :         Coord?
    let country :       String?
    let population :    Int?
    let timezone :      Int?
    let sunrise :       Int?
    let sunset :        Int?
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int?
}

// MARK: - Coord
struct Coord: Codable {
    let lon : Double?
    let lat : Double?
}

// MARK: - List
struct List : Codable {
    let dt :        Int?
    let main :      Main?
    let weather :   [Weather]?
    let clouds :    Clouds?
    let wind :      Wind?
    let visibility : Int?
    let pop :       Double?
    let sys :       Sys?
    let dt_txt :    String?
}

// MARK: - Main
struct Main: Codable {
    let temp :          Double?
    let feels_like :    Double?
    let temp_min :      Double?
    let temp_max :      Double?
    let pressure :      Int?
    let sea_level :     Int?
    let grnd_level :    Int?
    let humidity :      Int?
    let temp_kf :       Double?
}

// MARK: - Sys
struct Sys: Codable {
    let pod : String?
}

// MARK: - Weather
struct Weather: Codable {
    let id :            Int?
    let main :          String?
    let description :   String?
    let icon :          String?
}

// MARK: - Wind
struct Wind: Codable {
    let speed :     Double?
    let deg :       Int?
    let gust :      Double?
}


extension WeatherCoordModel {
    static var fake: WeatherCoordModel {
        //  let WeatherCoordModel = WeatherCoordModel(WeatherCoordModel(
        let mockWeatherCoordData = WeatherCoordModel(
            cod : "",
            message : 0,
            cnt : 40,
            list : [List(dt : 0,
                         main : Main(
                            temp: 283.15,
                            feels_like: 280.09,
                            temp_min: 281.15,
                            temp_max: 285.37,
                            pressure: 1012,
                            sea_level: 93,
                            grnd_level: 1,
                            humidity: 2,
                            temp_kf: 10.20
                         ),
                         weather : [Weather(id: 0, main: "a", description: "a", icon: "a")],
                         clouds : Clouds(all: 1),
                         wind : Wind(speed: 10.0, deg: 1, gust: 10.0),
                         visibility : 1,
                         pop : 1.0,
                         sys : Sys(pod: "abc"),
                         dt_txt : "txt")],
            city : City(id: 1, name: "Test City", coord: Coord(lon: 10.10, lat: 10.10), country: "Test Country", population: 100, timezone: 1, sunrise: 1, sunset: 1)
        )
        return mockWeatherCoordData
    }
    
}
