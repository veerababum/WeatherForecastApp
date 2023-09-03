//
//  LanchScreen.swift
//  WeatherForecastApp
//
//  Created by Veerababu Mulugu on 9/1/23.
//

import Foundation
import SwiftUI

// manage app cong
// rds config
// initial api loading

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        ZStack {
            if self.isActive {
                WeatherScreen(currentWeather: WeatherCoordModel.fake)
            } else {
                Rectangle()
                    .background(Color.black)
                Color.blue.edgesIgnoringSafeArea(.all) // Background color
                Image("LaunchIcon") // Your image name
                    .resizable()
                    .scaledToFit()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isActive = true
                        }
                    }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
