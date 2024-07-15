//
//  CardView.swift
//  ComplexUI
//
//  Created by Edgar Guitian Rey on 15/7/24.
//

import SwiftUI

struct CardView: View {
    var server: Server
    var subTitle: String
    var body: some View {
        HStack(spacing: 15) {
            Text(server.flag)
                .font(.system(size: 45))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(server.name)
                    .font(.system(size: 22))
                    .foregroundStyle(.black)
                
                if subTitle != "" {
                    Text(subTitle)
                        .foregroundStyle(.gray)
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 24))
                .foregroundStyle(.black)
        }
        .padding(.leading, 10)
        .padding(.trailing)
        .padding(.vertical)
    }
}
