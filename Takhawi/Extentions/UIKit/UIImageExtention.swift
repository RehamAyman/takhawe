//
//  UIImageExtention.swift
//  WritingService
//
//  Created by Sara Mady on 06/04/2023.
//

import Foundation
import UIKit
extension UIImage {

    var highestQualityJPEGNSData: Data { return self.jpegData(compressionQuality: 1.0)! }
    var highQualityJPEGNSData: Data { return self.jpegData(compressionQuality: 0.75)!}
    var mediumQualityJPEGNSData: Data { return self.jpegData(compressionQuality: 0.5)! }
    var lowQualityJPEGNSData: Data { return self.jpegData(compressionQuality: 0.25)!}
    var lowestQualityJPEGNSData: Data { return self.jpegData(compressionQuality: 0.0)! }

}
