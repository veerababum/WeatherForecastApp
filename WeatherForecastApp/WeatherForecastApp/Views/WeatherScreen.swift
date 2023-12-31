//
//  WeatherScreen.swift
//  WeatherForecastApp
//
//  Created by Veerababu Mulugu on 8/27/23.
//

import SwiftUI

 struct WeatherScreen: View {
    
    @State var currentWeather: WeatherCoordModel
    @StateObject var viewModel = WeatherViewModel()
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            ZStack {
                // Gradient background
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.000009), Color.blue]),
                               startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                VStack() {
                    if viewModel.state == .loading {
                        ProgressView()
                    } else {
                        CurrentWeatherView(weather: viewModel.weatherModel)
                        Divider()
                        
                        DailyForecastView(weather: viewModel.weatherDayModel)
                        
                        Button(action: {
                            viewModel.fetchWeatherDataVM()
                        }, label: {
                            Image(systemName: "arrow.clockwise")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        })
                    }
                }
                .onAppear {
                    viewModel.fetchWeatherDataVM()
                }
            }
            .searchable(text: $searchText)
            .onSubmit(of: .search) {
                viewModel.fetchWeatherDataVM(searchCity: searchText)
            }
            .navigationTitle("Weather forecast")
        }
    }
}

struct WeatherScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeatherScreen(currentWeather: WeatherCoordModel.fake)
    }
}
