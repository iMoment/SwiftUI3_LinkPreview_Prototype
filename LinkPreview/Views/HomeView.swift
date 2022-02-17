//
//  HomeView.swift
//  LinkPreview
//
//  Created by Stanley Pan on 2022/02/17.
//

import SwiftUI

struct HomeView: View {
    @StateObject var messageVM: MessageVM = MessageVM()
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 15) {
                    
                }
            }
            .safeAreaInset(edge: .bottom) {
                
                HStack(spacing: 12) {
                    
                    TextField("Enter Message", text: $messageVM.message)
                        .textFieldStyle(.roundedBorder)
                        .textCase(.lowercase)
                        .textInputAutocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "paperplane")
                            .font(.title3)
                    }
                }
                .padding()
                .background(.ultraThinMaterial)
            }
        }
        .preferredColorScheme(.dark)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
