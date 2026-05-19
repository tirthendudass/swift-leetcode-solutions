//
//  LongestSubstring.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 17/05/26.
//

import Foundation

// MARK: - LeetCode 3: Longest Substring Without Repeating Characters

/*
 Problem:
 Given a string s, find the length of the longest substring
 without repeating characters.

 A substring is a contiguous sequence of characters.

 Example 1:
 Input: s = "abcabcbb"
 Output: 3

 Explanation:
 The answer is "abc", with length 3.

 Example 2:
 Input: s = "bbbbb"
 Output: 1

 Explanation:
 The answer is "b", with length 1.

 Example 3:
 Input: s = "pwwkew"
 Output: 3

 Explanation:
 The answer is "wke", with length 3.

 Approach:
 - Use Sliding Window + HashMap
 - Maintain a window using left and right pointers
 - Store latest index of each character in dictionary
 - If duplicate character is found inside current window:
   move left pointer after previous occurrence
 - Continuously calculate maximum window length
 */

func lengthOfLongestSubstring(_ s: String) -> Int {

    // Convert String into Array
    // for easier index access
    let chars = Array(s)

    // Dictionary stores:
    // Character -> latest index
    var map = [Character: Int]()

    // Left pointer of sliding window
    var left = 0

    // Stores maximum substring length
    var maxLength = 0

    // Right pointer expands the window
    for right in 0..<chars.count {

        // Check if character already exists
        // inside current window
        if let index = map[chars[right]],
           index >= left {

            // Move left pointer
            // after duplicate character
            left = index + 1
        }

        // Store latest index of character
        map[chars[right]] = right

        // Current window length
        let currentLength = right - left + 1

        // Update maximum length
        maxLength = max(maxLength, currentLength)
    }

    return maxLength
}

/*
 Time Complexity:
 O(n)

 - Each character is visited at most once
 - Both pointers move only forward

 where:
 n = length of string

 Space Complexity:
 O(k)

 - Dictionary stores unique characters

 where:
 k = number of unique characters
 */
