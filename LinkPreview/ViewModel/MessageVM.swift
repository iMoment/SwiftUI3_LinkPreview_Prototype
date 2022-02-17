//
//  MessageVM.swift
//  LinkPreview
//
//  Created by Stanley Pan on 2022/02/17.
//

import SwiftUI
import LinkPresentation

class MessageVM: ObservableObject {
    @Published var message: String = ""
    @Published var messages: [Message] = []
    
    func sendMessage() {
        if !isMessageURL() {
            addToMessage()
            return
        }
    
        guard let url = URL(string: message) else { return }
        let urlMessage = Message(messageString: message, previewLoading: true, linkURL: url)
        messages.append(urlMessage)
        
        // MARK: Extracting metadata
        let provider = LPMetadataProvider()
        provider.startFetchingMetadata(for: url) {[self] meta, error in
            // Failure
            DispatchQueue.main.async {
                self.message = ""
                
                if let _ = error {
                    addToMessage()
                    return
                }
                
                guard let meta = meta else {
                    addToMessage()
                    return
                }
                // Success
                if let index = messages.firstIndex(where: { message in
                    return urlMessage.id == message.id
                }) {
                    messages[index].linkMetaData = meta
                }
            }
        }
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
