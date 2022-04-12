//
//  ContentView.swift
//  PreventorDemo
//
//  Created by Alexander Rodriguez on 8/03/22.
//

import SwiftUI
import PreventorSDK

struct ContentView: View, PSDKDelegate {
    
    func onError(error: PSDKErrorCode) {
        print(error)
    }
    
    func onSubmitted() {
        print("Submit")
    }
    
    let config: PSDKConfig
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            HStack (alignment: .center){
                VStack(alignment: .center){
                    Spacer()
                    Text("The button below will start the process, you will integrate this button with your App.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                    PreventorButton()
                        .padding(.top, height * 0.03)
                    Spacer()
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, width * 0.0667)
            }
        }
        .background(Color.white)
        .onAppear {
            PSDK.shared.initialize(config: config)
        }
    }
    
    init() {
        self.config = PSDKConfig(flowID: .default,
                                 apiKey: "",
                                 tenant: "",
                                 env: "",
                                 banknu: "",
                                 secret: "")
    }
    
    func onStart() {
        print("onStart")
    }
    
    func onFinish() {
        print("onFinish")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
