//
//  Movie.swift
//  StantMovieDb
//
//  Created by GDX on 27/10/22.
//

import Foundation

// MARK: - Movie
struct Movie: Codable {
    let backdropPath: String?
    let createdBy: CreatedBy?
    let movieDescription: String?
    let id: Int?
    let iso3166_1: String?
    let iso639_1: ISO639_1?
    let name: String?
    let objectIDS: [String: String?]?
    let page: Int?
    let posterPath: String?
    let results: [Result]?
    let runtime: Int?
    let sortBy: String?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case createdBy = "created_by"
        case movieDescription = "description"
        case id
        case iso3166_1 = "iso_3166_1"
        case iso639_1 = "iso_639_1"
        case name
        case objectIDS = "object_ids"
        case page
        case posterPath = "poster_path"
        case results, runtime
        case sortBy = "sort_by"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - CreatedBy
struct CreatedBy: Codable {
    let gravatarHash, id, name, username: String?

    enum CodingKeys: String, CodingKey {
        case gravatarHash = "gravatar_hash"
        case id, name, username
    }
}

enum ISO639_1: String, Codable {
    case en = "en"
}

// MARK: - Result
struct Result: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: ISO639_1?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
}
