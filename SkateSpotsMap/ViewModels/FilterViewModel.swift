//
//  SearchViewModel.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/7/23.
//

import Foundation

class FilterViewModel: ObservableObject {
    private var skateSpotRepository = SkateSpotRepository()
    //@Published var test : String = ""
    @Published var kickout : String = "Low"
    @Published var minAvgRating : Int = 3
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
        kickout = "Low"
        minAvgRating = 3
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
    
    func validSpots() -> [SkateSpot]{
        var spots : [SkateSpot] = []
        
//        let validFeatures : [String] = selectedFeatures.filter{$0.value == true}.map({ $0.key })
//        let validTags : [String] = selectedTags.filter{$0.value == true}.map({ $0.key })
//
//        for spot in skateSpotRepository.skate_spots {
//            var containsFeature : Bool = false
//            var containsTag : Bool = false
//            if (spot.features.filter{validFeatures.contains($0)}).count > 0 || validFeatures.count == 0{
//                containsFeature = true
//            }
//            if (spot.tags.filter{validTags.contains($0)}).count > 0 || validTags.count == 0{
//                containsTag = true
//            }
//
//            if containsTag && containsFeature{
//                spots.append(spot)
//            }
//        }
        for spot in skateSpotRepository.skate_spots{
            if validFeatures(skateSpot: spot)
                && validTags(skateSpot: spot)
                && validRating(skateSpot: spot)
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
    
    func validRating(skateSpot : SkateSpot) -> Bool{
        if skateSpot.rating_avg >= Float(minAvgRating){
            return true
        }
        return false
    }
    
    func validKickout(skateSpot : SkateSpot) -> Bool {
        
    }
    
    

    
}
