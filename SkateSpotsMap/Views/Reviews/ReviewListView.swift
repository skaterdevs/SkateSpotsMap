//
//  ReviewListView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/7/23.
//

import SwiftUI

struct ReviewListView: View {
    var skateSpot: SkateSpot
    var body: some View {
        NavigationStack{
            VStack{
                Text(skateSpot.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                HStack{
                    //Average Rating
                    VStack{
                        Text(String(skateSpot.rating_avg))
                            .fontWeight(.bold)
                            .padding(.top, 10)
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
                        
                    }.padding(.leading, 50).padding(.top, 10)
                    Spacer()
                }
                
                Divider()
                
                //Leave a review
                NavigationLink(
                    destination: NewReviewView(skateSpot:skateSpot, user: User.example),
                    label:{
                        Spacer()
                        VStack{
                            Text("Leave a Review")
                            HStack{
                                ForEach(0..<5){_ in
                                    Image(systemName: "star")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .scaledToFit()
                                        .frame(width: 12)
                                }
                            }
                        }
                        Spacer()
                    }
                ).padding([.top, .bottom], 20)
                
                Divider()
                
                //Reviews Stack
                VStack{
                    Text("Reviews")
                        .font(.title)
                        .fontWeight(.light)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                        .padding([.leading, .bottom],20)
                    //List of rows of reviews
                    List{
                        ForEach([Review.example, Review.example2, Review.example3]){
                            review in
                            VStack{
                                Text(review.reviewer.username).multilineTextAlignment(.leading)
                                HStack{
                                    ForEach(0..<review.rating){_ in
                                        Image(systemName: "star.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 10)
                                        
                                    }
                                    ForEach(0..<5-review.rating){_ in
                                        Image(systemName: "star")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .scaledToFit()
                                            .frame(width: 10)
                                    }
                                }
                                var comment = review.comment ?? ""
                                if comment != ""{
                                    Text(comment)
                                }
                                
                            }
                            
                        }
                    }
                    
                }

            }
            Spacer()
            
            
        }
    }
}

struct ReviewListView_Previews: PreviewProvider {
  static var previews: some View {
    ReviewListView(skateSpot: SkateSpot.example)
  }
}

//#Preview {
//  ReviewListView(skateSpot: .example)
//}
