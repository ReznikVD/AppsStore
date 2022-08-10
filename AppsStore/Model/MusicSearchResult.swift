//
//  MusicResult.swift
//  AppsStore
//
//  Created by Владислав Резник on 10.08.2022.
//

import UIKit

struct MusicSearchResult: Decodable {
    let resultCount: Int
    let results: [MusicResult]
}

struct MusicResult: Decodable {
    let artistId: Int?
    let artistName: String?
    let artworkUrl100: String
    let collectionName: String?
    let trackName: String
}
