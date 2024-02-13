//
//  modelTTS.swift
//  TTS-IOS
//
//  Created by macOS abel on 17/09/23.
//

import Foundation
import AVFoundation


struct TTS{
    let synthesizer = AVSpeechSynthesizer()
    var text: String
    var rate: Float
    
    init(text: String = "apple", rate: Float = 0.3) {
        self.text = text
        self.rate = rate
    }
    
    func speakText(to texto: String = "apple"){
        let utterance = AVSpeechUtterance(string: texto)
        utterance.rate = rate
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synthesizer.speak(utterance)
    }
    /*
    func changeRatio(to rate: Float){
        self.rate = rate
    }
*/
}



