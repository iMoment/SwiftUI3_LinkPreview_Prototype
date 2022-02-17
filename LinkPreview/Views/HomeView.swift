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
                    
                    ForEach(messageVM.messages) { message in
                        
                        CardView(message: message)
                    }
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
                        messageVM.sendMessage()
                    } label: {
                        Image(systemName: "paperplane")
                            .font(.title3)
                    }
                }
                .padding()
                .padding(.top)
                .background(.ultraThinMaterial)
            }
            .navigationTitle("Link Preview")
        }
        .preferredColorScheme(.dark)
        
    }
    
    @ViewBuilder
    func CardView(message: Message) -> some View {
        Group {
            if message.previewLoading {
                Group {
                    if let metaData = message.linkMetaData {
                        LinkPreview(metaData: metaData)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getScreenSize().width - 80, alignment: .leading)
                            .cornerRadius(15)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    } else {
                        
                        HStack(spacing: 10) {
                            Text(message.linkURL?.host ?? "")
                                .font(.caption)
                            
                            ProgressView()
                                .tint(Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color.gray.opacity(0.35))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            } else {
                // MARK: Normal message
                Text(message.messageString)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .frame(width: getScreenSize().width - 80, alignment: .trailing)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension View {
    func getScreenSize() -> CGRect {
        return UIScreen.main.bounds
    }
}
