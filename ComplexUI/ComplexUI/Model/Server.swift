//
//  Server.swift
//  ComplexUI
//
//  Created by Edgar Guitian Rey on 15/7/24.
//

import Foundation

struct Server: Identifiable {
    var id = UUID().uuidString
    var name: String
    var flag: String
}

extension Server {
    init(name: String, flag: String) {
        self.name = name
        self.flag = String.flagEmoji(for: flag)
    }
}

extension String {
    static func flagEmoji(for countryCode: String) -> String {
        let base: UInt32 = 127397
        var scalarView = String.UnicodeScalarView()
        for scalar in countryCode.uppercased().unicodeScalars {
            scalarView.append(UnicodeScalar(base + scalar.value)!)
        }
        return String(scalarView)
    }
}
