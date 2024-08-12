//
//  NetworkManager.swift
//  SwiftUI.c1
//
//  Created by CSmohmmadSH on 09/08/2024.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    static let baseURL = "https://api.openweathermap.org/data/2.5/weather?&units=metric&appid=65442b8f10dfb1432a5e73d71edd7e05"

    private init() {}
    
    func fetchCityData(for cityName: String) async throws -> CityData {
        let weatherURL = "\(Self.baseURL)&q=\(cityName)"
        
        guard let url = URL(string: weatherURL) else {
            throw APError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(CityData.self, from: data)
        } catch {
            throw APError.invalidData
        }

    }
}

