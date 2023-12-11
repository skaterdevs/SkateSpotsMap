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
    @State var notDownloaded = true
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
                LazyHStack(spacing: 10) {
                    // TODO: make show skateSpot.photos
                    ForEach(images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 150, height: 150, alignment: .center)
                            .clipShape(Rectangle())
                    }
                }
            }.onAppear() { downloadImages(image_keys: skateSpot!.photos) }
            
        }
        
        Divider().frame(height: 15)
        
        // overview and reviews
        
        SkateSpotOverviewView(skateSpot: skateSpot!)
        
        Spacer()
    }
    
    func downloadImages(image_keys: [String]) {
        if notDownloaded {
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
            notDownloaded = false
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
