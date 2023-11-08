

import SwiftUI

struct ChatView: View {
    let user: User
    @ObservedObject var viewModel: ChatViewModel
    @State var messageText: String = ""
    
    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                ScrollViewReader { scrollViewProxy in
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(viewModel.messages) { message in
                            MessageView(viewModel: MessageViewModel(message: message))
                        }
                        HStack{ Spacer() }
                            .id("Empty")
                    }
                    .onReceive(viewModel.$count)  { _ in
                        withAnimation(.easeOut(duration: 0.5)) {
                            scrollViewProxy.scrollTo("Empty", anchor: .bottom)
                        }
                    }
                    
                }
               
            }.padding(.top)
            
            MessageInputView(inputText: $messageText, action: sendMessage)
                .padding()
            
        }.navigationTitle(user.username)

    }
    
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}
