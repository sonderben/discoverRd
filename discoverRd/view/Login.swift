//
//  Login.swift
//  discoverRd
//
//  Created by Benderson Phanor on 29/6/23.
//

import SwiftUI

struct Login: View {
    @State var correo = ""
    @State var pwd = ""
    var body: some View {
        NavigationView {
            ZStack {
                        Image("rd")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width)
                            .scaledToFill()
                VStack{
                    HStack {
                        Text("DiscoverRd")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding(.leading)
                            .padding(.vertical)
                        Spacer()
                    }
                    Spacer()
                    Group{
                        TextField("Email", text: $correo)
                            
                        TextField("Password", text: $pwd)
                            
                    }
                    .font(.system(size: 24))
                    .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    Button {
                        UserDefaults.standard.setValue(true, forKey: "IS_LOGIN")
                        
                    } label: {
                        Text("Login")
                            .foregroundColor(.white)
                            .frame(width: 200)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                    
                    HStack{
                        Text("Login up with ") + Text("Google")
                            .font(.callout)
                            .foregroundColor(.blue)
                        Text("or") + Text(" Apple")
                            .foregroundColor(.blue)
                            .font(.callout)
                    }
                    
                    
                    Spacer()
                        .frame(height: 100)
                    
                    NavigationLink {
                        SignUp()
                    } label: {
                        VStack{
                            Text("Forgot password?")
                                .foregroundColor(.blue)
                            Text("Don't have an account? ").foregroundColor(.black) + Text("Sign up")
                                //.foregroundColor(.blue)
                        }
                    }

                    Spacer()
                }
            }
            .background(.gray.opacity(0.2))
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
        
    }
}



struct SignUp: View {
    @State var fullName = ""
    @State var correo = ""
    @State var live = false
    @State var flag = "🇭🇹"
    @State var nationality = ""
    var body: some View {
        ZStack {
            Image("rd")
                .resizable()
                .frame(width: UIScreen.main.bounds.width)
                .scaledToFill()
            VStack{
                HStack {
                    Text("DiscoverRd")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .padding(.leading)
                        .padding(.vertical)
                    Spacer()
                }
                Spacer()
                
                Circle()
                    .foregroundColor(.gray.opacity(0.1))
                    .frame(width: 100,height: 100)
                    .overlay( Circle().stroke(Color.gray,lineWidth:2.0) )
                    .overlay(Image(systemName: "person").font(.system(size: 40)).foregroundColor(.blue))
                    .shadow(radius: 10)
                Group{
                    TextField("*Full name", text: $fullName)
                        
                    TextField("*Correo", text: $correo)
                        
                }
                .font(.system(size: 24))
                .textFieldStyle(.roundedBorder)
                    .padding()
                
                HStack {
                    Picker("Nationality", selection: $flag) {
                        Text("🇭🇹")
                        Text("🇺🇸")
                        Text("🇭🇹")
                    }.pickerStyle(.menu)
                    TextField("*select nationality", text: $nationality)
                        .font(.system(size: 24))
                }.background(.white)
                    .cornerRadius(5)
                    .padding(.top)
                    .padding(.horizontal)
                
                
                Toggle(isOn: $live) {
                    HStack {
                        Text("I live in Dominican Re")
                            .foregroundColor(.gray)
                            .padding(.leading)
                            
                    }
                   
                    
                }.padding(.trailing)
                    .padding(.vertical,2)
                .background(.white)
                .cornerRadius(5)
                    .padding(.horizontal)
                    .padding(.top)
                    
                
                
                Button {
                    
                } label: {
                    Text("Sign up")
                        .foregroundColor(.white)
                        .frame(width: 200)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(10)
                }
                
            
                
                
                Spacer()
                    .frame(height: 100)
                
                HStack{
                    Text("Sign up with ") + Text("Google")
                        .font(.callout)
                        .foregroundColor(.blue)
                    Text("or") + Text(" Apple")
                        .foregroundColor(.blue)
                        .font(.callout)
                }
                Spacer()
            }
        }.background(.gray.opacity(0.2))
    }
}
