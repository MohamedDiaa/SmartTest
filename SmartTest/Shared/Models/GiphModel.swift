//
//  GiphModel.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-11-02.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let data: [Datum]?
    let pagination: Pagination?
    let meta: Meta?
}

// MARK: - Datum
struct Datum: Codable {
    let type: TypeEnum?
    let id: String?
    let url: String?
    let slug: String?
    let bitlyGIFURL, bitlyURL: String?
    let embedURL: String?
    let username: String?
    let source: String?
    let title: String?
    let rating: Rating?
    let contentURL: String?
    let sourceTLD: String?
    let sourcePostURL: String?
    let isSticker: Int?
    let importDatetime, trendingDatetime: String?
    let images: Images?
    let analyticsResponsePayload: String?
    let analytics: Analytics?
    let user: User?
    
    enum CodingKeys: String, CodingKey {
        case type, id, url, slug
        case bitlyGIFURL
        case bitlyURL
        case embedURL
        case username, source, title, rating
        case contentURL
        case sourceTLD
        case sourcePostURL
        case isSticker
        case importDatetime
        case trendingDatetime
        case images
        case analyticsResponsePayload
        case analytics, user
    }
}

// MARK: - Analytics
struct Analytics: Codable {
    let onload, onclick, onsent: Onclick?
}

// MARK: - Onclick
struct Onclick: Codable {
    let url: String?
}

// MARK: - Images
struct Images: Codable {
    let original: FixedHeight?
    let downsized, downsizedLarge, downsizedMedium: The480_WStill?
    let downsizedSmall: DownsizedSmall?
    let downsizedStill: The480_WStill?
    let fixedHeight, fixedHeightDownsampled, fixedHeightSmall: FixedHeight?
    let fixedHeightSmallStill, fixedHeightStill: The480_WStill?
    let fixedWidth, fixedWidthDownsampled, fixedWidthSmall: FixedHeight?
    let fixedWidthSmallStill, fixedWidthStill: The480_WStill?
    let looping: Looping?
    let originalStill: The480_WStill?
    let originalMp4, preview: DownsizedSmall?
    let previewGIF, previewWebp, the480WStill: The480_WStill?
    let hd: DownsizedSmall?
    
    enum CodingKeys: String, CodingKey {
        case original, downsized
        case downsizedLarge
        case downsizedMedium
        case downsizedSmall
        case downsizedStill
        case fixedHeight
        case fixedHeightDownsampled
        case fixedHeightSmall
        case fixedHeightSmallStill
        case fixedHeightStill
        case fixedWidth
        case fixedWidthDownsampled
        case fixedWidthSmall
        case fixedWidthSmallStill
        case fixedWidthStill
        case looping
        case originalStill
        case originalMp4
        case preview
        case previewGIF
        case previewWebp
        case the480WStill
        case hd
    }
}

// MARK: - The480_WStill
struct The480_WStill: Codable {
    let height, width, size: String?
    let url: String?
}

// MARK: - DownsizedSmall
struct DownsizedSmall: Codable {
    let height, width, mp4Size: String?
    let mp4: String?
    
    enum CodingKeys: String, CodingKey {
        case height, width
        case mp4Size
        case mp4
    }
}

// MARK: - FixedHeight
struct FixedHeight: Codable {
    let height, width, size: String?
    let url: String?
    let mp4Size: String?
    let mp4: String?
    let webpSize: String?
    let webp: String?
    let frames, hash: String?
    
    enum CodingKeys: String, CodingKey {
        case height, width, size, url
        case mp4Size
        case mp4
        case webpSize
        case webp, frames, hash
    }
}

// MARK: - Looping
struct Looping: Codable {
    let mp4Size: String?
    let mp4: String?
    
    enum CodingKeys: String, CodingKey {
        case mp4Size
        case mp4
    }
}

enum Rating: String, Codable {
    case g = "g"
}

enum TypeEnum: String, Codable {
    case gif = "gif"
}

// MARK: - User
struct User: Codable {
    let avatarURL, bannerImage, bannerURL: String?
    let profileURL: String?
    let username, displayName, userDescription: String?
    let isVerified: Bool?
    
    enum CodingKeys: String, CodingKey {
        case avatarURL
        case bannerImage
        case bannerURL
        case profileURL
        case username
        case displayName
        case userDescription
        case isVerified
    }
}

// MARK: - Meta
struct Meta: Codable {
    let status: Int?
    let msg, responseID: String?
    
    enum CodingKeys: String, CodingKey {
        case status, msg
        case responseID
    }
}

// MARK: - Pagination
struct Pagination: Codable {
    let totalCount, count, offset: Int?
    
    enum CodingKeys: String, CodingKey {
        case totalCount
        case count, offset
    }
}
