//
//  ContentView.swift
//  PreventorDemo
//
//  Created by Alexander Rodriguez on 8/03/22.
//

import SwiftUI
import PreventorSDK
import Alamofire

struct ContentView: View, PSDKDelegate {
    func onFinish(result: PSDKResult) {
        print(result)
    }
    
    func onSubmitted(result: PSDKResult) {
        print(result)
    }
    
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
            PSDK.shared.isRegulaComplete({ complete in
                print("OK: ", complete)
            })
        }
    }
    
    init() {
        self.config = PSDKConfig(flowID: .default,
                                 apiKey: "l3Zg6JhInlaEvO2wtgVYQ2tCYU3hKgGe8uIIxWRD",
                                 tenant: "preventor",
                                 env: "playground",
                                 banknu: "6",
                                 secret: "c00fc92f740eb0fbb5fa00955e6494b62f442d770fe736f56a51e7af369f570f")
        PSDK.shared.callBack(delegate: self)
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
 
