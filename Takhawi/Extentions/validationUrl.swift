//
//  validationUrl.swift
//  Takhawi
//
//  Created by Reham Ayman on 10/02/1446 AH.
//

import Foundation
extension String {
    func isValidHttpsUrl() -> Bool {
        // Step 1: Create a URL object from the string
        guard let url = URL(string: self ) else {
            return false
        }
        
        // Step 2: Check if the URL is valid (i.e., the URL object is not nil)
        // This step is implicitly covered by the `guard let` statement above
        
        // Step 3: Verify the scheme of the URL
        return url.scheme == "https"
    }
}
