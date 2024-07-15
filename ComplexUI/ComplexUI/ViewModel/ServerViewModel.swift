//
//  ServerViewModel.swift
//  ComplexUI
//
//  Created by Edgar Guitian Rey on 15/7/24.
//

import Foundation

class ServerViewModel: ObservableObject {
    @Published var servers = [
        Server(name: "United States", flag: "us"),
        Server(name: "India", flag: "in"),
        Server(name: "United Kingdom", flag: "gb"),
        Server(name: "France", flag: "fr"),
        Server(name: "Germany", flag: "de"),
        Server(name: "Singapore", flag: "si"),
        Server(name: "Spain", flag: "es")
    ]
    @Published var isConnnected = false
    @Published var showSheet = false
    @Published var currentServer = Server(name: "United States", flag: "us")
}
