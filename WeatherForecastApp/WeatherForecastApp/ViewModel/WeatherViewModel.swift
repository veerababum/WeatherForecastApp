//
//  WeatherViewModel.swift
//  WeatherForecastApp
//
//  Created by Veerababu Mulugu on 8/27/23.
//

import Foundation

enum ScreenState {
    case initialized
    case loading
    case loaded
}

class WeatherViewModel: ObservableObject {
    @Published var weatherModel: WeatherCoordModel!
    @Published var state: ScreenState = .initialized
    @Published var weatherDayModel: WeatherCoordModel!
    
    private let baseURL = "https://api.openweathermap.org/data/2.5/forecast"
    private let apiKey = "cd4cd7afbc1a41867e75a59ae130c921"
    func fetchWeatherDataVM(searchCity:String = "Austin") {
        state = .loading
        let endpoint = "\(baseURL)?q=\(searchCity)&cnt=48&appid=\(apiKey)&units=metric"
        Task {
            do {
                let model: WeatherCoordModel = try await NetworkManager.shared.fetchData(from: endpoint)
                DispatchQueue.main.async {
                    self.filterDataDayWise(weatherData: model)
                }
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
    
    func filterDataDayWise(weatherData: WeatherCoordModel){
        var filteredModel = weatherData
        
        guard let listData = weatherData.list else { return }
        
        let listDataDates = listData.compactMap { DateHelper.dateFromString(dateString: $0.dt_txt ?? "") }
        let datesGap = DateHelper.findDatesWithOneDayGap(dates: listDataDates).map { DateHelper.stringFromDate(date: $0) }
        
        var filteredListData : [List] = []
        var filteredDayList: [List] = []
        for i in 0..<listData.count {
            if (datesGap.contains(listData[i].dt_txt ?? "")){
                filteredListData.append(listData[i])
            }
            if i < 5 {
                filteredDayList.append(listData[i])
            }
        }
        
        filteredModel.list = filteredDayList
        self.weatherModel = filteredModel
        
        filteredModel.list = filteredListData
        self.weatherDayModel = filteredModel
        state = .loaded
    }
}
