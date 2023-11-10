//
//  ReviewHeader.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 11/9/23.
//

import SwiftUI

struct ReviewListHeaderView: View {
    var skateSpot: SkateSpot
    var body: some View {
        Text(skateSpot.name)
            .font(.largeTitle)
            .fontWeight(.bold)
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding(.leading, 20)
            .multilineTextAlignment(.center)
        //HStack{
            //Average Rating
            //VStack{
                Text(String(skateSpot.rating_avg))
                    .fontWeight(.bold)
//                    .padding(.top, 10)
                    .multilineTextAlignment(.center)
                //Stars for average rating
                HStack{
                    ForEach(0..<Int(skateSpot.rating_avg)){_ in
                        Image(systemName: "star.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10)
                            
                    }
                    ForEach(0..<5-Int(skateSpot.rating_avg)){_ in
                        Image(systemName: "star")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFit()
                            .frame(width: 10)
                    }
                    Text("(\(skateSpot.reviews.count))").fontWeight(.light)
                        .font(.system(size: 12))
                }
                
            //}.padding(.leading, 50).padding(.top, 10)
            Spacer()
        //}
    }
}

//struct ReviewHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewHeader()
//    }
//}
