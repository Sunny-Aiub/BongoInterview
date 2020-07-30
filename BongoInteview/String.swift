//
//  String.swift
//  BongoInteview
//
//  Created by Sunny Chowdhury on 7/30/20.
//  Copyright © 2020 Sunny Chowdhury. All rights reserved.
//

import Foundation

extension String {
 
    func index(at position: Int, from start: Index? = nil) -> Index? {
        let startingIndex = start ?? startIndex
        return index(startingIndex, offsetBy: position, limitedBy: endIndex)
    }
 
    func character(at position: Int) -> Character? {
        guard position >= 0, let indexPosition = index(at: position) else {
            return nil
        }
        return self[indexPosition]
    }
}
