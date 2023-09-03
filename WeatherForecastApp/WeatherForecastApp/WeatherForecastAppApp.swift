//
//  WeatherForecastAppApp.swift
//  WeatherForecastApp
//
//  Created by Veerababu Mulugu on 8/27/23.
//

import SwiftUI

@main
struct WeatherForecastAppApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
           // WeatherScreen(currentWeather: WeatherCoordModel.fake)
        }
        
    }
}

