//
//  NewSkateSpotView.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/7/23.
//

import SwiftUI
import GoogleMaps
import PhotosUI
import FirebaseFirestore
import Amplify

struct NewSkateSpotView: View {
    @ObservedObject var skateSpotViewModel = SkateSpotViewModel()
    @State private var location = 1
    @State private var name = String()
    @State private var photos = [String]()
    @State private var features = [String]()
    @State private var selectedMarker: GMSMarker?
    @State private var selectedItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    @State private var selectedUIImage = [UIImage]()
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            
//            Text("Add Skate Spot")
//                .font(.largeTitle)
//                .fontWeight(.bold)
            
            VStack(alignment: .center, spacing: 12) {
                
                Divider()
            }
            // location selection
            Text("Location").font(.title3).fontWeight(.semibold)
            AddSpotGoogleMapViewModel(selectedMarker: $selectedMarker)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 200.00)
        
            // name field
            Text("Name").font(.title3).fontWeight(.semibold)
            TextField("Name your new spot...", text: $name)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<selectedImages.count, id: \.self) { i in
                        selectedImages[i]
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 150, height: 150, alignment: .center)
                            .clipShape(Rectangle())
                    }
                }
            }
            
            // photo entry field
            Text("Photos").font(.title3).fontWeight(.semibold)
            PhotosPicker("Select Images", selection: $selectedItems, matching: .images)
                .onChange(of: selectedItems) { _ in
                    Task {
                        selectedImages.removeAll()
                        
                        for item in selectedItems {
                            if let data = try? await item.loadTransferable(type: Data.self) {
                                if let uiImage = UIImage(data: data) {
                                    let image = Image(uiImage: uiImage)
                                    selectedUIImage.append(uiImage)
                                    selectedImages.append(image)
                                }
                            }
                        }
                    }}
            
            // feature selection
            Text("Select Available Features").font(.title3).fontWeight(.semibold)
            HStack {
                ForEach(Feature.allFeatures, id: \.self) { value in
                    Button(action: {
                        if let index = features.firstIndex(of: value) {
                          features.remove(at: index)
                        } else {
                          features.append(value)
                        }
                    }) {
                        Text("\(value)").font(.system(size: 10))
                        if features.contains(value) {
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
            
            // submit
//            Button("Submit Button") {
//                addSkateSpot()
//                let _ = print(photos)
//                clearFields()
//            }
            .padding()
            .background(.blue)
            .cornerRadius(10)
            .foregroundColor(.white)
            .fontWeight(.medium)
                
        }.padding([.bottom, .horizontal],12).frame(maxWidth: .infinity)
    }
    
    func addSkateSpot() {
        uploadImages()
        let loc = GeoPoint(latitude: selectedMarker?.position.latitude ?? 0.0, longitude: selectedMarker?.position.longitude ?? 0.0)
        let skateSpot = SkateSpot(name: name,
                                  location: loc,
                                  photos: photos,
                                  features: features,
                                  overall_kickout: Kickout.na.rawValue,
                                  low_kickout: 0,
                                  medium_kickout: 0,
                                  high_kickout: 0,
                                  rating_sum: 0,
                                  rating_avg: 0.0,
                                  tags: [String](),
                                  reviews: [Review]())
        skateSpotViewModel.add(skateSpot: skateSpot)
    }
    func uploadImages() {
        print(selectedUIImage.count)
        // Generate UUIDs for each image
        var imageUploads: [(String, UIImage)] = selectedUIImage.map { uiImage in
            (UUID().uuidString, uiImage)
        }
        print(imageUploads)
        imageUploads.forEach { (imageKey, uiImage) in
            let imageData = uiImage.jpegData(compressionQuality: 0.75)!
            
            Amplify.Storage.uploadData(key: imageKey, data: imageData) { result in
                switch result {
                case .success(let uploadedData):
                    self.photos.append(uploadedData)
                    print(uploadedData)
                case .failure(let error):
                    print(error)
                }
            }
        }
        photos = imageUploads.map { (key, value) in key }
    }
    
    func clearFields() {
        name = ""
        features = [String]()
        selectedMarker = nil
        selectedItems = [PhotosPickerItem]()
        selectedImages = [Image]()
        selectedUIImage = [UIImage]()
        photos = [String]()
    }
}

//#Preview {
//    NewSkateSpotView()
//}
