//
//  Test.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/7/23.
//

import SwiftUI

struct Test: View {
//    @State private var selected = 1
//    var body: some View {
//        VStack(spacing: 20) {
//            Picker(selection: $selected, label: Text("Favorite Color")) {
//                Text("Red").tag(1)
//                Text("Green").tag(2)
//                Text("Blue").tag(3)
//                Text("Other").tag(4)
//            }
//            .pickerStyle(.radioGroup)
//
//            Picker(selection: $selected, label: Text("Favorite Color")) {
//                Text("Red").tag(1)
//                Text("Green").tag(2)
//                Text("Blue").tag(3)
//                Text("Other").tag(4)
//            }
//            .pickerStyle(.radioGroup)
//            .horizontalRadioGroupLayout()
//        }
//        .padding(20)
//        .border(Color.gray)
//    }
    @State private var selectedTheme = "Dark"
        let themes = ["Dark", "Light", "Automatic"]
        
        var body: some View {
            NavigationStack {
                Form {
                    Picker("Appearance", selection: $selectedTheme) {
                        ForEach(themes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)

                    Toggle("Bold Text", isOn: .constant(true))
                }
                .navigationTitle("Display & Brightness")
            }
        }
}

//struct Test_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
