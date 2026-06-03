//
//  LongestCommonPrefix.swift
//  LeetcodeProblems
//
//  Created by Tirthendu on 02/04/26.
//

import Foundation

// MARK: - LeetCode 14: Longest Common Prefix

/*
 Problem:
 Write a function to find the longest common prefix
 string amongst an array of strings.

 If there is no common prefix,
 return an empty string "".

 Example 1:
 Input: ["flower","flow","flight"]
 Output: "fl"

 Example 2:
 Input: ["dog","racecar","car"]
 Output: ""

 Approach:
 - Assume first string is the common prefix
 - Compare this prefix with every other string
 - While current string does not start with prefix:
      Remove the last character from prefix
 - Continue until all strings match the prefix
 - If prefix becomes empty, return ""
 */

func longestCommonPrefix(_ strs: [String]) -> String {

    // Edge case
    guard !strs.isEmpty else {
        return ""
    }

    // Assume first string is the answer
    var prefix = strs[0]

    // Compare with remaining strings
    for str in strs {

        // Shrink prefix until match found
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
 m = length of shortest string

 In worst case, characters are compared
 multiple times while shrinking prefix.

 Space Complexity:
 O(1)

 No extra space used
 except the prefix variable.
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

 str = "flower"

 Check:
 "flower".hasPrefix("flower")
 -> true

 prefix = "flower"

 --------------------------------------------------

 Iteration 2:

 str = "flow"

 Check:
 "flow".hasPrefix("flower")
 -> false

 Remove last character

 prefix = "flowe"

 Check again:
 "flow".hasPrefix("flowe")
 -> false

 Remove last character

 prefix = "flow"

 Check:
 "flow".hasPrefix("flow")
 -> true

 --------------------------------------------------

 Iteration 3:

 str = "flight"

 Check:
 "flight".hasPrefix("flow")
 -> false

 Remove last character

 prefix = "flo"

 Check:
 "flight".hasPrefix("flo")
 -> false

 Remove last character

 prefix = "fl"

 Check:
 "flight".hasPrefix("fl")
 -> true

 --------------------------------------------------

 Final Prefix:

 prefix = "fl"

 Return:
 "fl"

 --------------------------------------------------

 Output:
 "fl"
 */
