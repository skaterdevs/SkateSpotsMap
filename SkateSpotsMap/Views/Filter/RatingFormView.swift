//
//  RatingFormView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/13/23.
//

import SwiftUI

struct RatingFormView: View {
    @EnvironmentObject var filterViewModel : FilterViewModel
    @State var inputRating : Int
    var body: some View {
        Picker(selection: $inputRating, label: Text("Minimum Average Rating"))
        {
            ForEach(1..<6, id:\.self){i in
                Text("\(i)")
            }
        }
        .onChange(of: inputRating){newInput in
            var _ = print(inputRating)
            filterViewModel.minAvgRating = inputRating
        }
    }
}

//struct RatingFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        RatingFormView()
//    }
//}
