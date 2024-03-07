import SwiftUI
import UIKit

struct Message: Identifiable {
    var id = UUID()
    var text: String
    var isUser: Bool
    var username: String
}

struct Chatroom: View {
    @State private var messages: [Message] = []
    @State private var newMessageText = ""
    @AppStorage("sessionId") var storedSessionId: String?
    @AppStorage("username") var storedUsername: String?
    
    var body: some View {
        VStack {
            List(messages) { message in
                MessageView(message: message)
            }
            HStack {
                TextField("Enter your message", text: $newMessageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Send") {
                    sendMessage()
                }
            }.padding()
        }
        .onAppear {
            messages = getMessages(sessionId: storedSessionId ?? "")
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
                messages = getMessages(sessionId: storedSessionId ?? "")
            }
        }
    }
    
    func sendMessage() {
        if !newMessageText.isEmpty {
            let message = Message(text: newMessageText, isUser: true, username: storedUsername ?? "")
            messages.append(message)
            postMessage(sessionId: storedSessionId ?? "", username: storedUsername ?? "", message: newMessageText)
            newMessageText = ""
        }
    }
}

struct MessageView: View {
    var message: Message

    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
                Text(message.text)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(Color(red: 1, green: 1, blue: 0))
                    .cornerRadius(8)
            } else {
                Text(message.text)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(Color(red: 1, green: 1, blue: 0))
                    .cornerRadius(8)
                Spacer()
            }
        }
    }
}

struct Chatroom_Previews: PreviewProvider {
    static var previews: some View {
        Chatroom()
    }
}
