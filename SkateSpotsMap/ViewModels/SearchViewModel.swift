//
//  SearchViewModel.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/7/23.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var kickout : String
    @Published var minAvgRating : Int
    @Published var maxDistance : Double
//    @Published var selectedFeatures : [String:Bool] = ["Walls" : false,
//                                                       "Banks" : false,
//                                                       "Ledges" : false,
//                                                       "Curbs" : false]
    @Published var selectedFeatures : [String] = []
    
    init(){
        kickout = "Low"
        minAvgRating = 3
        maxDistance = 5.0
//        self.selectedFeatures = []
//        self.selectedTags = []
    }
//
//    func clearAll(){
//
//    }
    func updateFeatures(inputKickout:String, inputMinAvgRating:Int, inputMaxDistance:Double){
        print("test")
        kickout = inputKickout
        self.minAvgRating = inputMinAvgRating
        self.maxDistance = inputMaxDistance
    }
    func getFeatureDict() -> [String:Bool] {
        return ["Walls" : false,
                    "Banks" : false,
                    "Ledges" : false,
                    "Curbs" : false]
//        forEach(Feature.allFeatures){ i in
//
//        }
    }
}
