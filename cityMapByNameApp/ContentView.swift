//
//  ContentView.swift
//  cityMapByNameApp
//
//  Created by CSmohmmadSH on 12/08/2024.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    @State var cityName = ""
    
    var body: some View {
        
        ZStack {
            ContainerRelativeShape()
                .fill(Color.blue.gradient)
                .ignoresSafeArea()
            VStack{
                ZStack(alignment: .trailing) {
                    TextField("Search city", text: $viewModel.cityName)
                        .frame(width: 300, height: 50)
                        .background(.white.secondary)
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .cornerRadius(10)
                        .padding(.trailing, 40)
                        .onSubmit {
                            viewModel.getCityData()
                        }
                    
                    Button(action: {
                        viewModel.getCityData()
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .font(.system(size: 28))
                    }
                    .padding(.trailing,-1) // Add padding for the button
                }
                .frame(width: 350, height: 50) // Adjust frame as needed
                Map{
                    Marker(viewModel.cityData?.name ?? "", coordinate: CLLocationCoordinate2D(latitude: (viewModel.cityData?.coord.lat) ?? 25.3726, longitude: (viewModel.cityData?.coord.lon) ?? 49.587 ))
                        
                }
            }
            
        }
        
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}


#Preview {
    ContentView()
}

