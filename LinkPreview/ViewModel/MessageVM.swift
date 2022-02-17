//
//  MessageVM.swift
//  LinkPreview
//
//  Created by Stanley Pan on 2022/02/17.
//

import SwiftUI

class MessageVM: ObservableObject {
    @Published var message: String = ""
    @Published var messages: [Message] = []
    
    func sendMessage() {
        if !isMessageURL() {
            addToMessage()
            return
        }
        
        // Extract URL metadata
        guard let url = URL(string: message) else { return }
        let urlMessage = Message(messageString: message, previewLoading: true, linkURL: url)
        messages.append(urlMessage)
    }
    
    func isMessageURL() -> Bool {
        if let url = URL(string: message) {
            return UIApplication.shared.canOpenURL(url)
        }
        
        return false
    }
    
    func addToMessage() {
        messages.append(Message(messageString: message))
        message = ""
    }
}
