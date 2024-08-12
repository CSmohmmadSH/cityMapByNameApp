//
//  Alert.swift
//  barcode Scanner
//
//  Created by CSmohmmadSH on 03/07/2024.
//

import SwiftUI

struct AlertItem : Identifiable {
    let id = UUID()
    let title : Text
    let message : Text
    let dismissButton : Alert.Button
}


struct AlertContext {
    //MARK: - Network Alerts
    static let invalidData = AlertItem(title: Text("Invalid City Name"),
                                            message: Text("City not found. Please try agin."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid response from server. Please try again later or contact support."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                            message: Text("There was an issue connecting to the server. If this persists, Please contact support."),
                                            dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time Please check your internet connection."),
                                            dismissButton: .default(Text("OK")))
}
