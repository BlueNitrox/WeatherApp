//
//  ChangeLocView.swift
//  Weather
//
//  Created by Felix Hennerich on 13.01.23.
//

import SwiftUI

struct ChangeLocView: View {
    @FocusState private var StateIsFocused: Bool
    @State private var selectedItem: Int? = nil
    @State public var location: String = ""
    
    var body: some View {
        NavigationView{
        ZStack{
                backgroundView(isNight: isNight, refresh: 0)
            VStack(){
                Spacer()
                
                TextField(text: $location, prompt: Text("Location:  (Now : \(name))").font(.system(size: 20, weight: .medium, design: .default)).foregroundColor(.gray)){
                    
                }.frame(width: 300, height: 100)
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                    .onSubmit {
                        getNewLocationData(city: location)
                        sleep(1)
                        getData()
                        hideKeyboard()
                        StateIsFocused = false
                        
                        
                    }.submitLabel(.search)
                    .focused($StateIsFocused)
                
                Spacer()
                Button(action: {
                    getNewLocationData(city: self.location)
                    sleep(1)
                    getData()
                    hideKeyboard()
                    StateIsFocused = false
                }, label: {
                    HStack{
                        Spacer()
                        Text("Change Location").foregroundColor(isNight ? Color.white : Color.black).bold()
                        Spacer()
                    }.accentColor(Color.black)
                        .padding()
                        .background(isNight ? Color(UIColor.darkGray) : Color("darkblue"))
                        .cornerRadius(4.0)
                        .padding(Edge.Set.vertical, 20)
                })
                    
                    Spacer()
                }
            }
        }
        
    }
}

struct ChangeLocView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeLocView()
    }
}
