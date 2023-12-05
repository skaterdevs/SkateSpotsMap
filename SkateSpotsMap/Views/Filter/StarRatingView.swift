//
//  StarRatingView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/1/23.
//

import SwiftUI


// star, star.fill, star.leadhalf.filled
struct StarRatingView: View {
    var filled : Int
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<filled, id: \.self) {_ in
                return Image(systemName:"star.fill")
            }
            ForEach(filled..<5, id: \.self) {_ in
                return Image(systemName:"star")
            }
        }
        
    }
}

//struct StarRatingView_Previews: PreviewProvider {
//    static var previews: some View {
//        StarRatingView(filled:3)
//    }
//}
