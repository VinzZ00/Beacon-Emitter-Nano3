//
//  ContentView.swift
//  BeaconEmiterNano3IOS
//
//  Created by Elvin Sestomi on 20/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel : MainPageViewModel = MainPageViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Button{
                    viewModel.selectedBeacon = viewModel.beacon1
                    viewModel.startEmitting()
                } label: {
                    Text("Activate 1st Beacon")
                        .frame(width: UIScreen.main.bounds.width, height: 30)
                }
                Divider()
                
                Button{
                    viewModel.selectedBeacon = viewModel.beacon2
                    viewModel.startEmitting()
                } label: {
                    Text("Activate 2st Beacon")
                        .frame(width: UIScreen.main.bounds.width, height: 30)
                }
                Divider()
                
                Button{
                    viewModel.selectedBeacon = viewModel.beacon3
                    viewModel.startEmitting()
                } label: {
                    Text("Activate 3st Beacon")
                        .frame(width: UIScreen.main.bounds.width, height: 30)
                }
                Divider()
                
                Button{
                    viewModel.selectedBeacon = viewModel.beacon4
                    viewModel.startEmitting()
                } label: {
                    Text("Activate 4st Beacon")
                        .frame(width: UIScreen.main.bounds.width, height: 30)
                        
                }
                Divider()
                
                if (viewModel.selectedBeacon != nil) {
                    Text("Beacon \(viewModel.selectedBeacon!.identifier), is starting")
                }
                
                Button{
                    viewModel.stopEmitting()
                } label: {
                    Text("Stop Emitting")
                        .frame(width: 200, height: 50)
                        .background(.red)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                        .cornerRadius(10)
                        .padding(.top, 20)
                }
                
            }.navigationTitle("Beacon Emitter")
                .padding()
                .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
