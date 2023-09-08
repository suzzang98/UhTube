//
//  ParsingStruct.swift
//  UhTube
//
//  Created by 이수현 on 2023/09/08.
//

import Foundation

struct Welcome: Codable {
    let kind, etag, nextPageToken, regionCode: String
    let pageInfo: PageInfo
    let items: [Item]
}
// MARK: - Item
struct Item: Codable {
    let kind, etag: String
    let id: ID
    let snippet: Snippet
}

// MARK: - ID
struct ID: Codable {
    let kind: String
    let channelID : String?
    let videoId: String?

    enum CodingKeys: String, CodingKey {
        case kind
        case channelID = "channelId"
        case videoId
    }
}

// MARK: - Snippet
struct Snippet: Codable {
    let publishedAt: String
    let channelID, title, description: String
    let thumbnails: Thumbnails
    let channelTitle, liveBroadcastContent: String
    let publishTime: String

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title, description, thumbnails, channelTitle, liveBroadcastContent, publishTime
    }
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high: Default

        enum CodingKeys: String, CodingKey {
            case thumbnailsDefault = "default"
            case medium, high
        }
}

// MARK: - Default
struct Default: Codable {
    let url: URL
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int
}
