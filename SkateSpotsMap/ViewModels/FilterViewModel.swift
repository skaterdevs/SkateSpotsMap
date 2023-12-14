//
//  SearchViewModel.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/7/23.
//

import Foundation

class FilterViewModel: ObservableObject {
    private var skateSpotRepository = SkateSpotRepository()

    @Published var noResults : Bool = false

    //@Published var test : String = ""
    @Published var kickout : String = "N/A"
    @Published var minAvgRating : Int = 1
    @Published var maxDistance : Double = 5.0
    @Published var selectedFeatures : [String:Bool] = ["Walls" : false,
                                                       "Banks" : false,
                                                       "Ledges" : false,
                                                       "Curbs" : false]
//    static let allTags = ["Clean", "New", "Popular", "Dirty", "Safe", "City Areas",
//                          "Beginner Friendly", "Dangerous"]
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
                //&& validDistance(skateSpot: spot)
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
            //print(validFeatures)
//            print(skateSpot.name)
            print("Selected:")
            print(skateSpot.features)
            //print(skateSpot.distance)
            print("")
            
            return true
        }
        print("Not Selected:")
        print(skateSpot.features)
        return false
    }
    
    func validTags(skateSpot : SkateSpot) -> Bool{
        let validTags : [String] = selectedTags.filter{$0.value == true}.map({ $0.key })
        if (skateSpot.tags.filter{validTags.contains($0)}).count == validTags.count || validTags.count == 0{
            return true
        }
        return false
    }
    //same behavior as n/a tag; if no reviews it will always be included
    func validRating(skateSpot : SkateSpot) -> Bool{
        if skateSpot.rating_avg >= Float(minAvgRating) || skateSpot.rating_sum == 0{
            return true
        }
        return false
    }
    
    //not functioning
    func validDistance(skateSpot : SkateSpot) async throws -> Bool{
//        var distanceString = try await SkateSpotViewModel().getDist(
//            sLat: locationManager.userLatitude(),
//            sLong: locationManager.userLongitude(),
//            dLat: skateSpot.location.latitude,
//            dLong: skateSpot.location.longitude)
//        print(distanceString)
        return true
    
    }
    
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
////
    

    
}
