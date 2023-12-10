//
//  SearchViewModel.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/7/23.
//

import Foundation

class SearchViewModel: ObservableObject {
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
    
}
