//
//  FilterWrapperView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/13/23.
//

import SwiftUI


struct FilterWrapperView: View {
    @ObservedObject var skateSpotViewModel = SkateSpotViewModel()
    @StateObject var locationManager = LocationManager()
    @State var distance: String?
    @EnvironmentObject var filterViewModel : FilterViewModel
    var skateSpot : SkateSpot
    
    var body: some View {
        HStack{
            if let unwrapped = distance{
                //Text(unwrapped + " miles away!").font(.subheadline)
                if unwrapped == [unwrapped, String(filterViewModel.maxDistance)].sorted()[0]{
                    SearchRowView(skateSpot: skateSpot).frame(maxHeight:.infinity)
                }
            }
            else{
                EmptyView()
            }
        }
        .task {
            do {
                let sLat = locationManager.userLatitude()
                let sLong = locationManager.userLongitude()
                let dLat = skateSpot.location.latitude
                let dLong = skateSpot.location.longitude
                distance = try await skateSpotViewModel.getDist(sLat: sLat, sLong: sLong, dLat: dLat, dLong: dLong)
            } catch {
                distance = nil
            }
        }
    }
}

//struct FilterWrapperView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterWrapperView()
//    }
//}
