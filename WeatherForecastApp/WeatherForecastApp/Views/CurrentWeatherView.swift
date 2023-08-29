//
//  ContentView.swift
//  WeatherForecastApp
//
//  Created by Veerababu Mulugu on 8/27/23.
//

import SwiftUI

struct CurrentWeatherView: View {
    var weather: WeatherCoordModel?
    var body: some View {
        VStack {
            // CityName
            VStack {
                Text(weather?.city?.name ?? "")
                    .font(.title)
                // Current temperature
                Text(String(format: "%.2f", weather?.list?.first?.main?.temp ?? 0.0)  + "°")
                    .font(.system(size: 60))
                    .fontWeight(.thin)
            }
            .padding(-20)
            HStack {
                // Weather Icon
                AsyncImage(url: URL(string: NetworkConstant.imageUrl + "\(weather?.list?.first?.weather?.first?.icon ?? "")@2x.png")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView().progressViewStyle(.circular)
                }
                .scaledToFit()
                .frame(width: 60, height: 60)
                // Current weather condition
                Text(weather?.list?.first?.weather?.first?.main ?? "")
                    .font(.title)
            }
            // High and Low for the day temp_min
            HStack {
                Text("H:" + String(format: "%.2f", weather?.list?.first?.main?.temp_max ?? 0.0))
                    .font(.subheadline)
                Text("L:" + String(format: "%.2f", weather?.list?.first?.main?.temp_min ?? 0.0))
                    .font(.subheadline)
            }
            .padding(.bottom)
            
            HStack(spacing: 35) {
                
                ForEach((weather?.list ?? []), id: \.dt_txt) {list  in
                    VStack {
                        let (hr, ampm) = DateHelper.getHourAndAMPMFromDateStr(list.dt_txt ?? "") ?? (00, "")
                        Text("\(hr) \(ampm)")
                        AsyncImage(url: URL(string: NetworkConstant.imageUrl + "\(list.weather?.first?.icon ?? "")@2x.png")) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView().progressViewStyle(.circular)
                        }
                        .frame(width: 30, height: 30)
                        
                        Text("\(Int(list.main?.temp ?? 0))°C")
                    }
                }
            }
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
    }
}
