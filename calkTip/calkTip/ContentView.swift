//
//  ContentView.swift
//  calkTip
//
//  Created by днс on 03.01.2021.
//

import SwiftUI



struct ContentView: View {
    @State private var scorePickerTip = 0
    @State private var scorePicker = 2
    @State private var textFieldIntAmout = ""
    var arrayPerson = [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    var arrayTipsPercent = [0, 5, 10, 15, 20]
    
    var totalPerson: Double {
        let peopleCount = Double(scorePicker + 2)
        let tipSelection = Double(arrayTipsPercent[scorePickerTip])
        let orderAmount = Double(textFieldIntAmout) ?? 0
        let tipValue = orderAmount / 100 + tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerson = grandTotal / peopleCount
        
        return amountPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
            Section {
                
                    TextField("Сумма", text: $textFieldIntAmout)
                        .keyboardType(.decimalPad)
                    Picker(selection: $scorePicker, label: Text("Количество людей"), content: {
                        
                        ForEach(0..<arrayPerson.count) {
                            Text("\(String(arrayPerson[$0])) человека")
                        }
                    })
                }
                
            
            Section(header: Text("Сколько хотите чаевых оставить")){
                
                    Picker(selection: $scorePickerTip, label: Text(""), content: {
                        ForEach(0..<arrayTipsPercent.count) {
                            Text("\(String(self.arrayTipsPercent[$0]))%")
                        }
                    }).pickerStyle(SegmentedPickerStyle())
                    
            }
                Section{
                    Text("\(totalPerson, specifier: "%.2f")")
                }
                
            }
            .navigationBarTitle("Калькулятор чаевых", displayMode: .inline)
        }
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
