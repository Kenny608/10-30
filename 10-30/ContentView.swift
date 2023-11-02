//
//  ContentView.swift
//  10-30
//
//  Created by Kenny Luchau on 11/2/23.
//

import SwiftUI
struct ContentView: View {
    @State var message = ""
    @State var sliderValue = 0.0
    enum Response {
        case success
    }
    var body: some View {
        VStack {
            Button("Click Me") {
                let startTime = NSDate()
                callFunction()
                let endTime = NSDate()
                message = "Completed in \(endTime.timeIntervalSince(startTime as Date)) seconds."
            }
            Spacer()
            Slider(value: $sliderValue)
            Text("Message = \(message)")
        }
    }
    func waiting() async throws -> Response {
        Thread.sleep(forTimeInterval: 20)
        return Response.success
    }
    
    // DOESN'T THIS WORK ALREADY LIKE THIS OR IS THERE MORE?!?!?!?!?!?!?!?
    
    func callFunction() {
        Task(priority: .high) {
            do {
                _ = try await waiting()
            } catch {
                
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
