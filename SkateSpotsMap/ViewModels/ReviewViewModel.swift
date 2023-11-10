//
//  ReviewViewModel.swift
//  SkateSpotsMap
//
//  Created by Cameron Wu on 11/7/23.
//

import Foundation
//import Combine

class ReviewViewModel: ObservableObject {
    private var skateSpotRepository = SkateSpotRepository()
    // threshhold for which kickoutlevel to assign to a spot
    private let thresh = 1

    init() {
    }

    func add(skateSpot: SkateSpot, review: Review) {
        var skateSpot = skateSpot
        skateSpot.reviews.append(review)
        review.tags.forEach { tag in
            if skateSpot.tags.contains(tag) {
                skateSpot.tags.append(tag)
            }
        }

        skateSpot = updateKickoutVotes(spot: skateSpot, kickout: review.kickout, x: 1)
        skateSpot.overall_kickout = calculateKickout(skateSpot)

        skateSpot.rating_sum += review.rating
        skateSpot.rating_avg = Float(skateSpot.rating_sum) / Float(skateSpot.reviews.count)
        
        skateSpotRepository.update(skateSpot)
    }
  
    func destroy(skateSpot: SkateSpot, review: Review) {
        var skateSpot = skateSpot
        skateSpot.reviews = skateSpot.reviews.filter {$0 != review}
        
        let allTags = skateSpot.reviews.flatMap {$0.tags}
        let removeTags = review.tags.filter {!(allTags.contains($0))}
        skateSpot.tags = skateSpot.tags.filter {!(removeTags.contains($0))}
        
        skateSpot.rating_sum -= review.rating
        skateSpot.rating_avg = Float(skateSpot.rating_sum) / Float(skateSpot.reviews.count)
        
        skateSpot = updateKickoutVotes(spot: skateSpot, kickout: review.kickout, x: -1)
        skateSpot.overall_kickout = calculateKickout(skateSpot)
        
        skateSpotRepository.update(skateSpot)
    }

    private func updateKickoutVotes(spot: SkateSpot, kickout: String, x: Int) -> SkateSpot {
        var spot = spot
        switch kickout {
        case "High":
            spot.high_kickout += x
        case "Medium":
            spot.medium_kickout += x
        case "Low":
            spot.low_kickout += x
        default:
            print("No kickout selected")
        }
        return spot
    }
    private func calculateKickout(_ spot: SkateSpot) -> String {
        if spot.low_kickout > (max(spot.medium_kickout,spot.high_kickout)+thresh) {
            return Kickout.low.rawValue
        } else if spot.medium_kickout > (max(spot.low_kickout,spot.high_kickout)+thresh) {
            return Kickout.medium.rawValue
        } else if spot.high_kickout > (max(spot.low_kickout,spot.medium_kickout)+thresh) {
            return Kickout.high.rawValue
        }
        return spot.overall_kickout
    }
}
