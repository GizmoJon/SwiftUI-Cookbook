//
//  signUpView.swift
//  signUp
//
//  Created by Edgar Nzokwe on 4/22/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI

struct signUpView: View {
    @State private var fname = ""
    @State private var lname = ""
    @State private var street = ""
    @State private var city = ""
    @State private var zip = ""
    @State private var lessThanTwo = false
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Names")){
                    TextField("First Name", text: $fname)
                    TextField("Last Name" , text: $lname)
                }
                Section(header:Text("Current Address")){
                    TextField("Street Address" , text: $street)
                    TextField("City" , text: $city)
                    TextField("Zip" , text: $zip)
                    Toggle(isOn: $lessThanTwo){
                        Text("Have you lived here for 2+ years")
                    }
                }
                if !lessThanTwo{
                    Section(header:Text("Previous Address")){
                        TextField("Street Address" , text: $street)
                        TextField("City" , text: $city)
                        TextField("Zip" , text: $zip)
                    }
                }
                Section() {
                    TextField("Create Username" , text: $username)
                    SecureField("Password", text: $password)
                }
                
                Button(action: {
                    print("Form submit action here")
                }){
                    Text("Submit")
                  
                }
              
            }.navigationBarTitle("Sign Up")
        }
    }
}

struct signUpView_Previews: PreviewProvider {
    static var previews: some View {
        signUpView()
    }
}
