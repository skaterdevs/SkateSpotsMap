//
//  TextFieldTest.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/1/23.
//

import SwiftUI


struct TextView: UIViewRepresentable {
    @Binding var text: NSMutableAttributedString

    func makeUIView(context: Context) -> UITextView {
        UITextView()
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = text
    }
}
struct TestView: View {
    @State var text = NSMutableAttributedString(string: "")

    var body: some View {
        TextView(text: $text)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
struct TextFieldTest_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
