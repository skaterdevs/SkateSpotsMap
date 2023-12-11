//
//  MarkerViewModel.swift
//  SkateSpotsMap
//
//  Created by Jason on 11/9/23.
//

import Foundation
import Combine
import GoogleMaps
import UIKit

// Allow to resize UIImage
// From https://www.advancedswift.com/resize-uiimage-no-stretching-swift/
extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
}

class MarkerViewModel: ObservableObject {
    @Published var skateSpotRepository = SkateSpotRepository()
    @Published var skateSpotMarkers: [GMSMarker] = []
    @Published var selectedSkateSpot: SkateSpot?
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        skateSpotRepository.$skate_spots.map {skateSpots in
            skateSpots.map {skateSpot in
                let coordinate = CLLocationCoordinate2D(latitude: skateSpot.location.latitude,                                      longitude: skateSpot.location.longitude)
                let marker = GMSMarker(position: coordinate)
                marker.title = skateSpot.name
                marker.userData = skateSpot
                
                // Set marker icon based on kickout factor
                switch skateSpot.overall_kickout {
                case Kickout.low.rawValue:
                    marker.icon = UIImage(named: "low")!.scalePreservingAspectRatio(targetSize: CGSize(width: 56, height: 56))
                case Kickout.medium.rawValue:
                    marker.icon = UIImage(named: "medium")!.scalePreservingAspectRatio(targetSize: CGSize(width: 56, height: 56))
                case Kickout.high.rawValue:
                    marker.icon = UIImage(named: "high")!.scalePreservingAspectRatio(targetSize: CGSize(width: 56, height: 56))
                default:
                    marker.icon = UIImage(named: "neutral")!.scalePreservingAspectRatio(targetSize: CGSize(width: 56, height: 56))
                }
                
                return marker
            }
        }
        .assign(to: \.skateSpotMarkers, on: self)
        .store(in: &cancellables)
    }
}
