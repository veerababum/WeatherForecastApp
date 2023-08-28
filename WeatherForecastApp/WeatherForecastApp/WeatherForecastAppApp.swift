//
//  WeatherForecastAppApp.swift
//  WeatherForecastApp
//
//  Created by Veerababu Mulugu on 8/27/23.
//

import SwiftUI


//
////@main
//struct WeatherApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView1()
//        }
//    }
//}



@main
struct WeatherForecastAppApp: App {
    var body: some Scene {
        WindowGroup {

            WeatherScreen(currentWeather: WeatherCoordModel.fake)
        }
        
    }
}

