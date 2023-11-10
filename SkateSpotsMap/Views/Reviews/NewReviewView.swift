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
  
  let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
  
  @ObservedObject var reviewViewModel = ReviewViewModel()
  
  @State private var rating = 1
  @State private var tags = [String]()
  @State private var comment = ""
  @State private var kickout = ""
  
    var body: some View {
        ScrollView(.vertical){
            VStack {
                Text("\(skateSpot.name) Review").font(.largeTitle).fontWeight(.bold)
                
                HStack {
                    Spacer()
                    Image("userIcon").resizable()
                        .frame(width: 30.0, height: 30.0).clipShape(Circle())
                    Text(user.username)
                    Spacer()
                }
                
                Divider().frame(height: 15)
                
                VStack {
                    HStack {
                        Spacer()
                        VStack {
                            Text("Rate Experience").fontWeight(.medium)
                            Picker(selection: $rating, label: Text("Rating")) {
                                Text("1").tag(1)
                                Text("2").tag(2)
                                Text("3").tag(3)
                                Text("4").tag(4)
                                Text("5").tag(5)
                            }.pickerStyle(.segmented)
                        }
                        Spacer()
                    }
                    
                    Divider().frame(height: 15)
                    
                    // tags
                    HStack {
                        Spacer()
                        VStack {
                            Text("Select Tags").fontWeight(.medium)
                            ScrollView {
                                HStack {
                                    LazyVGrid(columns: columns) {
                                        ForEach(Tag.allTags, id: \.self) { tag in
                                            Button(action: {
                                                if let index = tags.firstIndex(of: tag) {
                                                    tags.remove(at: index)
                                                } else {
                                                    tags.append(tag)
                                                }
                                            }) {
                                                Text("\(tag)")
                                                if tags.contains(tag) {
                                                    Image(systemName: "checkmark")
                                                }
                                            }
                                            .padding(10)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 30)
                                                    .stroke(Color.black, lineWidth: 1)
                                            )
                                        }
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
                            
                            Picker(selection: $kickout, label: Text("Kick-out Factor")) {
                                ForEach(Kickout.allKickout, id: \.self) { value in
                                    Text(value)
                                }
                            }.pickerStyle(.segmented)
                        }
                        Spacer()
                    }
                    
                    Divider().frame(height: 15)
                    
                    // comment
                    HStack {
                        Spacer()
                        VStack {
                            Text("Leave a Comment (Optional)").fontWeight(.medium)
                            TextField("Share your experience...", text: $comment, axis: .vertical).padding()
                                .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                                .padding()
                        }
                        Spacer()
                    }.padding(.bottom, 10.0)
                    
                    // submit
                    Button("Submit Button") {
                        addReview()
                    }
                    .padding()
                    .background(.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    Spacer()
                }
            }
        }
    }
  
    private func makeReviewer() -> Reviewer {
        let reviewer = Reviewer(id: user.id ?? "",
                                username: user.username,
                                avatar: user.avatar)
        return reviewer
    }

    private func createReview() -> Review {
        let newReview = Review(id: UUID().uuidString,
                               rating: rating,
                               tags: tags,
                               reviewer: makeReviewer(),
                               comment: comment,
                               kickout: kickout)
        return newReview
    }

    private func addReview() {
        let newReview: Review = createReview()
        reviewViewModel.add(skateSpot: skateSpot, review: newReview)
    }
}

struct NewReviewView_Previews: PreviewProvider {
    static var previews: some View {
        NewReviewView(skateSpot: SkateSpot.example, user: User.example)
    }
}
