//
//  Response.swift
//  RandomUserWithCombine
//
//  Created by Sy Lee on 2022/04/12.
//

import Foundation

struct RandomUserResponse: Codable {
    let results: [RandomUser]
    let info: Info
}
// results
struct RandomUser: Codable, Identifiable {
    let id = UUID()
    let gender: String
    let location: Location
    let name: Name
    let photo: Photo
    private enum CodingKeys: String, CodingKey {
        case gender, name, location
        case photo = "picture"
    }
    var profileImgUrl: URL {
        get{
            URL(string: photo.medium)!
        }
    }
}
// MARK: - Location
struct Location: Codable {
//    let street: Street
    let city, state: String
    let country: Country
//    let postcode: Postcode
//    let coordinates: Coordinates
//    let timezone: Timezone
}
enum Country: String, Codable {
    case australia = "Australia"
    case brazil = "Brazil"
    case canada = "Canada"
    case denmark = "Denmark"
    case finland = "Finland"
    case france = "France"
    case germany = "Germany"
    case iran = "Iran"
    case ireland = "Ireland"
    case netherlands = "Netherlands"
    case newZealand = "New Zealand"
    case norway = "Norway"
    case spain = "Spain"
    case switzerland = "Switzerland"
    case turkey = "Turkey"
    case unitedKingdom = "United Kingdom"
    case unitedStates = "United States"
}

struct Name: Codable {
    let title: String
    let first: String
    let last: String

}
struct Photo: Codable {
    let large: String
    let medium: String
    let thumbnail: String
} //results End

// info
struct Info: Codable {
    let seed: String
    let resultsCount: Int
    let page: Int
    let version: String
    private enum CodingKeys: String, CodingKey {
        case seed
        case resultsCount = "results"
        case page
        case version
    }
} // info End

//// MARK: - RandomUsersResponse
//struct Response: Codable {
//    let results: [RandomUser]
//    let info: Info
//}
//
//// MARK: - Info
//struct Info: Codable {
//    let seed: String
//    let results, page: Int
//    let version: String
//}
//
//// MARK: - Result
//struct RandomUser: Codable, Identifiable {
//    var id = UUID()
//
//    let gender: Gender
//    let name: NameClass
//    let location: Location
//    let email: String
//    let login: Login
//    let dob, registered: Dob
//    let phone, cell: String
//    let idInfo: ID
//    let picture: Picture
//    let nat: Nat
//
//    enum CodingKeys: String, CodingKey {
//        case gender, name, location, email, login, dob, registered, phone, cell, picture, nat
//        case idInfo = "id"
//    }
//}
//
//// MARK: - Dob
//struct Dob: Codable {
//    let date: String
//    let age: Int
//}
//
//enum Gender: String, Codable {
//    case female = "female"
//    case male = "male"
//}
//
//// MARK: - ID
//struct ID: Codable {
//    let name: NameEnum
//    let value: String?
//}
//
//enum NameEnum: String, Codable {
//    case avs = "AVS"
//    case bsn = "BSN"
//    case cpr = "CPR"
//    case dni = "DNI"
//    case empty = ""
//    case fn = "FN"
//    case hetu = "HETU"
//    case insee = "INSEE"
//    case nino = "NINO"
//    case pps = "PPS"
//    case ssn = "SSN"
//    case tfn = "TFN"
//}
//
//// MARK: - Location
//struct Location: Codable {
//    let street: Street
//    let city, state: String
//    let country: Country
//    let postcode: Postcode
//    let coordinates: Coordinates
//    let timezone: Timezone
//}
//
//// MARK: - Coordinates
//struct Coordinates: Codable {
//    let latitude, longitude: String
//}
//
//enum Country: String, Codable {
//    case australia = "Australia"
//    case brazil = "Brazil"
//    case canada = "Canada"
//    case denmark = "Denmark"
//    case finland = "Finland"
//    case france = "France"
//    case germany = "Germany"
//    case iran = "Iran"
//    case ireland = "Ireland"
//    case netherlands = "Netherlands"
//    case newZealand = "New Zealand"
//    case norway = "Norway"
//    case spain = "Spain"
//    case switzerland = "Switzerland"
//    case turkey = "Turkey"
//    case unitedKingdom = "United Kingdom"
//    case unitedStates = "United States"
//}
//
//enum Postcode: Codable {
//    case integer(Int)
//    case string(String)
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode(Int.self) {
//            self = .integer(x)
//            return
//        }
//        if let x = try? container.decode(String.self) {
//            self = .string(x)
//            return
//        }
//        throw DecodingError.typeMismatch(Postcode.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Postcode"))
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .integer(let x):
//            try container.encode(x)
//        case .string(let x):
//            try container.encode(x)
//        }
//    }
//}
//
//// MARK: - Street
//struct Street: Codable {
//    let number: Int
//    let name: String
//}
//
//// MARK: - Timezone
//struct Timezone: Codable {
//    let offset, timezoneDescription: String
//
//    enum CodingKeys: String, CodingKey {
//        case offset
//        case timezoneDescription = "description"
//    }
//}
//
//// MARK: - Login
//struct Login: Codable {
//    let uuid, username, password, salt: String
//    let md5, sha1, sha256: String
//}
//
//// MARK: - NameClass
//struct NameClass: Codable {
//    let title: Title
//    let first, last: String
//}
//
//enum Title: String, Codable {
//    case madame = "Madame"
//    case mademoiselle = "Mademoiselle"
//    case miss = "Miss"
//    case monsieur = "Monsieur"
//    case mr = "Mr"
//    case mrs = "Mrs"
//    case ms = "Ms"
//}
//
//enum Nat: String, Codable {
//    case au = "AU"
//    case br = "BR"
//    case ca = "CA"
//    case ch = "CH"
//    case de = "DE"
//    case dk = "DK"
//    case es = "ES"
//    case fi = "FI"
//    case fr = "FR"
//    case gb = "GB"
//    case ie = "IE"
//    case ir = "IR"
//    case nl = "NL"
//    case no = "NO"
//    case nz = "NZ"
//    case tr = "TR"
//    case us = "US"
//}
//
//// MARK: - Picture
//struct Picture: Codable {
//    let large, medium, thumbnail: String
//}
