//
//  ContentView.swift
//  How Much
//
//  Created by Eric on 19/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                ForEach(7...9, id: \.self) { number in
                    numberButton(number: String(number))
                }
            }
            HStack {
                ForEach(4...6, id: \.self) { number in
                    numberButton(number: String(number))
                }
            }
            HStack {
                ForEach(1...3, id: \.self) { number in
                    numberButton(number: String(number))
                }
            }
            HStack {
                numberButton(number: "0")
                numberButton(number: ".")
                Button {
                    
                } label: {
                    Image(systemName: "delete.backward.fill")
                        .font(.largeTitle)
                        .bold()
                        .frame(width: 80, height: 80)
                        .background(.gray)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }

            }
        }
        
        
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
