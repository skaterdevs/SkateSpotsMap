//
//  iOSCheckboxToggleStyle.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/1/23.
//

import SwiftUI

struct iOSCheckboxToggleStyle: View {
    func makeBody(configuration: Configuration) -> some View {
            // 1
            Button(action: {

                // 2
                configuration.isOn.toggle()

            }, label: {
                HStack {
                    // 3
                    Image(systemName: configuration.isOn ? "checkmark.square" : "square")

                    configuration.label
                }
            })
        }
}
//Toggle(isOn: $checked) {
//    Text("The label")
//}
.toggleStyle(CheckboxStyle())
struct iOSCheckboxToggleStyle_Previews: PreviewProvider {
    static var previews: some View {
        iOSCheckboxToggleStyle()
    }
}
