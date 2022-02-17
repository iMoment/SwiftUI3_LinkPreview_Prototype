//
//  Message.swift
//  LinkPreview
//
//  Created by Stanley Pan on 2022/02/17.
//

import SwiftUI
import LinkPresentation

struct Message: Identifiable {
    var id: String = UUID().uuidString
    var messageString: String
    var date: Date = Date()
    var previewLoading: Bool = false
    var linkMetaData: LPLinkMetadata?
    var linkURL: URL?
}
