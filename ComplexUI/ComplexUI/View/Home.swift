//
//  Home.swift
//  ComplexUI
//
//  Created by Edgar Guitian Rey on 15/7/24.
//

import SwiftUI

struct Home: View {
    var gradient1 = [Color(.blue.opacity(0.6)),
                    Color(.blue.opacity(0.6)),
                    Color(.green)]
    var gradient = [Color(.blue),
                    Color(.blue.opacity(0.8)),
                    Color(.blue.opacity(0.6)),
                    Color(.green)]
    
    @StateObject var serverData = ServerViewModel()

    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("COMPLEX UI")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .padding()
                    
                    Spacer()
                    
                    Text("STATUS")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text(serverData.isConnnected ? "CONNECTED" : "DISCONNECTED")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .padding(.bottom, 20)
                }
                .frame(height: UIScreen.main.bounds.height / 3.3)
                
                // Button
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                    
                    LinearGradient(gradient: .init(colors: gradient1), startPoint: .top, endPoint: .bottom)
                        .clipShape(CustomShape())

                    VStack {
                        Button(action: {
                            serverData.isConnnected.toggle()
                        }, label: {
                            VStack(spacing: 15) {
                                Image(systemName: "power")
                                    .font(.system(size: 70))
                                    .foregroundStyle(serverData.isConnnected ? .red : .green)
                                
                                Text(serverData.isConnnected ? "STOP" : "START")
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black)
                            }
                            .padding(50)
                            .background(
                                LinearGradient(gradient: .init(colors: gradient), startPoint: .top, endPoint: .bottom)
                            )
                            .clipShape(Circle())
                            .padding(15)
                            .background(
                                Color.blue.opacity(0.2)
                            )
                            .clipShape(Circle())
                        })
                        .offset(y: -65)
                        .padding(.bottom, -65)
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation {
                                serverData.showSheet.toggle()
                            }
                        }, label: {
                            CardView(server: serverData.currentServer, subTitle: "")
                                .background(BlurView())
                                .clipShape(Capsule())
                                .padding()
                            
                        })
                        
                        Spacer()
                    }
                }
                .padding(.top, 60)
                
                
                
            }
            
            BottomSheet(serverData: serverData)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            ZStack {
                LinearGradient(gradient: .init(colors: gradient), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                Color.black.opacity(0.5)
                    .ignoresSafeArea(.all, edges: .top)
            }
        )
    }
}

#Preview {
    Home()
}
