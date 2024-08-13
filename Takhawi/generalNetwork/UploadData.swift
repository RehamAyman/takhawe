//
//  UploadData.swift
//
//  Created by AAIT
//

import Foundation

struct UploadData {
    var data: Data
    var fileName: String
    var mimeType:   mimeType
    var name: String
}

struct ImageViewerItem {
    var id: Int?
    var url: String?
    var dataImage: Data?
    var type: String
    var mimeType: mimeType? = .jpg
}

enum mimeType: String {
    case jpg = "image/jpg"
    case pdf = "application/pdf"
    case m4a = "audio/x-m4a"
    case mp4 = "video/mp4"
    case audio = "audio/m4a"

}
