//
//  viewModelTTS.swift
//  TTS-IOS
//
//  Created by macOS abel on 18/09/23.
//


import Foundation
class viewModelTTS: ObservableObject{
    let model = TTS(text: "apple", rate: 0.3)
    @Published var elements: [Element] = []

    func fetchData() async throws -> [Element]{
        let url = URL(string: "https://unabel.github.io/db.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let datos = try JSONDecoder().decode([Element].self, from: data)
        DispatchQueue.main.async {
            self.elements = datos
        }
        return datos
    }
    
    func speakText(to text:String){
        model.speakText(to: text)
    }
    /*
    func changeRatio(to rate: Float){
        model.changeRatio(to: rate)
    }
    */
   
}
