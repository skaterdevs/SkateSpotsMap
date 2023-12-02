//
//  StarRowView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/1/23.
//

import SwiftUI

struct StarRowView: View {
    var body: some View{
        VStack{
            Text("Minimum Rating:")
            Button{
                
            }label:{ StarRatingView(filled: 5)}
            Button{
                
            }label:{ StarRatingView(filled: 4)}
            Button{
                
            }label:{ StarRatingView(filled: 3)}
            Button{
                
            }label:{ StarRatingView(filled: 2)}
            Button{
                
            }label:{ StarRatingView(filled: 1)}
        }
    }
}

struct StarRowView_Previews: PreviewProvider {
    static var previews: some View {
        StarRowView()
    }
}