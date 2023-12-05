//
//  CustomButton.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/5/23.
//

import SwiftUI

struct CustomButton: View {

@State private var didTap:Bool = false

  var body: some View {
    Button(action: {
        self.didTap.toggle()    }) {

    Text("My custom button")
        .font(.system(size: 24))
    }
    .frame(width: 300, height: 75, alignment: .center)
    .padding(.all, 20)
    .background(didTap ? Color.blue : Color.yellow)
  }
}
struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
    }
}
