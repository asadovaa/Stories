//
//  IGSnap.swift
//
//  Created by Ranjith Kumar on 9/28/17
//  Copyright (c) DrawRect. All rights reserved.
//

import Foundation

public enum MimeType: String {
    case image
    case video
    case unknown
}
public class IGSnap: Codable {
    public let internalIdentifier: String
    public let mimeType: String
    public let lastUpdated: String
    public let url: String
    public var kind: MimeType {
        switch mimeType {
        case MimeType.image.rawValue:
            return MimeType.image
        case MimeType.video.rawValue:
            return MimeType.video
        default:
            return MimeType.unknown
        }
    }
    
    public var isDeleted: Bool {
        set{
            UserDefaults.standard.set(newValue, forKey: internalIdentifier)
        }
        get{
            return UserDefaults.standard.value(forKey: internalIdentifier) != nil
        }
    }

    
    init(internalIdentifier: String, mimeType: String, lastUpdated: String, url: String) {
        self.internalIdentifier = internalIdentifier
        self.mimeType = mimeType
        self.lastUpdated = lastUpdated
        self.url = url
    }
    
    enum CodingKeys: String, CodingKey {
        case internalIdentifier = "id"
        case mimeType = "mime_type"
        case lastUpdated = "last_updated"
        case url = "url"
    }
}
