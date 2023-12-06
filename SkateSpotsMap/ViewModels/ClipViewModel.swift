//
//  ClipViewModel.swift
//  SkateSpotsMap
//
//  Created by Jason Perez on 12/5/23.
//

import Foundation

class ClipViewModel {
    private var clipRepository = ClipsRepository()
    
    func post(clip: Clip) {
        clipRepository.create(clip)
    }
}
