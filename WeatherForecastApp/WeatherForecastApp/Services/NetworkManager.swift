//
//  Network.swift
//  WeatherForecastApp
//
//  Created by Veerababu Mulugu on 8/27/23.
//

import Foundation

class NetworkManager {

    static let shared   = NetworkManager()
    let decoder         = JSONDecoder()

    private init() {}
    
    func fetchData<T: Codable>(from endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw WeatherError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw WeatherError.invalidResponse

        }
        do {
            let decoderData = try decoder.decode(T.self, from: data)
            
            return decoderData
        } catch {
            print(error)
            throw WeatherError.invalidData
        }
    }
}
