//
//  NewReviewView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/7/23.
//

import SwiftUI

struct NewReviewView: View {
  var skateSpot: SkateSpot
  var user: User
  
  
  @State private var rating = 1
  @State private var tags = [String]()
  @State private var comment = ""
  @State private var kickout = ""
  
  var body: some View {
    VStack {
      
      // title
      Text("\(skateSpot.name) Review").font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
      HStack {
        Spacer()
//        Text(user.avatar)
        Image("userIcon").resizable()
          .frame(width: 30.0, height: 30.0).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        Text(user.username)
        Spacer()
      }
      
      Divider().frame(height: 15)
      
      // rating
      HStack {
        Spacer()
        VStack {
          Text("Rate Experience").fontWeight(.medium)
          
        }
        Spacer()
      }
      
      Divider().frame(height: 15)
      
      // tags
      HStack {
        Spacer()
        VStack {
          Text("Select Tags").fontWeight(.medium)
          VStack {
            HStack(spacing: 20) {
              // TODO: make show skateSpot.photos
              ForEach(skateSpot.tags, id: \.self) { tag in
                Text(tag)
                  .padding(10)
                  .overlay(
                    RoundedRectangle(cornerRadius: 30)
                      .stroke(Color.black, lineWidth: 1)
                  )
              }
            }
          }
        }
        Spacer()
      }
      
      Divider().frame(height: 15)
      
      // kickout factor
      HStack {
        Spacer()
        VStack {
          Text("Select Kick-out Factor").fontWeight(.medium)
          VStack {
              HStack(spacing: 20) {
                // TODO: make show feature images
                ForEach(skateSpot.features, id: \.self) { feature in
                  Text(feature)
                }
              }
        
          }
        }
        Spacer()
      }
      
      Divider().frame(height: 15)
      
      // comment
      HStack {
        Spacer()
        VStack {
          Text("Leave a Comment (Optional)").fontWeight(.medium)
          TextField("Share your experience...", text: $comment)
        }
        Spacer()
      }
      
      // submit
      Button("Submit Review") {
//        addReview()
      }.padding(20).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
      
      Spacer()
    }
    Spacer()
  }
  
  private func makeReviewer() -> Reviewer {
    let reviewer = Reviewer(id: user.id ?? "",
                            username: user.username,
                            avatar: user.avatar)
    return reviewer
  }
  
  private func addReview()
  {
      let newReview = Review(id: UUID().uuidString,
                             rating: rating,
                             tags: tags,
                             reviewer: makeReviewer(),
                             comment: comment,
                             kickout: kickout)
  }
}

struct NewReviewView_Previews: PreviewProvider {
  static var previews: some View {
    NewReviewView(skateSpot: SkateSpot.example, user: User.example)
  }
}

//#Preview {
//  NewReviewView(skateSpot: .example, user: .example)
//}
