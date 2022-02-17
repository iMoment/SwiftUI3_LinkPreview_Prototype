//
//  LinkPreview.swift
//  LinkPreview
//
//  Created by Stanley Pan on 2022/02/17.
//

import SwiftUI
import LinkPresentation

struct LinkPreview: UIViewRepresentable {
    var metaData: LPLinkMetadata
    
    func makeUIView(context: Context) -> LPLinkView {
        let preview = LPLinkView(metadata: metaData)
        return preview
    }
    
    func updateUIView(_ uiView: LPLinkView, context: Context) {
        uiView.metadata = metaData
    }
}
