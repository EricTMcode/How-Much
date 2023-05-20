//
//  TotalView.swift
//  How Much
//
//  Created by Eric on 20/05/2023.
//

import SwiftUI

struct TotalView: View {
    let total: Double
    let tipPct: Int
    let numPeople: Int
    var tipAmount: Double {
        total * Double(tipPct)/100
    }
    var totalAmount: Double {
        total + tipAmount
    }
    var portion: Double {
        totalAmount / Double(numPeople)
    }
    
    let identifier = Locale.current.currency?.identifier ?? ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Grid(horizontalSpacing: 20) {
                    GridRow {
                        Text("Original Bill")
                            .gridColumnAlignment(.leading)
                        Text("\(total, format: .currency(code: identifier))")
                            .gridColumnAlignment(.trailing)
                    }
                    GridRow {
                        Text("Tip")
                        Text("\(tipAmount, format: .currency(code: identifier))")
                    }
                    GridRow {
                        Text("Total")
                        Text("\(totalAmount, format: .currency(code: identifier))")
                    }
                    GridRow {
                        Text("Portion")
                        Text("\(portion, format: .currency(code: identifier))")
                    }
                }
                .font(.title)
                Spacer()
            }
            .navigationTitle("Amount Owing")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TotalView_Previews: PreviewProvider {
    static var previews: some View {
        TotalView(total: 135.20, tipPct: 18, numPeople: 3)
    }
}
