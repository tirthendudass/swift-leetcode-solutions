//
//  LongestCommonPrefix.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 29/05/26.
//

import Foundation

// MARK: - LeetCode 14: Longest Common Prefix

/*
 Problem:
 Write a function to find the longest common prefix
 string amongst an array of strings.

 If there is no common prefix,
 return an empty string "".

 Example:
 strs = ["flower","flow","flight"]

 Output:
 "fl"

 --------------------------------------------------

 Approach:
 - Use Horizontal Scanning technique
 - Take the first string as the initial prefix
 - Compare the prefix with every other string
 - If current string does not start with prefix:
      keep removing last character from prefix
 - Continue until all strings match the prefix
 - If prefix becomes empty,
      return ""

 This gives O(n * m) time complexity.

 where:
 n = number of strings
 m = length of prefix
 */

func longestCommonPrefix(_ strs: [String]) -> String {

    // Edge Case
    guard !strs.isEmpty else {
        return ""
    }

    // Start with first string as prefix
    var prefix = strs[0]

    // Compare with remaining strings
    for str in strs.dropFirst() {

        // Keep shrinking prefix until match found
        while !str.hasPrefix(prefix) {

            prefix.removeLast()

            // No common prefix exists
            if prefix.isEmpty {
                return ""
            }
        }
    }

    return prefix
}

// MARK: - Time and Space Complexity

/*
 Time Complexity:
 O(n * m)

 n = number of strings
 m = length of prefix

 Space Complexity:
 O(1)
 - No extra space used
 */

// MARK: - Dry Run

/*
 Input:
 strs = ["flower","flow","flight"]

 --------------------------------------------------

 Initial State:

 prefix = "flower"

 --------------------------------------------------

 Iteration 1:

 Current string:
 "flow"

 Does "flow" start with "flower"?
 No

 Remove last character:

 prefix = "flowe"

 Does "flow" start with "flowe"?
 No

 Remove last character:

 prefix = "flow"

 Does "flow" start with "flow"?
 Yes

 --------------------------------------------------

 Iteration 2:

 Current string:
 "flight"

 Does "flight" start with "flow"?
 No

 Remove last character:

 prefix = "flo"

 Does "flight" start with "flo"?
 No

 Remove last character:

 prefix = "fl"

 Does "flight" start with "fl"?
 Yes

 --------------------------------------------------

 Final Output:
 "fl"

 --------------------------------------------------

 Common Prefix:
 "fl"
 */
