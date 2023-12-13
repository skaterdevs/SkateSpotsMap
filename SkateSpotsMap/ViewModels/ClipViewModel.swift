//
//  ClipViewModel.swift
//  SkateSpotsMap
//
//  Created by Jason Perez on 12/5/23.
//

import Foundation

class ClipViewModel: ObservableObject {
    @Published var clipRepository = ClipsRepository()
    
    func post(clip: Clip) {
        clipRepository.create(clip)
    }
    
    func update(clip: Clip) {
        clipRepository.update(clip)
    }
    
    func findClip(_ id: String) -> Clip? {
        if let clip = clipRepository.clips.first(where: {$0.id == id}) {
            return clip
        } else {
            return nil
        }
    }
}
