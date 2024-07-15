//
//  BottomSheet.swift
//  ComplexUI
//
//  Created by Edgar Guitian Rey on 15/7/24.
//

import SwiftUI

struct BottomSheet: View {
    @ObservedObject var serverData: ServerViewModel
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var offset: CGFloat = 0

    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 12) {
                Capsule()
                    .fill(Color.gray)
                    .frame(width: 60, height: 4)
                
                Text("SELECT SERVER")
                    .foregroundStyle(.gray)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 10) {
                        ForEach(serverData.servers) { server in
                            CardView(server: server, subTitle: serverData.currentServer.name == server.name ? "CURRENTLY SELECTED" : "")
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    serverData.currentServer = server
                                    withAnimation {
                                        serverData.showSheet.toggle()
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .padding(.bottom)
                    .padding(.bottom, edges?.bottom)
                }
                .frame(height: UIScreen.main.bounds.height / 3)
            }
            .padding(.top)
            .background(BlurView().clipShape(CustomCorner(corners: [.topLeft, .topRight])))
            .offset(y: offset)
            .gesture(DragGesture().onChanged(onChanged(value: )).onEnded(onEnded(value:)))
            .offset(y: serverData.showSheet ? 0 : UIScreen.main.bounds.height)
        }
        .ignoresSafeArea()
        .background(
            Color.black.opacity(serverData.showSheet ? 0.3 : 0).ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        serverData.showSheet.toggle()
                    }
                }
        )
    }
    
    func onChanged(value: DragGesture.Value) {
        if value.translation.height > 0 {
            offset = value.translation.height
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        if value.translation.height > 0 {
            withAnimation(.easeIn(duration: 0.2)) {
                let height = UIScreen.main.bounds.height / 3

                if value.translation.height > height / 1.5 {
                    serverData.showSheet.toggle()
                }
                offset = 0
            }
        }
    }
}

#Preview {
    BottomSheet(serverData: ServerViewModel())
}
