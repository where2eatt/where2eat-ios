//
//  Login.swift
//  where2eat
//
//  Created by stlp on 2/11/24.
//

import SwiftUI
import UIKit

struct Login: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showErrorAlert = false
    @State private var navigateToHome = false
    @AppStorage("username") var storedUsername: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 1, green: 1, blue: 0.9254901960784314)
                    .edgesIgnoringSafeArea(.all)
                
                VStack (alignment: .center) {
                    Text("LOG IN")
                        .font(.title)
                        .font(.custom("Roboto", size: 26))
                        .fontWeight(.bold)
                        .padding(40)
                    
                    TextField("Enter Username", text: $username)
                        .autocapitalization(.none)
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .border(Color.gray, width: 1)
                        .padding()
                    
                    SecureField("Enter Password", text: $password)
                        .autocapitalization(.none)
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .border(Color.gray, width: 1)
                        .padding()
                    
                    Button("LOG IN") {
                        guard let url = URL(string: Constants.apiGatewayUrl + "/user?username=\(username)") else { return }
                        URLSession.shared.dataTask(with: url) { (data, response, error) in
                            if let error = error {
                                print("Error: \(error.localizedDescription)")
                                return
                            }
                            
                            if let httpResponse = response as? HTTPURLResponse {
                                if httpResponse.statusCode == 404 {
                                    showErrorAlert = true
                                } else {
                                    storedUsername = username
                                    navigateToHome = true
                                }
                            }
                        }.resume()
                    }
                    .font(.title2)
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 0.41568627450980394, green: 0.6509803921568628, blue: 0.3803921568627451))
                    .frame(width: 250, height: 50)
                    
                    // Add an alert to show when the user does not exist
                    .alert(isPresented: $showErrorAlert) {
                        Alert(title: Text("Error"), message: Text("User does not exist"), dismissButton: .default(Text("OK")))
                    }
                    
                }
            }
            
            .fullScreenCover(isPresented: $navigateToHome) {
                Home()
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}


