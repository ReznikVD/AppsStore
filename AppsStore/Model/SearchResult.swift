//
//  SearchResult.swift
//  AppsStore
//
//  Created by Владислав Резник on 05.07.2022.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackId: Int
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let artworkUrl100: String // app icon
    let screenshotUrls: [String]
    let formattedPrice: String?
    let description: String
    let releaseNotes: String?
}
