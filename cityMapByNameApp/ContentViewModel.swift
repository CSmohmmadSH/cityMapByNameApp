//
//  ContentViewModel.swift
//  SwiftUI.c1
//
//  Created by CSmohmmadSH on 09/08/2024.
//

import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published var cityName = ""
    @Published var cityData : CityData?
    @Published var alertItem: AlertItem?
    @Published var isError = false

    @MainActor func getCityData() {
            
            Task {
                do {
                    cityData = try await NetworkManager.shared.fetchCityData(for: cityName)
                } catch {
                    if let apError = error as? APError {
                        switch apError {
                        case .invalidURL:
                            alertItem = AlertContext.invalidURL
                        case .invalidResponse:
                            alertItem = AlertContext.invalidResponse
                        case .invalidData:
                            alertItem = AlertContext.invalidData
                            
                        case .unableToComplete:
                            alertItem = AlertContext.unableToComplete
                            
                        }
                    } else {
                        alertItem = AlertContext.invalidResponse

                    }
                }
            }
        }
}



