//
//  Network.swift
//  WeatherForecastApp
//
//  Created by Veerababu Mulugu on 8/27/23.
//

import Foundation

class Network {
    // "https://api.openweathermap.org/data/2.5/forecast?id=524901&appid=49b4f4f80b7a69e2cff0fd5ba62f0ec1"
    static let shared = Network()
    
    private init() {}
    
    func fetchData<T: Codable>(from endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw networkError.InvalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw networkError.InvalidRes
        }
        do {
            let decoderData = try JSONDecoder().decode(T.self, from: data)
            
            return decoderData
        } catch {
            print(error)
            throw networkError.InvalidData
        }
    }
}

enum networkError: Error {
    case InvalidURL
    case InvalidRes
    case InvalidData
}
