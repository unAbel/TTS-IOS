//
//  ContentView.swift
//  TTS-IOS
//
//  Created by macOS abel on 17/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var currentIndex = 0
    @ObservedObject var instVM = viewModelTTS()
    @State var elements: [Element] = []
    
    var body: some View {
        VStack {
            if instVM.elements.isEmpty {
                Text("Descargando datos...")
            }else {
                VStack{
                    viewTTS(element: instVM.elements[currentIndex])
                        .padding(.horizontal, 20)
                    
                    Spacer()
            
                    HStack(alignment: .bottom) {
                        Button("Anterior") {
                            if currentIndex > 0 {
                                currentIndex -= 1
                            }
                        }.padding(50)
                        Spacer()
                        Button("Siguiente") {
                            if currentIndex < instVM.elements.count - 1 {
                                currentIndex += 1
                            }
                        }.padding(50)
                    }
                }
                .shadow(radius: 5, x: -10, y: -10)
            }
        }
        .onAppear{
            Task{
                try await elements = instVM.fetchData()
                print(instVM.elements.count)
            }
        }
    }
      
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Element: Codable, Hashable {
    let texto1: String
    let texto2: String
    let texto3: String
    let texto4: String
}
