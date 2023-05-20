//
//  ContentView.swift
//  How Much
//
//  Created by Eric on 19/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var tipPct = 0
    @State private var numPeople = 1
    @State private var total = "0"
    
    var canAddDecimal: Bool {
//        let periods = total.filter({$0 == "."})
//        if periods.count == 0 {
//            return true
//        } else {
//            return false
//        }
        total.filter({$0 == "."}).count == 0 ? true : false
    }
    
    var canAddDigit: Bool {
        guard let decIndex = total.firstIndex(of: ".") else { return true }
        let index = total.distance(from: total.startIndex, to: decIndex)
        return (total.count - index - 1) < 2
    }
    var body: some View {
        NavigationStack {
            VStack {
                Text(total)
                    .font(.system(size: 70))
                    .frame(width: 260, alignment: .trailing)
                    .padding(.vertical, 1)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                
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
                        if total.count == 1 {
                            total = "0"
                        } else {
                            total.removeLast()
                        }
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
                HStack {
                    Text("Tip")
                    Picker("Picker", selection: $tipPct) {
                        ForEach(0...100, id: \.self) { tip in
                            Text("\(tip)%")
                        }
                    }
                    .buttonStyle(.bordered)
                }
                HStack {
                    Text("Number of People")
                    Picker("Number of People", selection: $numPeople) {
                        ForEach(1...20, id: \.self) { numPeople in
                            Text("\(numPeople)")
                        }
                    }
                    .buttonStyle(.bordered)
                }
                HStack {
                    Button("Calculate") {
                        
                    }
                    Button("Clear") {
                        
                    }
                }
                .buttonStyle(.borderedProminent)
                Spacer()
            }
            .navigationTitle("Portion Calculator")
        }
    }
    
    func addDigit(_ number: String) {
        if canAddDigit {
            if number == "." {
                if canAddDecimal {
                    total += number
                }
            } else {
                total = total == "0" ? number : total + number
            }
        }
    }
    
    func numberButton(number: String) -> some View {
        Button {
            addDigit(number)
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
            .tint(.purple)
    }
}
