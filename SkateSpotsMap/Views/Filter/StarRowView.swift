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
            //Need a way to add to filters
            Button{
                
            }
            label:{ StarRatingView(filled: 5)}.padding(2)
            
            Button{
                
            }
            label:{ StarRatingView(filled: 4)}.padding(5)
            
            Button{
                
            }
            label:{ StarRatingView(filled: 3)}.padding(5)
            
            Button{
                
            }
        
            label:{ StarRatingView(filled: 2)}.padding(5)
            
            Button{
                
            }label:{ StarRatingView(filled: 1)}.padding(5)
        }
    }
}

//struct StarRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        StarRowView()
//    }
//}
