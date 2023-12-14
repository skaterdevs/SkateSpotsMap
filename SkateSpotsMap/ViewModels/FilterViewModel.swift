//
//  SearchViewModel.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/7/23.
//

import Foundation

class FilterViewModel: ObservableObject {
    private var skateSpotRepository = SkateSpotRepository()

    @Published var kickout : String = "N/A"
    @Published var minAvgRating : Int = 1
    @Published var maxDistance : Double = 5.0
    @Published var selectedFeatures : [String:Bool] = ["Walls" : false,
                                                       "Banks" : false,
                                                       "Ledges" : false,
                                                       "Curbs" : false]

    @Published var selectedTags : [String:Bool] = ["Clean":false, "New":false, "Popular":false,
                                                   "Dirty":false, "Safe":false, "City Areas":false,
                                                   "Beginner Friendly":false, "Dangerous":false]

    init(){

    }

    func clearAll(){
        kickout = "N/A"
        minAvgRating = 1
        maxDistance = 5.0
        selectedFeatures = ["Walls" : false,
                            "Banks" : false,
                            "Ledges" : false,
                            "Curbs" : false]
        selectedTags = ["Clean":false, "New":false, "Popular":false,
                        "Dirty":false, "Safe":false, "City Areas":false,
                        "Beginner Friendly":false, "Dangerous":false]
    }

    
    func getFeatureState(feature : String) -> Bool?{
        return selectedFeatures[feature]
    }

    func updateFeatureState(feature : String){
        selectedFeatures[feature]?.toggle()
        print(selectedFeatures)
    }
    
    func getTagState(tag:String) -> Bool?{
        return selectedTags[tag]
    }
    
    func updateTagState(tag:String){
        selectedTags[tag]?.toggle()
        print(selectedTags)
    }
    
    func validSpots(searchText:String) -> [SkateSpot]{
        var spots : [SkateSpot] = []
        
        for spot in skateSpotRepository.skate_spots{
            if validFeatures(skateSpot: spot)
                && validTags(skateSpot: spot)
                && validRating(skateSpot: spot)
                && validName(searchText:searchText, skateSpot:spot)
                && validKickout(skateSpot: spot)
                {
                    spots.append(spot)
                }
        }
        return spots
    }
    
    func validFeatures(skateSpot : SkateSpot) -> Bool{
        let validFeatures : [String] = selectedFeatures.filter{$0.value == true}.map({ $0.key })
        if (skateSpot.features.filter{validFeatures.contains($0)}).count == validFeatures.count || validFeatures.count == 0{
            return true
        }
        return false
    }
    
    func validTags(skateSpot : SkateSpot) -> Bool{
        let validTags : [String] = selectedTags.filter{$0.value == true}.map({ $0.key })
        if (skateSpot.tags.filter{validTags.contains($0)}).count == validTags.count || validTags.count == 0{
            return true
        }
        return false
    }
    //If a spot has no reviews it will show up regardless of miniumum review filter
    func validRating(skateSpot : SkateSpot) -> Bool{
        if skateSpot.rating_avg >= Float(minAvgRating) || skateSpot.rating_sum == 0{
            return true
        }
        return false
    }
    

    //If a spot has no kickout rating it will show up regardless of filter
    func validKickout(skateSpot : SkateSpot) -> Bool {

        if skateSpot.overall_kickout == kickout || skateSpot.overall_kickout == Kickout.na.rawValue || kickout == "N/A" {
            return true
        }
        return false

    }
    
    func validName(searchText:String, skateSpot: SkateSpot) -> Bool{
        
        if skateSpot.name.lowercased().contains(searchText.lowercased()) || searchText.isEmpty{
            return true
        }
        return false
    }
    
    //    func validDistance(skateSpot : SkateSpot) async throws -> Bool{
    //        var distanceString = try await SkateSpotViewModel().getDist(
    //            sLat: locationManager.userLatitude(),
    //            sLong: locationManager.userLongitude(),
    //            dLat: skateSpot.location.latitude,
    //            dLong: skateSpot.location.longitude)
    //        print(distanceString)
    //        return true
    //
    //    }

    
}
