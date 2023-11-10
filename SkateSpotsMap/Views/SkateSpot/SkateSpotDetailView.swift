//
//  SkateSpotDetailView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/7/23.
//

import SwiftUI
import Amplify

struct SkateSpotDetailView: View {
    @ObservedObject var skateSpotViewModel = SkateSpotViewModel()
    @State var images = [UIImage]()
    var skateSpot: SkateSpot?
  
    var body: some View {
      VStack{
        HStack{
          Text(skateSpot!.name)
            .font(.largeTitle)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
          Button{
            skateSpotViewModel.appleMapsRedirect(skateSpot: skateSpot!)
            } label: {
              Image(systemName: "arrow.triangle.turn.up.right.diamond.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
                .foregroundStyle(.green)
          }
          Spacer()
        }
        
        // image carousel
        ScrollView(.horizontal) {
          HStack(spacing: 10) {
            // TODO: make show skateSpot.photos
            ForEach(images, id: \.self) { image in
                Image(uiImage: image)
                    .frame(width: 200, height: 200)
                    .clipShape(Rectangle())
                    .padding()
            }
          }
        }.onAppear() { downloadImages(image_keys: skateSpot!.photos) }
        
        Divider().frame(height: 15)
        
        // overview and reviews
        HStack {
          Spacer()
          NavigationLink(
            destination: SkateSpotOverviewView(skateSpot: skateSpot!),
            label: {
              Text("Overview")
            })
          Spacer()
          NavigationLink(
            destination: ReviewListView(skateSpot: skateSpot!),
            label: {
              Text("Reviews")
            })
          Spacer()
        }
        
        Divider().frame(height: 15)
        
        SkateSpotOverviewView(skateSpot: skateSpot!)
        
        Spacer()
      }
    }
    
    func downloadImages(image_keys: [String]) {
        image_keys.forEach { image_key in
            Amplify.Storage.downloadData(key: image_key) {
                result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.images.append(UIImage(data: data)!)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

struct SkateSpotDetailView_Previews: PreviewProvider {
  static var previews: some View {
    SkateSpotDetailView(skateSpot: SkateSpot.example)
  }
}

//#Preview {
//  SkateSpotDetailView(skateSpot: .example)
//}
