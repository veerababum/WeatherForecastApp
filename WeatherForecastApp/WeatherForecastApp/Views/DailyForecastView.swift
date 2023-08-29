//
//  ForecastCell.swift
//  WeatherForecastApp
//
//  Created by Veerababu Mulugu on 8/27/23.
//

import SwiftUI

struct DailyForecastView: View {
    
    var weather: WeatherCoordModel?
    
    // var forecast: DailyForecast
    var body: some View {
        VStack (){
            // Title for the HStack
            HStack {
                Text("5-DAYS FORECAST")
                    .font(.subheadline)
                Spacer()  
            }
            .padding()
            // 5-Day Forecast
            ForEach(0..<(weather?.list?.count ?? 0), id: \.self) { index in
                let weatherData = weather?.list?[index]
                let lowTemp = String(format: "%.2f", weatherData?.main?.temp_min ?? 0.0)
                let highTemp = String(format: "%.2f", weatherData?.main?.temp_max ?? 0.0)
                let imgUrl = URL(string: NetworkConstant.imageUrl + "\(weatherData?.weather?.first?.icon ?? "")@2x.png")
                let day = DateHelper.dayFromDate(dateString: weatherData?.dt_txt ?? "")
                
                HStack {
                    Text(day)
                        .frame(width: 150, alignment: .leading)
                    AsyncImage(url: imgUrl) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView().progressViewStyle(.circular)
                    }
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    Text("\(lowTemp)° - \(highTemp)°")
                        .font(.subheadline)
                        .padding(.leading, 10)
                }
            }
        }
    }
}

struct DailyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastView()
    }
}
