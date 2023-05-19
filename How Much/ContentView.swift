//
//  ContentView.swift
//  How Much
//
//  Created by Eric on 19/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        numberButton(number: "1")
        
    
    }
    
    func numberButton(number: String) -> some View {
        Button {
            
        } label: {
            Text(number)
                .font(.largeTitle)
                .bold()
                .frame(width: 80, height: 80)
                .background(.purple)
                .foregroundColor(.white)
                .clipShape(Circle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
